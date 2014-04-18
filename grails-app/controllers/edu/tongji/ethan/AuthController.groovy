package edu.tongji.ethan

import org.apache.shiro.SecurityUtils
import org.apache.shiro.authc.AuthenticationException
import org.apache.shiro.authc.UsernamePasswordToken
import org.apache.shiro.crypto.hash.Sha512Hash
import org.apache.shiro.web.util.SavedRequest
import org.apache.shiro.web.util.WebUtils

class AuthController {
    def shiroSecurityManager

    def index = { redirect(action: "login", params: params) }

    def login = {
        if (session.getAttribute("userid")){
            redirect(uri: "/")
        }
        return [ username: params.username, rememberMe: (params.rememberMe != null), targetUri: params.targetUri ]
    }

    def register = {
        if (session.getAttribute("userid")){
            redirect(uri: "/")
        }
        return [ username: params.username, targetUri: params.targetUri ]
    }

    def signIn = {
        if (session.getAttribute("userid")){
            redirect(uri: "/")
        }

        def authToken = new UsernamePasswordToken(params.username, params.password as String)

        // Support for "remember me"
        if (params.rememberMe) {
            authToken.rememberMe = true
        }
        
        // If a controller redirected to this page, redirect back
        // to it. Otherwise redirect to the root URI.
        def targetUri = params.targetUri ?: "/"
        
        // Handle requests saved by Shiro filters.
        SavedRequest savedRequest = WebUtils.getSavedRequest(request)
        if (savedRequest) {
            targetUri = savedRequest.requestURI - request.contextPath
            if (savedRequest.queryString) targetUri = targetUri + '?' + savedRequest.queryString
        }
        
        try{
            // Perform the actual login. An AuthenticationException
            // will be thrown if the username is unrecognised or the
            // password is incorrect.
            SecurityUtils.subject.login(authToken)
            session.setAttribute("userid",User.findByUsername(params.username as String))
            log.info "Redirecting to '${targetUri}'."
            redirect(uri: targetUri)
        }
        catch (AuthenticationException ex){
            // Authentication failed, so display the appropriate message
            // on the login page.
            log.info "Authentication failure for user '${params.username}'."
            flash.message = message(code: "login.failed")

            // Keep the username and "remember me" setting so that the
            // user doesn't have to enter them again.
            def m = [ username: params.username ]
            if (params.rememberMe) {
                m["rememberMe"] = true
            }

            // Remember the target URI too.
            if (params.targetUri) {
                m["targetUri"] = params.targetUri
            }

            // Now redirect back to the login page.
            redirect(action: "login", params: m)
        }
    }

    def signUp = {

        if (session.getAttribute("userid")){
            redirect(uri: "/")
        }

        def targetUri = params.targetUri ?: "/"

        SavedRequest savedRequest = WebUtils.getSavedRequest(request)
        if (savedRequest) {
            targetUri = savedRequest.requestURI - request.contextPath
            if (savedRequest.queryString) targetUri = targetUri + '?' + savedRequest.queryString
        }


        if(params.password ==~ "\\S\\S\\S\\S\\S\\S*"){
            if(User.findByUsername(params.username as String)){
                flash.message = message(code: "register.failed.username")
                redirect(action: "register")
            }else{
                def user = new User(username: params.username, passwordHash: new Sha512Hash(params.password).toHex(),firstname: params.firstname,lastname: params.lastname)
                if(user.validate()){
                    if(user.save()){
                        session.setAttribute("userid",user.getId())
                        redirect(uri: "/")
                    }else{
                        user.discard()
                        flash.message = message(code: "register.failed")
                        redirect(action: "register")
                    }
                }else{
                    flash.message = message(code: "register.failed")
                    redirect(action: "register")
                }

            }
        }else{
            flash.message = message(code: "register.failed.password")
            redirect(action: "register")
        }

    }
    def signOut = {
        // Log the user out of the application.
        SecurityUtils.subject?.logout()
        webRequest.getCurrentRequest().session = null

        // For now, redirect back to the home page.
        redirect(uri: "/")
    }

    def unauthorized = {
        render "You do not have permission to access this page."
    }
}
