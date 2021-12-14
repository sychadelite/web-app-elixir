require('./bootstrap');

// window.Vue = require('vue').default;                         // first method importing vue
import Vue from 'vue'
import router from './router'
import store from './store.js'

import VueNoty from 'vuejs-noty'                                // package vuejs-noty for notification alert
Vue.use(VueNoty)                                                // register the vuejs-noty plugin
import 'vuejs-noty/dist/vuejs-noty.css'                         // import styling css for vuejs-noty

import VueTippy, { TippyComponent } from "vue-tippy";
Vue.use(VueTippy);
Vue.component("tippy", TippyComponent);

import VModal from 'vue-js-modal'
Vue.use(VModal, { dialog: true })

import {BootstrapVue, IconsPlugin} from 'bootstrap-vue'
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)

import VueSidebarMenu from 'vue-sidebar-menu'
import 'vue-sidebar-menu/dist/vue-sidebar-menu.css'
Vue.use(VueSidebarMenu)



Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('sidebar-component', require('./components/Sidebar.vue').default);
Vue.component('header-component', require('./components/Header.vue').default);
Vue.component('footer-component', require('./components/Footer.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

// truncate filters globally
Vue.filter('truncate', function (text, length, suffix) {
    if (text.length > length) {
        return text.substring(0, length) + suffix;
    } else {
        return text;
    }
});

const app = new Vue({
    el: '#app',
    data: {
        title: 'Laravel 8 Vue.js'
    },
    router, store                                               // call store from imported store.js file 
});
