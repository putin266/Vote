<div id="${'uv' + type + candidate.id}" onclick="">
    <g:if test="${votetype?.equals('upvote')}">
        <div class="btn upvote voted text-center" onclick="submitbtn('${'uvbtn' + type + candidate.id}')">
            <a>
                <i class="fa fa-sort-desc voted"></i>

                <div class="voted">${(candidate.votes.findAll {it.type == "upvote"}).size()}</div>
            </a>
        </div>
    </g:if>
    <g:else>
        <div class="btn upvote text-center" onclick="submitbtn('${'uvbtn' + type + candidate.id}')">
            <a>
                <i class="fa fa-sort-desc"></i>

                <div>${(candidate.votes.findAll {it.type == "upvote"}).size()}</div>
            </a>
        </div>
    </g:else>
    <g:submitToRemote class="hidden" id="${'uvbtn' + type + candidate.id}"
                      url="[controller: type, action: 'upvote', id: candidate.id]"
                      update="${'sv' + type + candidate.id}"/>
</div>

<div id="${'dv' + type + candidate.id}">
    <g:if test="${votetype?.equals('downvote')}">
        <div class="btn downvote text-center voted" onclick="submitbtn('${'dvbtn' + type + candidate.id}')">
            <a>
                <i class="fa fa-sort-asc voted"></i>
            </a>
        </div>
    </g:if>
    <g:else>
        <div class="btn downvote text-center" onclick="submitbtn('${'dvbtn' + type + candidate.id}')">
            <a>
                <i class="fa fa-sort-asc"></i>
            </a>
        </div>
    </g:else>
    <g:submitToRemote class="hidden" id="${'dvbtn' + type + candidate.id}"
                      url="[controller: type, action: 'downvote', id: candidate.id]"
                      update="${'sv' + type + candidate.id}"/>
</div>