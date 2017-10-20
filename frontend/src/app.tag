<app>
    <sidebar></sidebar>
    <router>
        <route path="/"><login /></route>
        <route path="/#/home">Home</route>
        <route path="/#/room/1">Room 1</route>
        <route path="/#/room/2">Room 2</route>
        <route path="*"><h1> Not found </h1></route>
    </router>
</app>