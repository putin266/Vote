<g:each in="${sites}">
            <div class="media">
                <div class="pull-left sitethumbnail">
                    <g:link class="thumbnail"  controller="site" action="index" id="${it.id}">
                        <g:if test="${it.logo}">
                            <img src="${createLink(controller:'fileUploader', action:'show', id:it.logo.id )}" width="64" height="64" class="media-object"></img>
                        </g:if>
                        <g:else>
                            <r:img uri="/images/avatar/site64.png" width="64" height="64" class="media-object"></r:img>
                        </g:else>
                    </g:link>
                    <g:if test="${follow}">
                        <g:link class="btn btn-primary btn-xs" controller="site" action="follow" id="${it.id}"><span class="glyphicon glyphicon-plus"></span>Follow</g:link>
                    </g:if>
                </div>
                <div class="media-body">
                    <g:link class="media-heading h4" controller="site" action="index" id="${it.id}">${it.name}</g:link>
                    <p>${it.description}</p>
                </div>
            </div>
            <hr>
</g:each>
<g:if test="${appliedsites}">
    <g:each in="${appliedsites}">
        <div class="media">
            <div class="pull-left sitethumbnail">
                <g:link class="thumbnail"  controller="site" action="index" id="${it.id}">
                    <g:if test="${it.logo}">
                        <img src="${createLink(controller:'fileUploader', action:'show', id:it.logo.id )}" width="64" height="64" class="media-object"></img>
                    </g:if>
                    <g:else>
                        <r:img uri="/images/avatar/site64.png" width="64" height="64" class="media-object"></r:img>
                    </g:else>
                </g:link>
            </div>
            <div class="media-body">
                <g:link class="media-heading h4" controller="site" action="index" id="${it.id}">${it.name}&nbsp;<span class="label label-warning">Unaccepted</span></g:link>
                <p>${it.description}</p>
            </div>
        </div>
        <hr>
    </g:each>
</g:if>