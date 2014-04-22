<g:each in="${sites}">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="media">
                <a class="pull-left thumbnail" href="#">
                    <img class="media-object" data-src="holder.js/64x64/text:Site" text="site">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">${it.name}</h4>
                    <p>${it.description}</p>
                </div>
            </div>
        </div>
        <div class="panel-footer"></div>
    </div>
</g:each>