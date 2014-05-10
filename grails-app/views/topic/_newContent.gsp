<div class="modal fade" id="newContent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <g:form controller="topic" action="addContent">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <g:if test="${topic.type == "discussion"}">
                        <h4 class="modal-title" id="myModalLabel">Add Opinion</h4>
                    </g:if>
                    <g:elseif test="${topic.type == "question"}">
                        <h4 class="modal-title" id="myModalLabel">Add Answer</h4>
                    </g:elseif>
                    <g:else>
                        <h4 class="modal-title" id="myModalLabel">Add Comment</h4>
                    </g:else>

                </div>
                <div class="modal-body">
                   <div class="form-group">
                        <label>Content</label>
                        <g:render template="/common/editor"></g:render>
                    </div>
                </div>
                <g:hiddenField name="topicid" value="${topic.id}"></g:hiddenField>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <g:submitButton class="btn btn-primary" name="add" onclick="setEditorContent()"
                                    value="Add"></g:submitButton>
                </div>
            </g:form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->