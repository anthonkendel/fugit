import User from '../../models/User';

export default {
    keys: {
        USER: 'user'
    },
    clear () {
        window.localStorage.clear();
    },
    getUser (key = this.keys.USER) {
        const user = window.localStorage.getItem(key);
        if (user) {
            return new User(JSON.parse(user));
        }
        return undefined;
    },
    setUser (key, user) {
        console.log(key, user);
        window.localStorage.setItem(key, JSON.stringify(user));
    },
    setItem (key, data) {
        window.localStorage.setItem(key, data);
    },
    getItem (key) {
        const item = window.localStorage.getItem(key);
        if (item) {
            return item;
        }
        return undefined;
    }
};
