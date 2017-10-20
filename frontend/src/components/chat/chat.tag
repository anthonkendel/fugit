<chat>
    <div class="ui message chat-log" id="chat-log">
        <p each="{ messages }">{ text }</p>
    </div>

    <div class="ui fluid action input">
        <input type="text" placeholder="New message..." id="create">
        <button class="ui icon button">
            <i class="add icon" onclick="{ sendMessage }"></i>
        </button>
    </div>

    <script>
        import './chat.css';

        this.message = {'text': ''};
        this.messages = [];

        const socket = new WebSocket('ws://192.168.1.151:8070/chat');

        socket.addEventListener('open', function (event) {
            socket.send('initial connection');
        });

        socket.addEventListener('message', (event) => {
            this.messages.push({'text': event.data});
            this.update();
        });

        this.on('mount', () => {
            this.chatLog = document.getElementById('chat-log');
            this.input = document.getElementById('create');

            this.input.addEventListener('input', (event) => {
                this.message.text = event.srcElement.value;
            });

            document.addEventListener('keydown', (keydownEvent) => {
                if (keydownEvent.key === 'Enter') {
                    this.sendMessage();
                }
            });
        });

        this.on('before-unmount', () => {
            // this.input.removeEventListener('input');
            // document.removeEventListener('keydown');
        });

        this.sendMessage = () => {
            socket.send(this.message.text);
            this.resetMessage();
            this.chatLog.scrollTop = this.chatLog.scrollHeight;
        };

        this.resetMessage = () => {
            this.message.text = '';
            this.input.value = '';
        };
    </script>
</chat>