<g:if test="${comments.size() == 0}">
    No Comments yet.
</g:if>
<g:else>
    <g:each in="${comments}">
        <div class="media">
            <a class="pull-left" href="#">
                <img class="media-object pull-right" data-src="holder.js/25x25/text:User" text="User">
            </a>
            <div class="media-body">
                <p>${it.comment}</p>
            </div>
        </div>
        <hr>
    </g:each>
</g:else>