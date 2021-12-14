import Vue from 'vue'
import Vuex from 'vuex'

import userStore from './userStore.js'

Vue.use(Vuex)
const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
    modules: {
        userStore
    },
    strict: debug
})

/* this is the vuex logic which used to store something like user authentication data from login. 
in this case userStore was imported from userStore.js file */