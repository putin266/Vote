<div class="content-detail">
    <g:if test="${content.candidate}">
        <g:render template="/vote/sideVote" model="[candidate:content,type:'content',votetype:(content.votes.find {it.user.id == session.user.id})?.type]" />
    </g:if>
<div class="clearfix">
    <span class="h5 text-info">${content.user.firstname}&nbsp;${content.user.lastname}</span>
    <img class="media-object pull-right" data-src="holder.js/25x25/text:User" text="User">
</div>

<div class="form-group">
    <g:applyCodec encodeAs="none">
        ${content.content}
    </g:applyCodec>
</div>

<div>
    <g:formRemote style="display:inline" url="[controller: 'content', action: 'getCommentsSize', id: content.id]" name="fcomments${content.id}"
                  update="acomments${content.id}">
        <a id="acomments${content.id}" class="text-muted" data-toggle="collapse" data-toggle="collapse"
           data-parent="#accordion"
           href="#comments${content.id}"
           onclick="changeCommentText('acomments${content.id}')">${content.comments.size()}&nbsp;Comments</a>
    </g:formRemote>
    <g:render template="adminOptions"></g:render>
</div>
<g:render template="/comment/comments" model="[comments: content.comments, id: content.id]"/>
<hr>
</div>