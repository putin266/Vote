<g:form name="${'fv' + type + candidate.id}">
    <div id="${'sv' + type + candidate.id}" class="side-vote">
    <g:render template="/vote/sideVoteContent" model="[candidate:candidate,type:type,votetype:votetype]"></g:render>
    </div>
</g:form>