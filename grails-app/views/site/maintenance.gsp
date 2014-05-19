<%--
  Created by IntelliJ IDEA.
  User: Wei
  Date: 2014/5/15
  Time: 23:35
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="general"/>
    <title>Site Settings</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-1">
        </div>

        <div class="col-xs-11">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <g:if test="${isAdmin}">
                    <li class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
                    <li><a href="#account" data-toggle="tab">Account</a></li>
                    <li><a href="#password" data-toggle="tab">Password</a></li>
                    <li><a href="#messages" data-toggle="tab">Messages</a></li>
                    <li><a href="#email" data-toggle="tab">Email</a></li>
                    <li><a href="#settings" data-toggle="tab">Settings</a></li>
                </g:if>
                <g:else>
                    <li class="active"><a href="#apply" data-toggle="tab">Apply</a></li>
                </g:else>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <g:if test="${isAdmin}">
                    <div class="tab-pane" id="account">...</div>

                    <div class="tab-pane" id="password">...</div>

                    <div class="tab-pane" id="messages">...</div>

                    <div class="tab-pane" id="email">...</div>

                    <div class="tab-pane" id="settings">...</div>
                </g:if>
                <g:else>
                    <div class="tab-pane active" id="apply">
                        <g:form>
                            <div class="row">
                                <br>

                                <div class="form-group clearfix">
                                    <div class="text-center panel-title">
                                        Apply for the Admin for this Site
                                    </div>

                                    <div>
                                        Get involved! Grails has a vibrant and buzzing community. You can grab the source code from GitHub, report issues on the Grails JIRA issue tracker, participate at the mailing lists or Nabble forums or catch-up on the latest news.
                                        This whole web site is written in Grails, the source code for which is available from GitHub. Visit the Grails community pages for more ways to participate.
                                    </div>
                                </div>
                            </div>
                            <g:submitButton class="btn-primary btn btn-lg" name="submit" value="Apply"></g:submitButton>
                        </g:form>

                    </div>
                </g:else>
            </div>
        </div>
    </div>
</div>
</body>
</html>