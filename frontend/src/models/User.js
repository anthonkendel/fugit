import faker from 'faker';

class User {
    constructor ({ authenticated, username, email, avatar } = {}) {
        const fakeData = faker.helpers.contextualCard();

        this.authenticated = authenticated || false;
        this.username = username || fakeData.username;
        this.email = email || fakeData.email;
        this.avatar = avatar || User.getGravatarIdenticon();
    }

    static getGravatarIdenticon () {
        const number = faker.random.number(20);
        const size = 256;
        return `https://www.gravatar.com/avatar/${number}?s=${size}&d=identicon`;
    }
}

export default User;
