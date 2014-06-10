<%--
  Created by IntelliJ IDEA.
  User: Wei
  Date: 2014/5/10
  Time: 14:42
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="general"/>
    <title>Topic</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-1">
        </div>

        <div class="col-xs-8">
            <div class="page-header">
                <span class="h3">${siteTrans.type}</span>
            </div>

            <div class="topic-detail">
                <g:render template="/vote/sideVote"
                          model="[candidate: siteTrans, type: 'siteTrans', votetype: (siteTrans.votes.find {
                              it.user.id == session.user.id
                          })?.type]"/>
                <div class="form-group">
                    <p>
                        <g:if test="${siteTrans.type.equals("AddNewUser")}">
                            Add new user, <g:link controller="user" action="index"
                                                  id="${siteTrans.targetId}">Click for detail</g:link>
                        </g:if>
                        <g:elseif test="${siteTrans.type.equals("changeSetting")}">
                            Change setting name: ${siteTrans.targetDomain} to value : ${siteTrans.detail}
                        </g:elseif>
                        <g:elseif test="${siteTrans.type.equals("createSetting")}">
                            Create setting name: ${siteTrans.targetDomain} to value : ${siteTrans.detail}
                        </g:elseif>
                        <g:elseif test="${siteTrans.type.equals("DeleteUser")}">
                            Delete user from the site, <g:link controller="user" action="index"
                                                               id="${siteTrans.targetId}">Click for detail</g:link>
                        </g:elseif>
                        <g:elseif test="${siteTrans.type.equals("DeleteTopic")}">
                            Delete topic from the site, <g:link controller="topic" action="index"
                                                                id="${siteTrans.targetId}">Click for detail</g:link>
                        </g:elseif>
                        <g:elseif test="${siteTrans.type.equals("DeleteContent")}">
                            Delete content from the site, <g:link controller="topic" action="index"
                                                                  id="${siteTrans.detail}">Click for detail</g:link>
                        </g:elseif>
                        <g:elseif test="${siteTrans.type.equals("ChangeRules")}">
                            Change rules to:<br>
                            <g:applyCodec encodeAs="none">
                                ${siteTrans.detail}
                            </g:applyCodec>
                        </g:elseif>
                        <g:elseif test="${siteTrans.type.equals("ChangeType")}">
                            Change type to: ${siteTrans.detail}
                        </g:elseif>
                        <g:elseif test="${siteTrans.type.equals("ChangeName")}">
                            Change name to: ${siteTrans.detail}
                        </g:elseif>
                        <g:elseif test="${siteTrans.type.equals("ChangeDesc")}">
                            Change description to: ${siteTrans.detail}
                        </g:elseif>
                        <g:elseif test="${siteTrans.type.equals("ChangeTags")}">
                            Change tags to: ${siteTrans.detail}
                        </g:elseif>
                        <g:elseif test="${siteTrans.type.equals("ChangeLogo")}">
                            Change logo to: <br>
                            <img src="${createLink(controller:'fileUploader', action:'show', id:siteTrans.detail )}" width="100" height="100" class="media-object"/>
                        </g:elseif>
                    </p>
                </div>
            </div>
            <g:if test="${canEdit}">
                <div>
                    <g:link action="close" id="${siteTrans.id}">Close Transaction</g:link>
                </div>
            </g:if>

            <g:render template="/comment/transComments" model="[comments: siteTrans.comments, id: 's' + siteTrans.id]"/>

        </div>

        <div class="col-xs-3">
            <div class="page-header">
                <h3>&nbsp</h3>
            </div>

            <div class="list-group">
                <g:link class="list-group-item" controller="site" action="maintenance" id="${siteTrans.site.id}"><i
                        class="fa fa-arrow-left"></i>&nbsp;Back to transactions list</g:link>
            </div>
        </div>
    </div>
</div>
</body>
</html>