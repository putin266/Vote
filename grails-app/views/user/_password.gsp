<div class="tab-pane" id="password">
    <g:form controller="user" action="changePass" id="${user.id}">
        <div class="row">
            <br>
            <div class="form-group clearfix">
                <div class="col-xs-2 text-center">
                    Old Password
                </div>

                <div class="col-xs-4">
                    <input name="oldpass" type="password" class="form-control"></input>
                </div>
            </div>

            <div class="form-group clearfix">
                <div class="col-xs-2 text-center">
                    New Password
                </div>

                <div class="col-xs-4">
                    <input name="newpass" type="password" class="form-control"></input>
                </div>
            </div>

            <div class="form-group clearfix">
                <div class="col-xs-2 text-center">
                    Confirm Password
                </div>

                <div class="col-xs-4">
                    <input name="confpass" type="password" class="form-control"></input>
                </div>
            </div>

        </div>
        <g:submitButton class="btn-primary btn" name="submit" value="Save"></g:submitButton>
    </g:form>
</div>