<%--
  Created by IntelliJ IDEA.
  User: Wei
  Date: 2014/4/18
  Time: 20:06
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Vote"/></title>
    <r:require module="votecss"></r:require>
    <g:layoutHead/>
    <r:require module="votejs"/>
    <r:layoutResources />
</head>
<body>
<g:render template="/common/header"></g:render>
<g:if test="${flash.message}">
    <div class="container">
        <div class="alert alert-info">
            ${flash.message}
        </div>
    </div>
</g:if>
<g:if test="${flash.get("error")}">
    <div class="container">
        <div class="alert alert-danger">
            ${flash.get("error")}
        </div>
    </div>
</g:if>
<g:layoutBody/>
<r:layoutResources />
</body>
</html>