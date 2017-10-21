<app>
    <router>
        <route path="/"><auth/></route>
        <route path="/login"><login/></route>
        <route path="/fugit"> <fugit/> </route>
        <route path="*"><h1> Not found </h1></route>
    </router>

    <script>
        import route from 'riot-route';
        import auth from './shared/auth/auth';
        
        route((collection) => {
            auth.checkAuth(collection);
        });
    </script>
</app>