<login-modal>
    <div class="ui mini modal">
        <i class="close icon"></i>
        <div class="header"> Existing profile? </div>
        <div class="content">
            <div class="ui fluid input">
                <input type="text" onkeypress="{ enterSite }" placeholder="Enter your username" ref="username">
            </div>
        </div>
        <div class="actions">
                <div class="ui cancel button" onclick="{ clear }"> Cancel </div>
                <div class="ui ok button green" onclick="{ enterSite }"> Enter Fugit </div>
        </div>
    </div>

    <script>
        import route from 'riot-route';
        import localStorage from '../../shared/localStorage/localStorage'

        this.user = opts.user;

        this.clear = () => { localStorage.clear(); };

        this.enterPressed = (event) => {
            if (event.key === 'Enter') {
                this.enterSite();
            }
        };

        this.enterSite = () => {
            const username = this.refs.username.value;

            if (this.user.username === username) {
                this.user.authenticated = true;
                localStorage.setUser(localStorage.keys.USER, this.user);
                route('/fugit');
            } else {
                route('/login');
            }
        };
    </script>
</login-modal>