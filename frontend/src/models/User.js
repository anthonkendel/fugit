import faker from 'faker';

class User {
    constructor ({ authenticated, username, email, avatar } = {}) {
        this.authenticated = authenticated || false;
        this.username = username || faker.internet.userName();
        this.email = email || faker.internet.email();
        this.avatar = avatar || faker.internet.avatar();
    }
}

export default User;
