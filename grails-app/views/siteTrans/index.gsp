<%--
  Created by IntelliJ IDEA.
  User: Wei
  Date: 2014/5/10
  Time: 14:42
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="general"/>
    <title>Topic</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-1">
        </div>

        <div class="col-xs-8">
            <div class="page-header">
                <span class="h3">${siteTrans.type}</span>
            </div>

            <div class="topic-detail">
                <g:render template="/vote/sideVote"
                          model="[candidate: siteTrans, type: 'siteTrans', votetype: (siteTrans.votes.find {
                              it.user.id == session.user.id
                          })?.type]"/>
                <div class="form-group">
                    <p>
                        <g:applyCodec encodeAs="none">
                            ${siteTrans.detail}
                        </g:applyCodec>
                    </p>
                </div>
            </div>

            <g:render template="/comment/transComments" model="[comments: siteTrans.comments, id: 's' + siteTrans.id]"/>

        </div>

        <div class="col-xs-3">
            <div class="page-header">
                <h3>&nbsp</h3>
            </div>
            <div class="list-group">
                <g:link class="list-group-item" controller="site" action="maintenance" id="${siteTrans.site.id}"><i
                        class="fa fa-arrow-left"></i>&nbsp;Back to transactions list</g:link>
            </div>
        </div>
    </div>
</div>
</body>
</html>