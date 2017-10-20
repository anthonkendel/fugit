import _ from 'lodash';
import riot from 'riot';

// Riot files
import './app.tag';
import './components/login/login.tag';

function component () {
    let element = document.createElement('div');

    // Lodash, now imported by this script
    element.innerHTML = _.join(['Hello', 'webpack'], ' ');
    let array = [1, 2, 3];
    array.map((number) => number * 1);
    console.log(array);

    return element;
}

document.body.appendChild(component());

riot.mount('*');
