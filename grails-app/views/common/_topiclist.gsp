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
    <span class="h4">${it.title}</span>
    <span class="pull-right text-muted"><prettytime:display date="${it.lastUpdateTime}" capitalize="true" /></span>
    <br>
    <br>
    <g:if test="${it.type == "discussion"}">
        ${it.contents.size()}Opinions
    </g:if>
    <g:elseif test="${it.type == "question"}">
        ${it.contents.size()}Answers
    </g:elseif>
    <g:else>
        ${it.contents.size()}Comments
    </g:else>
    <i class="fa fa-plus"></i>Follow Topic
    <hr>
</g:each>