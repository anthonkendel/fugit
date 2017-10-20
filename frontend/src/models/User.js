import faker from 'faker';

class User {
    constructor ({ authenticated, username, email, avatar } = {}) {
        this.authenticated = authenticated || false;
        this.username = username || faker.internet.userName();
        this.email = email || faker.internet.email();
        this.avatar = avatar || User.getGravatarAvatar();
    }

    static getGravatarAvatar () {
        const number = faker.random.number(20);
        const size = 256;
        return `https://www.gravatar.com/avatar/${number}?s=${size}&d=identicon&r=PG}`;
    }
}

export default User;
