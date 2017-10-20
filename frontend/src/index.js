import _ from 'lodash';


function component() {
    var element = document.createElement('div');

     // Lodash, now imported by this script
    element.innerHTML = _.join(['Hello', 'webpack'], ' ');
    let array = [1, 2, 3];
    array.map((number) => number * 1);
    console.log(array);

    return element;
}

document.body.appendChild(component());