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
        <label class="col-sm-3 control-label">Min Vote for add new user</label>

        <div class="col-sm-9">
                <input type="number" class="form-control" name="AddNewUser" placeholder="Number" value="${AddNewUser}">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label">Min Vote for change setting</label>

        <div class="col-sm-9">
            <input type="number" class="form-control" name="changeSetting" placeholder="Number" value="${changeSetting}">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label">Min Vote for create setting</label>

        <div class="col-sm-9">
            <input type="number" class="form-control" name="createSetting" placeholder="Number" value="${createSetting}">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label">Min Vote for Delete User</label>

        <div class="col-sm-9">
            <input type="number" class="form-control" name="DeleteUser" placeholder="Number" value="${DeleteUser}">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label">Min Vote for Delete Topic</label>

        <div class="col-sm-9">
            <input type="number" class="form-control" name="DeleteTopic" placeholder="Number" value="${DeleteTopic}">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label">Min Vote for Delete Content</label>

        <div class="col-sm-9">
            <input type="number" class="form-control" name="DeleteContent" placeholder="Number" value="${DeleteContent}">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label">Min Vote for Change Rules</label>

        <div class="col-sm-9">
            <input type="number" class="form-control" name="ChangeRules" placeholder="Number" value="${ChangeRules}">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label">Min Vote for Change Name</label>

        <div class="col-sm-9">
            <input type="number" class="form-control" name="ChangeName" placeholder="Number" value="${ChangeName}">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label">Min Vote for Change Type</label>

        <div class="col-sm-9">
            <input type="number" class="form-control" name="ChangeType" placeholder="Number" value="${ChangeType}">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label">Min Vote for Change Description</label>

        <div class="col-sm-9">
            <input type="number" class="form-control" name="ChangeDesc" placeholder="Number" value="${ChangeDesc}">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label">Min Vote for Change Tags</label>

        <div class="col-sm-9">
            <input type="number" class="form-control" name="ChangeTags" placeholder="Number" value="${ChangeTags}">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label">Min Vote for Change Logo</label>

        <div class="col-sm-9">
            <input type="number" class="form-control" name="ChangeLogo" placeholder="Number" value="${ChangeLogo}">
        </div>
    </div>

</g:if>
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