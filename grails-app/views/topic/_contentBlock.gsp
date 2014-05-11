<div class="clearfix">
    <span class="h5">${content.user.firstname}&nbsp;${content.user.lastname}</span>
    <img class="media-object pull-right" data-src="holder.js/25x25/text:User" text="User">
</div>

<div class="form-group">
    <g:applyCodec encodeAs="none">
        ${content.content}
    </g:applyCodec>
</div>

<div>
    <g:formRemote url="[controller: 'content', action: 'getCommentsSize', id: content.id]" name="fcomments${content.id}"
                  update="acomments${content.id}">
        <a id="acomments${content.id}" class="text-muted" data-toggle="collapse" data-toggle="collapse"
           data-parent="#accordion"
           href="#comments${content.id}"
           onclick="changeCommentText('acomments${content.id}')">${content.comments.size()}&nbsp;Comments</a>
    </g:formRemote>
</div>
<g:render template="/comment/comments" model="[comments: content.comments, id: content.id]"/>
<hr>
