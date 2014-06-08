<g:if test="${comments.size() == 0}">
    No Comments yet.
</g:if>
<g:else>
    <g:each in="${comments.toList().sort { it.dateCreated }}">
        <div class="media">
            <a class="pull-left" href="#">
                <r:img uri="/images/avatar/user26.png" width="26" height="26" class="media-object pull-right"/>
            </a>

            <div class="media-body">
                <p>${it.comment}</p>
            </div>
        </div>
        <hr>
    </g:each>
</g:else>