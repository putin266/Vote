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
                <li class="active"><a href="#board" data-toggle="tab">Board</a></li>
                <li><a href="#basic" data-toggle="tab">Basic</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="board">
                    <br>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Site rules</h3>
                        </div>

                        <div class="panel-body">
                            content
                        </div>
                    </div>

                </div>

                <div class="tab-pane" id="basic">
                    <br>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Terms for generate controller</h3>
                        </div>

                        <div class="panel-body">
                            <g:form class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Min Vote for best topic</label>

                                    <div class="col-sm-9">
                                        <input type="number" class="form-control" placeholder="Number">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Min best topic</label>

                                    <div class="col-sm-9">
                                        <input type="number" class="form-control"
                                               placeholder="Number">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-primary">Apply for change</button>
                                    </div>
                                </div>
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>