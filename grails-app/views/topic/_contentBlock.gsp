<div class="content-detail">
    <g:if test="${content.candidate}">
        <g:render template="/vote/sideVote" model="[candidate:content,type:'content',votetype:(content.votes.find {it.user.id == session.user.id})?.type]" />
    </g:if>
<div class="clearfix">
    <span class="h5 text-info">${content.user.firstname}&nbsp;${content.user.lastname}</span>
    <r:img uri="/images/avatar/user26.png" width="26" height="26" class="media-object pull-right"></r:img>
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
    <g:if test="${isAdmin}">
        <g:render template="adminOptions" model="[type:'content',targetUser:content.user.id,contentId:content.id]"></g:render>
    </g:if>
</div>
<g:render template="/comment/comments" model="[comments: content.comments, id: content.id]"/>
<hr>
</div>