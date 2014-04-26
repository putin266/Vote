<%--
  Created by IntelliJ IDEA.
  User: Wei
  Date: 2014/4/20
  Time: 0:05
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="general" />
    <title>My Sites</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-9">
            <div class="page-header">
                <h3>Followed Sites</h3>
            </div>
<g:render template="/common/siteslist" model="[sites:siteslist,appliedsites:appliedsites]" />
        </div>
        <div class="col-xs-3">
            <div class="page-header">
                <h3>&nbsp</h3>
            </div>
            <g:link type="button" class="btn btn-lg btn-info" controller="site" action="newsite">Create a new site</g:link>
        </div>
    </div>
</div>
</body>
</html>