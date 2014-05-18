<div class="tab-pane active" id="profile">
    <g:form>
        <div class="row">
            <br>
            <div class="form-group clearfix">
                <div class="col-xs-2 text-center">
                    Avatar
                </div>

                <div class="col-xs-4 text-center">
                    <img data-src="holder.js/100x100/text:Avatar" text="Avatar">
                </div>
            </div>

            <div class="form-group clearfix">
                <div class="col-xs-2 text-center">
                    Name
                </div>

                <div class="col-xs-4">
                    <g:textField name="name" class="form-control"></g:textField>
                </div>
            </div>

            <div class="form-group clearfix">
                <div class="col-xs-2 text-center">
                    Short description
                </div>

                <div class="col-xs-4">
                    <g:textField name="sdescription" class="form-control"></g:textField>
                </div>
            </div>

            <div class="form-group clearfix">
                <div class="col-xs-2 text-center">
                    Description
                </div>

                <div class="col-xs-4">
                    <g:textArea name="description" class="form-control"></g:textArea>
                </div>
            </div>
        </div>
        <g:submitButton class="btn-primary btn" name="submit" value="Save"></g:submitButton>
    </g:form>
</div>