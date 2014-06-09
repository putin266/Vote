<g:each in="${userlist}">
    <div class="media">
        <div class="pull-left">
            <g:link controller="user" action="index" id="${it.id}">
                <g:if test="${it.avatar}">
                    <img class="media-object"
                         src="${createLink(controller: 'fileUploader', action: 'show', id: it.avatar.id)}"
                         height="100" width="100">
                </g:if>
                <g:else>
                    <r:img uri="/images/avatar/avatar100.png" width="100" height="100"></r:img>
                </g:else>
            </g:link>
        </div>

        <div class="media-body">
            <div class="form-group">
                <span class="label label-default">Name</span><span>&nbsp;${it.firstname}&nbsp;${it.lastname}</span>
            </div>

            <div class="form-group">
                <span class="label label-default">Email</span><span>&nbsp;${it.username}</span>
            </div>

            <div class="form-group">
                <span class="label label-default">Description</span><span>&nbsp;${it.sdescription}</span>
            </div>
        </div>
    </div>
</g:each>