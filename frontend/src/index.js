import 'riot-route/lib/tag';
import riot from 'riot';

// semantic
import '../semantic/dist/semantic.min.css';
import '../semantic/dist/semantic.min.js';

// riot
import './app.tag';
import './components/fugit/fugit.tag';
import './components/chat/chat.tag';
import './components/sidebar/siderbar.tag';
import './components/login/login.tag';
import './components/login/login-modal.tag';

riot.mount('*');
