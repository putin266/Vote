<div style="display: inline-block" class="dropdown clearfix">
    <a data-toggle="dropdown" href="#">Admin Options</a>
    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
        <li><g:link controller="user" action="delete" id="${targetUser}" params="[topicId:topicId]">Delete User</g:link></li>
        <g:if test="${type == 'topic'}">
            <li><g:link controller="topic" action="delete" id="${topicId}">Delete Topic</g:link></li>
        </g:if>
        <g:else>
            <li><g:link controller="content" action="delete" id="${contentId}">Delete Content</g:link></li>
        </g:else>
    </ul>
</div>