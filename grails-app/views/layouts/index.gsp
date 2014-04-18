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
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'vote.css')}" type="text/css">
    <g:layoutHead/>
    <r:require module="votejs"/>
    <r:layoutResources />
</head>

<body>
<g:layoutBody/>
<r:layoutResources />
</body>
</html>