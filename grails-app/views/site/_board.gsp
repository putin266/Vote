<div class="tab-pane active" id="board">
    <br>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Site rules</h3>
        </div>

        <div class="panel-body">
            <g:if test="${isAdmin}">
                <g:form controller="site" action="changeRules" id="${site.id}">
                    <div class="form-group">
                    <g:render template="/common/editor" model="[value: site.rules]"></g:render>
                    </div>
                    <div class="form-group">
                        <g:submitButton class="btn btn-primary" name="add" onclick="setEditorContent()"
                                        value="Apply for change"></g:submitButton>
                    </div>
                </g:form>
            </g:if>
            <g:else>
                <g:applyCodec encodeAs="none">
                    ${site.rules}
                </g:applyCodec>
            </g:else>
        </div>
    </div>
</div>
