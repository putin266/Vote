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

            <div class="list-group">
                <g:if test="${accepted}">

                    <a class="list-group-item" data-toggle="modal"
                            data-target="#newTopic"><i class="fa fa-tag"></i>&nbsp;Create Topic</a>

                    <g:render template="/site/newtopic" model="[site:site]"></g:render>

                    <g:link class="list-group-item" action="settings" id="${site.id}"><i class="fa fa-gear"></i>&nbsp;Site Settings</g:link>
                    <g:link class="list-group-item" id="${site.id}" action="maintenance"><i class="fa fa-gavel"></i>&nbsp;Site Maintenance</g:link>
                </g:if>
                <g:else>
                    <g:link class="list-group-item" controller="site" action="follow" id="${site.id}"><i
                            class="fa fa-plus"></i>&nbsp;Follow</g:link>
                </g:else>
            </div>

        </div>
    </div>
</div>
</body>
</html>