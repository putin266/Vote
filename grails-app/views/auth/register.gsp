<html>
<head>
    <meta name="layout" content="index" />
    <title>Sign Up</title>
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
                <g:form class="form-signin" role="form" action="signUp">
                    <input type="hidden" name="targetUri" value="${targetUri}" />
                    <h2 class="form-signin-heading">Sign Up</h2>
                    <div class="form-group">
                        <input type="text" class="form-control half-form-control" placeholder="First Name" name="firstname" value="${firstname}" required="">
                        <input type="text" class="form-control half-form-control" placeholder="Last Name" name="lastname" value="${lastname}" required="">
                    </div>
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
                    <button class="btn btn-lg btn-primary" type="submit">Sign Up</button>
                    <g:link controller="auth" action="login" class="btn btn-lg btn-default">Log In>></g:link>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
