<div class="tab-pane active" id="profile">
    <g:form controller="user" action="saveProfile" id="${user.id}" enctype="multipart/form-data">
        <div class="row">
            <br>
            <div class="form-group clearfix">
                <div class="col-xs-2 text-center">
                    Avatar
                </div>

                <div class="col-xs-4 text-center">
                    <g:if test="${user.avatar}">
                        <img src="${createLink(controller:'fileUploader', action:'show', id:user.avatar.id )}" width="100" height="100" style="margin: auto;" class="media-object"></img>
                    </g:if>
                    <g:else>
                        <r:img uri="/images/avatar/avatar100.png" width="100" height="100" ></r:img>
                    </g:else>
                </div>
                <input type="file" id="avatar" name="avatar"  class="custom-file-input">
                <p class="help-block">Upload your avatar here.</p>
            </div>

            <div class="form-group clearfix">
                <div class="col-xs-2 text-center">
                    Nick Name
                </div>

                <div class="col-xs-4">
                    <g:textField name="nickname" class="form-control" value="${user.nickname}"></g:textField>
                </div>
            </div>

            <div class="form-group clearfix">
                <div class="col-xs-2 text-center">
                    Short description
                </div>

                <div class="col-xs-4">
                    <g:textField name="sdesc" class="form-control" value="${user.sdescription}"></g:textField>
                </div>
            </div>

            <div class="form-group clearfix">
                <div class="col-xs-2 text-center">
                    Description
                </div>

                <div class="col-xs-4">
                    <g:textArea name="desc" class="form-control" value="${user.description}"></g:textArea>
                </div>
            </div>
        </div>
        <g:submitButton class="btn-primary btn" name="submit" value="Save"></g:submitButton>
    </g:form>
</div>