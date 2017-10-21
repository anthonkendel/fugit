<chat>
    <div class="chat-grid">
        <div class="chat-log" id="chat-log">
            <div class="ui comments">
                <div class="comment" each="{ messages }">
                    <a class="avatar chat-avatar">
                        <img src="{ avatar }">
                    </a>
                    <div class="content">
                        <a class="author">{ username }</a>
                        <div class="metadata">
                            <span class="date">{ created }</span>
                        </div>
                        <div class="text">
                            { text }
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="chat-input ui fluid input">
            <input type="text" placeholder="New message..." id="create" onkeypress="{ onEnterPressed }">
        </div>
    </div>

    <script>
        import './chat.css';
        import localStorage from '../../shared/localStorage/localStorage';
        import User from "../../models/User";

        this.message = {'text': ''};
        this.messages = [];

        const socket = new WebSocket('ws://echo.websocket.org');

        socket.addEventListener('open', function (event) {
            // initial registration to a chat
        });

        socket.addEventListener('message', (event) => {
            this.messages.push(JSON.parse(event.data));
            this.update();
        });

        this.on('mount', () => {
            this.chatLog = document.getElementById('chat-log');
            this.input = document.getElementById('create');
            this.user = localStorage.getUser() || new User();

            this.input.addEventListener('input', (event) => {
                this.message.text = event.srcElement.value;
            });
        });

        this.onEnterPressed = (event) => {
            if (event.key === "Enter") {
                this.sendMessage();
            }
        };

        this.sendMessage = () => {
            let today = new Date();
            let message = {
                text: this.message.text,
                username: this.user.username,
                avatar: this.user.avatar,
                created: this.getFormattedDate(today)
            };

            socket.send(JSON.stringify(message));
            this.resetMessage();
            this.scrollChatLog();
        };

        this.getFormattedDate = (d) => {
            let month = d.getMonth(), date = d.getDate();

            if (month < 10) {
                month = `0${month}`
            }

            if (date < 10) {
                date = `0${date}`;
            }

            return `${d.getFullYear()}-${month}-${date} ${d.getHours()}:${d.getMinutes()}`;
        };

        this.resetMessage = () => {
            this.message.text = '';
            this.input.value = '';
        };

        this.scrollChatLog = () => {
            this.chatLog.scrollTop = this.chatLog.scrollHeight;
        }
    </script>
</chat>