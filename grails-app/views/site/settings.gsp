<%--
  Created by IntelliJ IDEA.
  User: Wei
  Date: 2014/5/15
  Time: 23:35
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="general"/>
    <title>Site Settings</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-1">
        </div>

        <div class="col-xs-11">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#board" data-toggle="tab">Board</a></li>
                <li><a href="#basic" data-toggle="tab">Basic</a></li>
                <li><a href="#profile" data-toggle="tab">Profile</a></li>
                <div class="pull-right" style="line-height: 42px;">
                    <g:link controller="site" action="index" id="${site.id}"><i
                            class="fa fa-arrow-left"></i>&nbsp;Back to topic list</g:link>
                </div>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <g:render template="board" model="[site:site,isAdmin: isAdmin]"></g:render>

                <g:render template="basic_settings" model="[ChangeLogo:ChangeLogo,ChangeTags:ChangeTags,ChangeDesc:ChangeDesc,ChangeType:ChangeType,ChangeName:ChangeName,ChangeRules:ChangeRules,DeleteContent:DeleteContent,DeleteTopic:DeleteTopic,DeleteUser:DeleteUser,createSetting:createSetting,AddNewUser: AddNewUser, changeSetting: changeSetting,site: site, user: user, isAdmin: isAdmin,minvote:minvote,minbest:minbest]"></g:render>

                <g:render template="profile" model="[site:site,isAdmin: isAdmin]"></g:render>
            </div>

        </div>
    </div>
</div>
</body>
</html>