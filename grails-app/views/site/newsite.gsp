<%--
  Created by IntelliJ IDEA.
  User: Wei
  Date: 2014/4/21
  Time: 15:06
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="general" />
    <title>Create Sites</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-1">
        </div>
        <div class="col-xs-8">
            <div class="page-header">
                <h3>Create a new site</h3>
            </div>

            <g:form role="form" controller="site" action="create" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="sitetypeoptions">Site type</label>
                    <div id="sitetypeoptions" class="radio">
                        <label>
                            <g:if test="${params.sitetype == "1" || params.sitetype == null || params.sitetype == ""}">
                                <g:radio type="radio" name="sitetype" value="1" checked="true"></g:radio>
                            </g:if>
                            <g:else>
                                <g:radio type="radio" name="sitetype" value="1"></g:radio>
                            </g:else>
                            Public Site
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <g:if test="${params.sitetype == "0"}">
                                <g:radio type="radio" name="sitetype" value="0" checked="true"></g:radio>
                            </g:if>
                            <g:else>
                                <g:radio type="radio" name="sitetype" value="0"></g:radio>
                            </g:else>
                            Private Site
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label>Name</label>
                    <g:textField  class="form-control"  name="name" value="${params.name}" required="required" />
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <g:textArea  class="form-control"  name="description" value="${params.description}" required="required"/>
                </div>
                <div class="form-group">
                    <label>Tags</label>
                    <g:textField  class="form-control"  name="tags" value="${params.tags}" required="required" />
                </div>
                <div class="form-group">
                    <label for="sitelogo">Site logo</label>
                    <input type="file" id="sitelogo" name="logo"  class="custom-file-input">
                    <p class="help-block">Upload your site logo here.</p>
                </div>

                <div class="form-group">
                        <g:checkBox type="checkbox" name="agreed" value="${params.agreed}"/>
                        <label>I confirm the information is correct</label>
                </div>
                <g:submitButton name="submit" class="btn btn-primary" value="Create"></g:submitButton>
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