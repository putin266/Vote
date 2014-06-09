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
    <hr>
</g:each>
<input type="hidden" name="page" value="${page}">
<g:if test="${hasMoreTopics}">
    <g:submitToRemote class="btn btn-default form-control" value="More"
                      url="[controller: controllerName, action: 'moreTopics',id: user.id,param:[query:query]]"
                      update="topiclist"/>
</g:if>