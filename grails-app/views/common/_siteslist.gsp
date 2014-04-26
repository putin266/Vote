<g:each in="${sites}">
            <div class="media">
                <div class="pull-left sitethumbnail">
                    <a class="thumbnail"  href="#">
                        <img class="media-object" data-src="holder.js/64x64/text:Site" text="site">
                    </a>
                    <g:if test="${follow}">
                        <g:link class="btn btn-primary btn-xs" controller="site" action="follow" id="${it.id}"><span class="glyphicon glyphicon-plus"></span>Follow</g:link>
                    </g:if>
                </div>
                <div class="media-body">
                    <h4 class="media-heading">${it.name}</h4>
                    <p>${it.description}</p>
                </div>
            </div>
            <hr>
</g:each>
<g:if test="${appliedsites}">
    <g:each in="${appliedsites}">
        <div class="media">
            <div class="pull-left sitethumbnail">
                <a class="thumbnail"  href="#">
                    <img class="media-object" data-src="holder.js/64x64/text:Site" text="site">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading">${it.name}&nbsp;<span class="label label-warning">Unaccepted</span></h4>
                <p>${it.description}</p>
            </div>
        </div>
        <hr>
    </g:each>
</g:if>
