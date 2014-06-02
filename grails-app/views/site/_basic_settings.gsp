<div class="tab-pane" id="basic">
    <br>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Terms for generate controller</h3>
        </div>

        <div class="panel-body">
            <g:form class="form-horizontal" controller="site" action="changeBasicSettings" id="${site.id}">
                <div class="form-group">
                    <label class="col-sm-3 control-label">Min Vote for best topic</label>

                    <div class="col-sm-9">
                        <g:if test="${isAdmin}">
                            <input type="number" class="form-control" name="minvote" placeholder="Number" value="${minvote}">
                        </g:if>
                        <g:else>
                            <div class="form-control">
                            ${minvote}
                            </div>
                        </g:else>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Min best topic</label>

                    <div class="col-sm-9">
                        <g:if test="${isAdmin}">
                            <input type="number" class="form-control" name="minbest"
                                   placeholder="Number" value="${minbest}">
                        </g:if>
                        <g:else>
                            <div class="form-control">
                            ${minbest}
                            </div>
                        </g:else>
                    </div>
                </div>
                <g:if test="${isAdmin}">
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">Apply for change</button>
                        </div>
                    </div>
                </g:if>
            </g:form>
        </div>
    </div>
</div>