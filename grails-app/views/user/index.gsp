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

        <div class="col-xs-8">
            <div class="page-header">
                <h3>User Info</h3>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">${user.lastname}&nbsp;${user.firstname}
                    <span class="help-block">${user.sdescription}</span></div>

                <div class="panel-body">
                    <div class="media">
                        <a class="pull-left" href="#">
                            <g:if test="${user.avatar}">
                                <img class="media-object"
                                     src="${createLink(controller: 'fileUploader', action: 'show', id: user.avatar.id)}"
                                     height="100" width="100">
                            </g:if>
                            <g:else>
                                <r:img uri="/images/avatar/avatar100.png" width="100" height="100"></r:img>
                            </g:else>
                        </a>

                        <div class="media-body">
                            <div class="form-group">
                                <span class="label label-default">Nickname</span><span>&nbsp;${user.nickname}</span>
                            </div>

                            <div class="form-group">
                                <span class="label label-default">Description</span><span>&nbsp;${user.nickname}</span>
                            </div>

                            <div class="form-group">
                                <span class="label label-default">Email</span><span>&nbsp;${user.username}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">User Topics</div>
                <br>

                <div class="panel-body">
                    <g:form>
                        <div id="topiclist">
                            <g:render template="/topic/plainTopicList"
                                      model="[topics: topiclist, page: page, hasMoreTopics: hasMoreTopics, query: user.id]"></g:render>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>

        <div class="col-xs-3">
            <div class="page-header">
                <h3>&nbsp</h3>
            </div>
            <g:if test="${user.id == session.user.id}">
                <div class="list-group">
                    <g:link class="list-group-item" controller="user" action="settings" id="${user.id}"><i
                            class="fa fa-gear"></i>&nbsp;User Settings</g:link>
                </div>
            </g:if>
            <g:else>
                <div class="panel">
                    <div class="panel-body">
                        <g:form controller="user" action="inviteToSite" id="${user.id}">
                            <div class="form-group">
                                Invite User To
                            </div>

                            <div class="form-group">
                                <g:select from="${inviteToSites}" optionKey="id" optionValue="name" class="form-control"
                                          name="siteid">
                                </g:select>
                            </div>
                            <g:submitButton class="btn btn-primary" name="submit" value="Invite"></g:submitButton>
                        </g:form>
                    </div>
                </div>
            </g:else>

        </div>
    </div>
</div>
</body>
</html>