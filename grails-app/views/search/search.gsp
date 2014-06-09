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
            <g:if test="${area == "user"}">
                <g:if test="${userlist?.isEmpty()}">
                    No results
                </g:if>
                <g:else>
                    <g:render template="userList" model="[userlist: userlist]"></g:render>
                </g:else>
            </g:if>
            <g:else>
                <g:if test="${topiclist?.isEmpty()}">
                    No results
                </g:if>
                <g:else>
                    <g:render template="/topic/plainTopicList" model="[topics: topiclist]"></g:render>
                </g:else>
            </g:else>

        </div>

        <div class="col-xs-3">
            <div class="page-header">
                <h3>Search Area</h3>
            </div>

            <div class="list-group">
                <g:link class="list-group-item" action="search" params="[area: 'topic', query: query]">Topics</g:link>
                <g:link class="list-group-item" action="search" params="[area: 'user', query: query]">User</g:link>
            </div>
        </div>
    </div>
</div>
</body>
</html>