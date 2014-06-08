<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="general"/>
    <title>User Settings</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-1">
        </div>

        <div class="col-xs-11">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
                <li><a href="#password" data-toggle="tab">Password</a></li>
                <li><a href="#messages" data-toggle="tab">Messages</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <g:render template="profile" model="[user:user]"></g:render>
                <div class="tab-pane" id="account">
                    <g:link controller="test" action="testEmail">Test Email</g:link>
                </div>

                <g:render template="/user/password" model="[user:user]"></g:render>

                <div class="tab-pane" id="messages">...</div>

                <div class="tab-pane" id="email">...</div>

                <div class="tab-pane" id="settings">...</div>
            </div>
        </div>
    </div>
</div>
</body>
</html>