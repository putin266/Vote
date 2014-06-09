<div class="modal fade" id="newTopic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <g:form controller="site" action="newtopic">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">New Topic</h4>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                        <label>Topic Type</label>
                        <br>
                        <label class="radio-inline">
                            <g:radio type="radio" name="topicType" value="discussion" checked="true"/>
                            Discussion
                        </label>
                        <label class="radio-inline">
                            <g:radio type="radio" name="topicType" value="question"/>
                            Question
                        </label>
                        <label class="radio-inline">
                            <g:radio type="radio" name="topicType" value="information"/>
                            Information
                        </label>
                    </div>

                    <div class="form-group">
                        <label>Title</label>
                        <g:textField class="form-control" name="title" value="" required="true"/>
                    </div>

                    <div class="form-group">
                        <label>Content</label>
                        <g:render template="/common/editor"/>
                    </div>

                    <div class="form-group">
                        <label>Tags</label>
                        <g:select from="${site.tags}" optionKey="name" optionValue="name" class="form-control"
                                  name="tags">
                        </g:select>
                    </div>
                </div>
                <g:hiddenField name="siteid" value="${params.id}"/>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <g:submitButton class="btn btn-primary" name="publish" onclick="setEditorContent()"
                                    value="publish"/>
                </div>
            </g:form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->