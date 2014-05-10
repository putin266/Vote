%{--<g:if test="${topic.type == "discussion"}">--}%
    %{--<g:render template="/topicmaint/discusstion" model="[topic:topic]"></g:render>--}%
%{--</g:if>--}%
%{--<g:elseif test="${topic.type == "question"}">--}%
    %{--<g:render template="/topicmaint/question" model="[topic:topic]"></g:render>--}%
%{--</g:elseif>--}%
%{--<g:else>--}%
    %{--<g:render template="/topicmaint/information" model="[topic:topic]"></g:render>--}%
%{--</g:else>--}%
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
<p>${topic.detail}</p>
<br>
<g:render template="/common/comments" model="[comments:topic.comments]"/>
<hr>
<g:each  in="${topic.contents}" >
    <g:render template="contentBlock" model="[content:it]"></g:render>
</g:each>

