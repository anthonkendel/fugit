import route from 'riot-route';
import localStorage from '../localStorage/localStorage';

export default {
    checkAuth (collection = -1) {
        const user = localStorage.getUser();

        if (user !== undefined && user.authenticated) {
            if (collection.indexOf('fugit') < 0) {
                route('/fugit');
            }
        } else {
            localStorage.clear();
            route('/login');
        }
    }
};
