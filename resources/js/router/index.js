import axios from 'axios'
import Vue from 'vue'

import VueRouter from 'vue-router'
Vue.use(VueRouter)

const Login = require('../pages/auth-pages/Login.vue').default                  
const Register = require('../pages/auth-pages/Register.vue').default                  
const ForgetPass = require('../pages/auth-pages/ForgetPass.vue').default   

const Home = require('../pages/Home.vue').default                                   // './' is starting from js folder
const About = require('../pages/About.vue').default                                 // '../' backward through 2 folders because file index for routing is on router folder
const User = require('../pages/User.vue').default
const Profile = require('../pages/Profile.vue').default               
const Sambungan = require('../pages/Sambungan.vue').default           
const PDAM = require('../pages/Pdam.vue').default               
const EditUser = require('../pages/EditUser.vue').default                  
const UploadPhotoUser = require('../pages/UploadPhotoUser.vue').default

import Member from '../pages/admin-pages/Member.vue'
import Admin from '../pages/admin-pages/Admin.vue'

import NotFound from '../pages/NotFound.vue'                                        // second method

// router configuration; notes: routes array position can effect the web apps
const routes = [
    {
        name: 'Register',
        path: '/register',
        component: Register,
        props: true
    },
    {
        name: 'Login',
        path: '/login',
        component: Login,
        props: true
    },
    {
        name: 'ForgetPass',
        path: '/forget',
        component: ForgetPass,
        props: true
    },
    {
        name: 'Home',
        path: '/home',
        component: Home,
        meta: { requiresAuth: true }    // required authenticated user to access this path
    },
    {
        name: 'About',
        path: '/about',
        component: About
    },
    {
        name: 'User',
        path: '/user',        // ':' for dynamic segmentation, '?' for availability in accessing segmentation whether the 'name' path is not satisfied
        component: User,
        meta: { requiresAuth: true }
    },
    {
        name: 'Profile',
        path: '/user/:id',
        component: Profile,
        props: true,
        meta: { requiresAuth: true }
    },
    {
        name: 'UploadPhotoUser',
        path: '/user/:id/photo',
        component: UploadPhotoUser,
        props: true,
        meta: { requiresAuth: true }
    },
    {
        name: 'EditUser',
        path: '/user/:id/edit',
        component: EditUser,
        props: true,
        meta: { requiresAuth: true }
    },
    {
        name: 'Sambungan',
        path: '/sambungan/:datasambungan?',
        component: Sambungan,
        props: true,
        meta: { requiresAuth: true }
    },
    {
        name: 'Pdam',
        path: '/pdam/:cabangpdam?',
        component: PDAM,
        props: true,
        meta: { requiresAuth: true }
    },
    {
        name: 'Admin',
        path: '/admin',
        component: Admin,
        props: true,
        meta: { requiresAuth: true }
    },
    {
        name: 'Member',
        path: '/admin/member',
        component: Member,
        props: true,
        meta: { requiresAuth: true }
    },
    {
        path: '*',
        component: NotFound
    }
] 

const router = new VueRouter({
    linkActiveClass: 'active',
    mode: 'history',
    routes
})

// Check Authentication if the user is logged or not. if logged in user can access the path which requiresAuth else not
router.beforeEach((to, from, next) => {    
    if (to.meta.requiresAuth) {
        const authUser = JSON.parse(window.localStorage.getItem('authUser'))
        if (authUser && authUser.access_token) {
            next()
        } else {
            next({name: 'Login'})
        }
    }
    next()
})

export default router