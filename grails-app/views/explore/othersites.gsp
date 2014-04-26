<%--
  Created by IntelliJ IDEA.
  User: Wei
  Date: 2014/4/22
  Time: 22:20
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="general" />
    <title>Explore</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-9">
            <div class="page-header">
                <h3>All Other Sites</h3>
            </div>
            <g:render template="/common/siteslist" model="[sites:siteslist,follow:true]" />
        </div>
        <div class="col-xs-3">
            <div class="page-header">
                <h3>&nbsp</h3>
            </div>
        </div>
    </div>
</div>
</body>
</html>