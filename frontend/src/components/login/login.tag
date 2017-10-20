<login>
    <div class="ui centered grid vertical-center">
        <div class="column middle aligned">
            <div class="ui card centered black">
                <div class="blurring dimmable image">
                    <div class="ui dimmer { active: loading }">
                        <div class="ui loader active"></div>
                    </div>
                    <img src="{ user.avatar }">
                </div>
                <div class="content">
                    <h2 class="header"> { user.username } </h2>
                    <div class="meta"> { user.email } </div>
                </div>
                <div class="extra content">
                    <div class="ui three buttons">
                        <button onclick="{ useProfile }" class="ui button green"> Enter Fugit </button>
                        <button onclick="{ generateNewProfile }" class="ui button purple">Generate new profile</button>
                        <button onclick="{ showLoginModal }" class="ui button blue"> Existing profile? </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <login-modal/>

    <script>
        import faker from 'faker';
        import User from '../../models/User';

        this.FUGIT_USER = 'FUGIT_USER';
        this.loading = false;
        this.user = new User();

        this.useProfile = () => {
            this.user.authenticated = true;
            const FUGIT_USER = window.localStorage.getItem(this.FUGIT_USER);

            if (!FUGIT_USER) {
                window.localStorage.setItem(this.FUGIT_USER, JSON.stringify(this.user));
            }
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
        .vertical-center {
            min-height: 100%;
            min-height: 100vh;
            display: -webkit-box;
            display: -moz-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-align: center;
            -webkit-align-items: center;
            -moz-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            width: 100%;
            -webkit-box-pack: center;
            -moz-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
        }
    </style>
</login>