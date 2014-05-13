<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="row">
            <div class="col-xs-1">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <g:link class="navbar-brand" href="#">Vote</g:link>
                </div>
            </div>

            <div class="col-xs-4">
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Search</button>
                </form>
            </div>

            <div class="col-xs-5">
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <g:if test="${controllerName == "index"}">
                            <li class="active"><g:link controller="index">Home</g:link></li>
                        </g:if>
                        <g:else>
                            <li><g:link controller="index">Home</g:link></li>
                        </g:else>
                        <g:if test="${controllerName == "site"}">
                            <li class="active"><g:link controller="site" action="mysites">Site</g:link></li>
                        </g:if>
                        <g:else>
                            <li><g:link controller="site" action="mysites">Site</g:link></li>
                        </g:else>
                        <g:if test="${controllerName == "explore"}">
                            <li class="active"><g:link controller="explore" action="index">Explore</g:link></li>
                        </g:if>
                        <g:else>
                            <li><g:link controller="explore" action="index">Explore</g:link></li>
                        </g:else>
                        <g:if test="${controllerName == "message"}">
                            <li class="active"><g:link href="#"><span
                                    class="badge pull-right">42</span>Message</g:link></li>
                        </g:if>
                        <g:else>
                            <li><g:link href="#contact">Message<span class="badge">42</span></g:link></li>
                        </g:else>
                    </ul>
                </div>
            </div>

            <div class="col-xs-2">
                <ul class="nav navbar-nav navbar-right">
                    <li class="navbar-text">
                        <div class="login-info">Hi&nbsp;<g:link style="padding:0" controller="user" action="index"
                                             id="${session.user.id}">${session.user.firstname}</g:link>
                        <g:link controller="auth" action="signOut">Logout</g:link>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>