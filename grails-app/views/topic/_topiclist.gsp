<g:each in="${topics}">
    <g:if test="${it.type == "discussion"}">
        <i class="fa fa-comments"></i>
    </g:if>
    <g:elseif test="${it.type == "question"}">
        <i class="fa fa-question-circle"></i>
    </g:elseif>
    <g:else>
        <i class="fa fa-star"></i>
    </g:else>
    <g:link controller="topic" action="index" id="${it.id}" class="h4">${it.title}</g:link>
    <span class="pull-right text-muted"><prettytime:display date="${it.lastUpdated}" capitalize="true" /></span>
    <br>
    <br>
    <g:if test="${it.type == "discussion"}">
        ${it.contents.size()}&nbsp;Opinions
    </g:if>
    <g:elseif test="${it.type == "question"}">
        ${it.contents.size()}&nbsp;Answers
    </g:elseif>
    <g:else>
        ${it.contents.size()}&nbsp;Comments
    </g:else>
    <g:if test="${it.fusers.contains(user)}">
        <g:link controller="topic" action="unfollowTopic" id="${it.id}"><i class="fa fa-minus"></i>&nbsp;Unfollow Topic</g:link>
    </g:if>
    <g:else>
        <g:link controller="topic" action="followTopic" id="${it.id}"><i class="fa fa-plus"></i>&nbsp;Follow Topic</g:link>
    </g:else>

    <hr>
</g:each>
<input type="hidden" name="page" value="${page}">
<g:if test="${hasMore}">
        <g:submitToRemote class="btn btn-default form-control" value="More"
                          url="[controller: controllerName, action: 'moreTopics', id: domain.id]"
                          update="topiclist"/>
</g:if>