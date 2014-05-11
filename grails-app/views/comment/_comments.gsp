<div id="comments${id}" class="panel-collapse collapse">
    <div class="panel panel-default">
        <div id="commentlist${id}" class="panel-body">
            <g:render template="/comment/commentslist" model="[comments: comments]"/>
        </div>

        <div class="panel-footer">
            <g:form>
                <div class="form-group">
                    <g:textField class="form-control" name="comment"/>
                </div>
                <g:hiddenField name="id" value="${id}"/>
                <div class="text-right">
                    <a class="btn btn-default text-muted" data-toggle="collapse"
                       data-parent="#accordion"
                       href="#comments${id}">Close</a>
                    <g:submitToRemote class="btn btn-primary" name="Comment" value="Comment" url="[controller:'comment',action:'newComment']" update="commentlist${id}" after="afterUpdateComments();"/>
                </div>
            </g:form>
        </div>
    </div>
</div>