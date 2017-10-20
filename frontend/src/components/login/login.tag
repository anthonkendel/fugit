<login>
    <div class="ui centered grid vertical-center">
        <div class="column six wide middle aligned">
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
                    <div class="ui two buttons">
                        <button onclick="{ generateNewProfile }" class="ui button green">Generate new profile</button>
                        <button class="ui button blue"> Existing profile? </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        import User from '../../models/User';
        import faker from 'faker';
        
        this.loading = false;
        this.user = new User();

        this.generateNewProfile = () => {
            this.loading = true;
            setTimeout(() => {
                this.loading = false
                this.update();
                }, 200);
            this.user = new User();
            this.update();
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
            -webkit-box-align : center;
            -webkit-align-items : center;
            -moz-box-align : center;
            -ms-flex-align : center;
            align-items : center;
            width: 100%;
            -webkit-box-pack : center;
            -moz-box-pack : center;
            -ms-flex-pack : center;
            -webkit-justify-content : center;
            justify-content : center;
        }
    </style>
</login>