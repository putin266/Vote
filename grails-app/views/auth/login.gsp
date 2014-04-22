<html>
<head>
    <meta name="layout" content="login" />
    <title>Log In</title>
</head>
<body>
<div class="signin-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-md-6 text-center logo-wrapper">
                <div id="logo-big">Vote</div>
                <div id="logo-des">Vote everything for the best</div>
            </div>
            <div class="col-md-6">
                <g:form class="form-signin" role="form" action="signIn">
                    <input type="hidden" name="targetUri" value="${targetUri}" />
                    <h2 class="form-signin-heading">Sign In</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Email" name="username" value="${username}" required="">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Password" name="password" required="">
                    </div>
                    <g:if test="${flash.message}">
                    <div class="form-group">
                      <div class="alert alert-danger">${flash.message}</div>
                    </div>
                    </g:if>
                    <div class="form-group">
                    <label class="checkbox">
                        <g:checkBox  name="remember-me" value="${rememberMe}" />Remember Me
                    </label>
                    </div>
                    <button class="btn btn-lg btn-primary" type="submit">Log In</button>
                    <g:link controller="auth" action="register" class="btn btn-lg btn-default">Sign Up>></g:link>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
