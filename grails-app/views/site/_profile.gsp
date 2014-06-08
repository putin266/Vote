<div class="tab-pane" id="profile">
    <br>
    <g:form controller="site" action="saveProfile" id="${site.id}" enctype="multipart/form-data">
        <div class="form-group">
            <label for="sitetypeoptions">Site type</label>

            <div id="sitetypeoptions" class="radio">
                <label>
                    <g:if test="${site.isPublic}">
                        <g:radio type="radio" name="sitetype" value="1" checked="true" disabled="${!isAdmin}"></g:radio>
                        <input type="hidden" name="oldsitetype" value="1">
                    </g:if>
                    <g:else>
                        <g:radio type="radio" name="sitetype" value="1" disabled="${!isAdmin}"></g:radio>
                    </g:else>
                    Public Site
                </label>
            </div>

            <div class="radio">
                <label>
                    <g:if test="${!site.isPublic}">
                        <g:radio type="radio" name="sitetype" value="0" checked="true" disabled="${!isAdmin}"></g:radio>
                        <input type="hidden" name="oldsitetype" value="0">
                    </g:if>
                    <g:else>
                        <g:radio type="radio" name="sitetype" value="0" disabled="${!isAdmin}"></g:radio>
                    </g:else>
                    Private Site
                </label>
            </div>
        </div>

        <div class="form-group">
            <label>Name</label>
            <g:if test="${isAdmin}">
                <g:textField class="form-control" name="name" value="${site.name}" required="required"/>
            </g:if>
            <g:else>
                ${site.name}
            </g:else>

        </div>

        <div class="form-group">
            <label>Description</label>
            <g:if test="${isAdmin}">
                <g:textArea class="form-control" name="description" value="${site.description}" required="required"/>
            </g:if>
            <g:else>
                ${site.description}
            </g:else>

        </div>

        <div class="form-group">
            <label>Tags</label>
            <g:if test="${isAdmin}">
                <g:textField class="form-control" name="tags" value="${vote.TagService.tagsToStr(site.tags)}"
                             required="required"/>
                <input type="hidden" name="oldtags" value="${vote.TagService.tagsToStr(site.tags)}">
            </g:if>
            <g:else>
                ${vote.TagService.tagsToStr(site.tags)}
            </g:else>
        </div>

        <div class="form-group">
            <label>Site logo</label>

            <div class="text-center">
                <g:if test="${site.logo}">
                    <img src="${createLink(controller: 'fileUploader', action: 'show', id: site.logo.id)}"
                         width="100" height="100" style="margin: auto;" class="media-object"></img>
                </g:if>
                <g:else>
                    <r:img uri="/images/avatar/avatar100.png" width="100" height="100"></r:img>
                </g:else>
            </div>
            <g:if test="${isAdmin}">
                <input type="file" id="logo" name="logo" class="custom-file-input">

                <p class="help-block">Upload site logo here.</p>
            </g:if>
        </div>


        <g:if test="${isAdmin}">
            <g:submitButton class="btn-primary btn" name="submit" value="Save"></g:submitButton>
        </g:if>
    </g:form>
</div>