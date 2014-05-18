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
                <li><a href="#account" data-toggle="tab">Account</a></li>
                <li><a href="#password" data-toggle="tab">Password</a></li>
                <li><a href="#messages" data-toggle="tab">Messages</a></li>
                <li><a href="#email" data-toggle="tab">Email</a></li>
                <li><a href="#settings" data-toggle="tab">Settings</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <g:render template="profile"></g:render>

                <div class="tab-pane" id="account">...</div>

                <div class="tab-pane" id="password">...</div>

                <div class="tab-pane" id="messages">...</div>

                <div class="tab-pane" id="email">...</div>

                <div class="tab-pane" id="settings">...</div>
            </div>
        </div>
    </div>
</div>
</body>
</html>