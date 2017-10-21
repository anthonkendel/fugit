<login>
    <div class="ui centered grid full-height">
        <div class="row">
            <div class="column three wide middle aligned">
                <div class="ui card fluid">
                    <div class="blurring dimmable image">
                        <div class="ui dimmer { active: loading }">
                            <div class="ui loader"></div>
                        </div>
                        <img src="{ user.avatar }">
                    </div>
                    <div class="content">
                        <h2 class="header">
                            <i class="user icon"/>
                            { user.username }
                        </h2>
                        <div class="meta">
                            <a>
                                <i class="mail icon"/>
                                { user.email }
                            </a>
                        </div>
                    </div>
                    <div class="extra content">
                        <div class="ui three buttons">
                            <button onclick="{ enterSite }" class="ui button green"> Enter Fugit </button>
                            <button onclick="{ generateNewProfile }" class="ui button purple">Generate new profile</button>
                            <button onclick="{ showLoginModal }" class="ui button blue"> Existing profile? </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <login-modal/>

    <script>
        import route from 'riot-route';
        import faker from 'faker';
        import User from '../../models/User';
        import localStorage from '../../shared/localStorage/localStorage'

        this.loading = false;
        this.user = new User();

        this.enterSite = () => {
            this.user.authenticated = true;
            console.log(this.user);
            localStorage.setUser(localStorage.keys.USER, this.user);
            route('/fugit');
        }

        this.generateNewProfile = () => {
            this.loading = true;
            setTimeout(() => {
                this.loading = false
                this.update();
            }, 200);
            this.user = new User();
            this.update();
        };

        this.showLoginModal = () => {
            $('.ui.modal').modal('show');
        };

        this.on('mount', () => this.generateNewProfile);
    </script>

    <style>
        .full-height {
            min-height: 100%;
            min-height: 100vh;
        }
    </style>
</login>