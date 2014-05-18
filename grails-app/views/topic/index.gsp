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
            <div class="list-group">
                <g:link class="list-group-item" controller="site" action="index" id="${topic.site.id}"><i class="fa fa-arrow-left"></i>&nbsp;Back to topic list</g:link>
                <g:if test="${topic.type == "discussion"}">
                    <a class="list-group-item" data-toggle="modal" data-target="#newContent"><i class="fa fa-comment"></i>&nbsp;Add Opinion</a>
                </g:if>
                <g:elseif test="${topic.type == "question"}">
                    <a  class="list-group-item" data-toggle="modal" data-target="#newContent"><i class="fa fa-comment"></i>&nbsp;Add Answer</a>
                </g:elseif>
                <g:else>
                    <a class="list-group-item" data-toggle="modal" data-target="#newContent"><i class="fa fa-comment"></i>&nbsp;Add Comment</a>
                </g:else>
                <g:render template="newContent" model="[topic:topic]"></g:render>
            </div>
        </div>
    </div>
</div>
</body>
</html>