<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="/icons/elixir.png">
    <title>Elixir Web Apps</title>
    <link rel="stylesheet" type="text/css" href="{{ asset('css/app.css') }}">
</head>
<body>

    <div id="app">
        <main>
            <!-- <sidebar-component></sidebar-component> -->
        
            <header-component></header-component>

            <!-- <h1 class="title" v-text="'Hello, ' + title"></h1> -->         <!-- prefix @{{ title }} for render data in vue.js -->
    
            <router-view></router-view>                                     <!-- load view component based on active routes-->
            <footer-component></footer-component>
        </main>

    </div>

<script src="{{ asset('js/app.js') }}"></script>
</body>
</html>