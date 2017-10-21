<sidebar>
    <div class="header fugit-header">
        <h2 class="fugit-h2">Fugit</h2>
    </div>

    <div class="ui secondary vertical pointing menu">
        <a class="fugit-anchor item" onclick="{ createNewRoom }">Add room</a>
        <a each="{ routes }" class="fugit-anchor item { active: active }" onclick="{ setActiveElement }"
           href="{ route }">{ text }</a>
    </div>

    <script>
        import './sidebar.css';

        this.routes = [
            {'text': 'General', 'route': '/#fugit', 'active': true}
        ];

        this.setActiveElement = (mouseEvent) => {
            this.routes.map((route) => route.active = false);
            mouseEvent.item.active = true;
        };

        this.createNewRoom = () => {
            let index = this.routes.length;

            this.routes.push({
                'text': 'Room ' + index,
                'route': '/#/room/' + index,
                'active': false
            });
        }
    </script>
</sidebar>