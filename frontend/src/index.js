import 'riot-route/lib/tag';
import riot from 'riot';

// css
import '../semantic/dist/semantic.min.css';
import './components/sidebar/sidebar.css';

// riot
import './app.tag';
import './components/sidebar/siderbar.tag';
import './components/login/login.tag';

riot.mount('*');
