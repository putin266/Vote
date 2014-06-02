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
                <li class="active"><a href="#apply" data-toggle="tab">Apply</a></li>

                <div class="pull-right" style="line-height: 42px;">
                    <g:link controller="site" action="index" id="${site.id}"><i
                            class="fa fa-arrow-left"></i>&nbsp;Back to topic list</g:link>
                </div>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="apply">
                    <g:form action="applyAdmin" id="${site.id}">
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
            </div>
        </div>
    </div>
</div>
</body>
</html>