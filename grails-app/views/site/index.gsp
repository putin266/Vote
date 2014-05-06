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
        <div class="col-xs-9">
            <div class="page-header">
                <h3>Topics</h3>
            </div>
        </div>
        <div class="col-xs-3">
            <div class="page-header">
                <h3>&nbsp</h3>
            </div>
            <g:if test="${accepted}">
            <h4>Create</h4>
            <div class="form-group">
            <g:link type="button" class="btn btn-lg btn-info" controller="site" action="newsite">Discussion</g:link>
            </div>
            <div class="form-group">
            <g:link type="button" class="btn btn-lg btn-info" controller="site" action="newsite">Question</g:link>
            </div>
            <div class="form-group">
            <g:link type="button" class="btn btn-lg btn-info" controller="site" action="newsite">Resource</g:link>
            </div>
            </g:if>
            <g:else>
                <g:link class="btn btn-primary" controller="site" action="follow" id="${site.id}"><span class="glyphicon glyphicon-plus"></span>Follow</g:link>
            </g:else>
        </div>
    </div>
</div>
</body>
</html>