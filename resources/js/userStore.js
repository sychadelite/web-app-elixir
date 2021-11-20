const state = {
    authUser: null
}

const mutations = {
    SET_AUTH_USER (state, userObj) {
        state.authUser = userObj
    },
    CLEAR_AUTH_USER(state) {
        state.authUser = null
    }
}

const actions = {
    setUserObject: ({commit}, userObj) => {
        commit('SET_AUTH_USER', userObj)
    },
    clearAuthUser: ({commit}) => {
        commit('CLEAR_AUTH_USER')
    }
}

export default {
    state, mutations, actions
}

/* not really understand what is state, mutations, actions 
but these contanta is build for saving user login authentication by access_token which builded on login api 
and remove that access_token too */

// import Vue from 'vue'
// import Vuex from 'vuex'
// import axios from 'axios'
// import router from './router';

// Vue.use(Vuex)

// export default new Vuex.Store({
//   state: {
//     accessToken: null,
//     loggingIn: false,
//     loginError: null
//   },
//   mutations: {
//     loginStart: state => state.loggingIn = true,
//     loginStop: (state, errorMessage) => {
//       state.loggingIn = false;
//       state.loginError = errorMessage;
//     },
//     updateAccessToken: (state, accessToken) => {
//       state.accessToken = accessToken;
//     },
//     logout: (state) => {
//       state.accessToken = null;
//     }
//   },
//   actions: {
//     doLogin({ commit }, loginData) {
//       commit('loginStart');

//       axios.post('https://reqres.in/api/login', {
//         ...loginData
//       })
//       .then(response => {
//         localStorage.setItem('accessToken', response.data.token);
//         commit('loginStop', null);
//         commit('updateAccessToken', response.data.token);
//         router.push('/users');
//       })
//       .catch(error => {
//         commit('loginStop', error.response.data.error);
//         commit('updateAccessToken', null);
//       })
//     },
//     fetchAccessToken({ commit }) {
//       commit('updateAccessToken', localStorage.getItem('accessToken'));
//     },
//     logout({ commit }) {
//       localStorage.removeItem('accessToken');
//       commit('logout');
//       router.push('/login');
//     }
//   }
// })