package vote

import com.lucastex.grails.fileuploader.FileUploaderService
import org.apache.shiro.crypto.hash.Sha512Hash

class UserController {

    def index() {
        def user = User.findById(params.id as Long)
        [user:user]
    }

    def settings(){
        def user = User.findById(params.id as Long)
        [user:user]
    }

    def saveProfile(){
        def user = User.findById(params.id as Long)
        def avatarFile = request.getFile('avatar')
        if(!avatarFile.isEmpty()){
            try {
                def fs = new FileUploaderService()
                def trash = user.avatar
                def avatar = fs.saveFile("avatar",request.getFile('avatar'),"avatar" + System.currentTimeMillis(),new Locale('en'))
                user.avatar = avatar
                if(trash){
                    fs.deleteFile(trash.id)
                }
            }catch (Exception e){
                flash.error = e.message
                redirect(action: 'settings',id: user.id)
                return
            }

        }
        user.nickname = params.nickname
        user.description = params.desc
        user.sdescription = params.sdesc
        if(user.validate()){
            user.save()
        }else{
            flash.error = "Error occurs:" + user.errors
        }
        redirect(action: 'settings',id: user.id)
    }

    def changePass(){
        def user = User.findById(params.id as Long)

        if(!(params.newpass == params.confpass)){
            flash.error = "New password not confirmed"
            redirect(action: 'settings',id: user.id)
            return
        }

        def oldhash = new Sha512Hash(params.oldpass).toHex()
        def newhash = new Sha512Hash(params.newpass).toHex()
        if(user.passwordHash.equals(oldhash)){
            user.passwordHash = newhash
        }
        user.save()
        chain(controller: 'auth',action: 'signOut')
    }

    def delete(){
        def user = User.findById(session.user.id as Long)
        def targetUser = User.findById(params.id as Long)
        def topic = Topic.findById(params.topicId as Long)
        def site = topic.site
        def sitetrans = new SiteTrans(detail: "Delete User", user: user, postscript: "Delete User", type: "DeleteUser", status: "Open", site: site, targetDomain: "user", targetId: targetUser.id.toString())
        if(!SiteTrans?.findByTypeAndStatusAndSiteAndTargetId("DeleteUser","Open",site,targetUser.id)){
            if(sitetrans.validate()){
                sitetrans.save()
                flash.message = "Site Transaction created successfully!"
            }else{
                flash.error = "Error occurs"
            }
        }
        redirect(controller: "topic",action: "index",id: topic.id)
        return
    }


}
