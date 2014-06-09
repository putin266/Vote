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
    <title>Vote</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-1">
        </div>

        <div class="col-xs-8">
            <div class="page-header">
                <h3>New Feed</h3>
            </div>
            <g:form>
                <div id="topiclist">
                    <g:render template="/topic/topiclist"
                              model="[topics: topiclist, user: user, page: page, hasMore: hasMore, domain: user]"/>
                </div>
            </g:form>
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