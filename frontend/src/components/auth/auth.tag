<auth>
    <script>
        import route from 'riot-route';
        import c from '../../shared/constants';
        import User from '../../models/User';

        this.getUser = () => {
            const userData = window.localStorage.getItem(c.FUGIT_USER);
            let user = new User();

            if (userData) {
                user = new User(JSON.parse(userData));
            }

            if (user.authenticated) {
                return user;
            }

            return undefined;
        }

        this.on('mount', () => {
            if (this.getUser() !== undefined) {
                route('/fugit');
            } else {
                route('/login');
            }
        });
    </script>
</auth>
