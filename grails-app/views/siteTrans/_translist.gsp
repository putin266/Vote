<g:each in="${translist}">
    <g:link controller="siteTrans" action="index" id="${it.id}" class="h4">${it.type}</g:link>
    <span class="pull-right text-muted"><prettytime:display date="${it.lastUpdated}" capitalize="true" /></span>
    <br>
    <hr>
</g:each>