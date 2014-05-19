<%--
  Created by IntelliJ IDEA.
  User: Wei
  Date: 2014/5/6
  Time: 23:02
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="general"/>
    <title>Search Result</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-1">
        </div>

        <div class="col-xs-8">
            <div class="page-header">
                <h3>Results</h3>
            </div>
            <g:render template="/topic/topiclist" model="[topics: topiclist]"></g:render>
        </div>

        <div class="col-xs-3">
            <div class="page-header">
                <h3>&nbsp</h3>
            </div>

            <div class="list-group">
            </div>

        </div>
    </div>
</div>
</body>
</html>