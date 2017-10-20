import route from 'riot-route';
import c from '../../shared/constants';
import User from '../../models/User';

function getUser () {
    const userData = window.localStorage.getItem(c.FUGIT_USER);
    let user = new User({ authenticated: false, username: 'invalid', email: 'invalid', avatar: 'invalid' });

    if (userData) {
        user = new User(JSON.parse(userData));
    }

    if (user.authenticated) {
        return user;
    }
    return undefined;
};

export default {
    checkAuth (collection = -1) {
        if (getUser()) {
            if (collection.indexOf('fugit') < 0) {
                route('/fugit');
            }
        } else {
            route('/login');
        }
    }
};
