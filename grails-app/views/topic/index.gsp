<%--
  Created by IntelliJ IDEA.
  User: Wei
  Date: 2014/5/10
  Time: 14:42
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="general" />
    <title>Topic</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-1">
        </div>
        <div class="col-xs-8">
            <g:render template="/common/tagsbar" model="[tags:taglist]" ></g:render>
            <g:render template="topicmaint" model="[topic:topic]"/>
        </div>
        <div class="col-xs-3">
            <div class="page-header">
                <h3>&nbsp</h3>
            </div>
            <div class="form-group">
                <g:link class="btn btn-lg btn-info" controller="site" action="index" id="${topic.site.id}">Back to topic list</g:link>
            </div>
            <div class="form-group">
                <g:if test="${topic.type == "discussion"}">
                    <button  type="button" class="btn btn-lg btn-info" data-toggle="modal" data-target="#newContent">Add Opinion</button>
                </g:if>
                <g:elseif test="${topic.type == "question"}">
                    <button  type="button" class="btn btn-lg btn-info" data-toggle="modal" data-target="#newContent">Add Answer</button>
                </g:elseif>
                <g:else>
                    <button  type="button" class="btn btn-lg btn-info" data-toggle="modal" data-target="#newContent">Add Comment</button>
                </g:else>
                <g:render template="newContent" model="[topic:topic]"></g:render>
            </div>
        </div>
    </div>
</div>
</body>
</html>