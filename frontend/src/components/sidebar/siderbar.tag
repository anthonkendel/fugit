<sidebar>
    <div class="ui wide sidebar fugit-sidebar visible">
        <div class="header fugit-header">
            <h2>Fugit</h2>
        </div>
    
        <div class="ui secondary vertical pointing menu">
            <a class="fugit-anchor item" onclick={ setActiveElement } href="/#/home">Home</a>
            <a class="fugit-anchor item"></a>
        </div>
    </div>

    <script>

        setActiveElement = () => {
            console.log('routeTo');
        };
    </script>
</sidebar>