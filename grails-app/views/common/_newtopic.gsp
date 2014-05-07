<div class="modal fade" id="newTopic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <g:form>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">New Topic</h4>
            </div>
            <div class="modal-body">
                <h5>Topic Type</h5>
                <label class="radio-inline">
                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                    Discussion
                </label>
                <label class="radio-inline">
                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                    Question
                </label>
                <label class="radio-inline">
                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                    Resources
                </label>
                <g:render template="/common/editor"></g:render>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Publish</button>
            </div>
            </g:form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->