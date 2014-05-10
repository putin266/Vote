<%--
  Created by IntelliJ IDEA.
  User: Wei
  Date: 2014/5/6
  Time: 23:02
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="general" />
    <title>Sites ${site.name}</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-1">
        </div>
        <div class="col-xs-8">
            <div class="page-header">
                <h3>Topics</h3>
            </div>
            <g:render template="/topic/topiclist" model="[topics: topiclist]"></g:render>
        </div>
        <div class="col-xs-3">
            <div class="page-header">
                <h3>&nbsp</h3>
            </div>
            <g:if test="${accepted}">
            <div class="form-group">
            <button  type="button" class="btn btn-lg btn-info" data-toggle="modal" data-target="#newTopic">Create Topic</button>
            </div>
            <g:render template="/site/newtopic"></g:render>
            </g:if>
            <g:else>
                <g:link class="btn btn-primary" controller="site" action="follow" id="${site.id}"><span class="glyphicon glyphicon-plus"></span>Follow</g:link>
            </g:else>
        </div>
    </div>
</div>
</body>
</html>