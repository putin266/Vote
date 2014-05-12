<div id="${'uv' + type + candidate.id}" onclick="">
    <g:if test="${votetype?.equals('upvote')}">
        <div style="color: #000000" class="btn upvote text-center" onclick="submitbtn('${'uvbtn' + type + candidate.id}')">
            <a>
                <i class="fa fa-sort-desc"></i>

                <div>${(candidate.votes.findAll {it.type == "upvote"}).size()}</div>
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
                      update="${'sv' + type + candidate.id}"></g:submitToRemote>
</div>

<div id="${'dv' + type + candidate.id}">
    <g:if test="${votetype?.equals('downvote')}">
        <div style="color: #000000" class="btn downvote text-center" onclick="submitbtn('${'dvbtn' + type + candidate.id}')">
            <a>
                <i class="fa fa-sort-asc fa-2"></i>
            </a>
        </div>
    </g:if>
    <g:else>
        <div class="btn downvote text-center" onclick="submitbtn('${'dvbtn' + type + candidate.id}')">
            <a>
                <i class="fa fa-sort-asc fa-2"></i>
            </a>
        </div>
    </g:else>
    <g:submitToRemote class="hidden" id="${'dvbtn' + type + candidate.id}"
                      url="[controller: type, action: 'downvote', id: candidate.id]"
                      update="${'sv' + type + candidate.id}"></g:submitToRemote>
</div>