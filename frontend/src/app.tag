<app>
    <sidebar></sidebar>
    <router>
        <route path="/"><login /></route>
        <route path="/#/home">Home</route>
        <route path="/#/room/*">Room 1</route>
        <route path="*"><h1> Not found </h1></route>
    </router>
</app>