<login-modal>
    <div class="ui modal">
        <i class="close icon"></i>
        <div class="header"> Existing profile? </div>
         <div class="content">
            <div class="ui fluid input">
                <input type="text" onkeypress="{ checkUser }" placeholder="Enter your username">
            </div>
            <div class="ui divider"></div>
            <div class="ui button positive fluid green" onclick="{ checkUser }"> Enter Fugit </div>
        </div>
    </div>

    <script>
        this.checkUser = (event) => {
            const ENTER = 13;
            if (event.which === 13) {
                console.log('Success');
            }
        };
    </script>
</login-modal>