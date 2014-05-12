<%@ page import="vote.User" %>
<div class="page-header">
    <g:if test="${topic.type == "discussion"}">
        <i class="fa fa-comments"></i>
    </g:if>
    <g:elseif test="${topic.type == "question"}">
        <i class="fa fa-question-circle"></i>
    </g:elseif>
    <g:else>
        <i class="fa fa-star"></i>
    </g:else>
    <span class="h3">${topic.title}</span>
</div>

<div class="topic-detail">
    <g:if test="${topic.candidate}">
        <g:render template="/vote/sideVote" model="[candidate:topic,type:'topic',votetype:(topic.votes.find {it.user.id == session.user.id})?.type]" />
    </g:if>
    <div class="form-group">
        <p>
            <g:applyCodec encodeAs="none">
                ${topic.detail}
            </g:applyCodec>
        </p>
    </div>
</div>

<div>
    <g:formRemote url="[controller: 'topic', action: 'getCommentsSize', id: topic.id]"
                  name="fcomments${'t' + topic.id}" update="acomments${'t' + topic.id}">
        <a id="acomments${'t' + topic.id}" class="text-muted" data-toggle="collapse" data-toggle="collapse"
           data-parent="#accordion"
           href="#comments${'t' + topic.id}"
           onclick="changeCommentText('acomments${'t' + topic.id}')">${topic.comments.size()}&nbsp;Comments</a>
    </g:formRemote>
</div>

<g:render template="/comment/comments" model="[comments: topic.comments, id: 't' + topic.id]"/>
<hr>
<g:each in="${topic.contents}">
    <g:render template="contentBlock" model="[content: it]"></g:render>
</g:each>

