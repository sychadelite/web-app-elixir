import axios from 'axios'
import Vue from 'vue'

import VueRouter from 'vue-router'
Vue.use(VueRouter)

const Login = require('../pages/auth-pages/Login.vue').default                  
const Register = require('../pages/auth-pages/Register.vue').default                  
const ForgetPass = require('../pages/auth-pages/ForgetPass.vue').default   

const Home = require('../pages/Home.vue').default                                   // './' is starting from js folder
const About = require('../pages/About.vue').default                                 // '../' backward through 2 folders because file index for routing is on router folder

const User = require('../pages/user-pages/User.vue').default
const Profile = require('../pages/user-pages/Profile.vue').default
const EditUser = require('../pages/user-pages/EditUser.vue').default                  
const UploadPhotoUser = require('../pages/user-pages/UploadPhotoUser.vue').default
const ReportUser = require('../pages/pdam-pages/ReportUser.vue').default

const PDAM = require('../pages/pdam-pages/Pdam.vue').default
const Sambungan = require('../pages/pdam-pages/Sambungan.vue').default               
const TagihanUser = require('../pages/pdam-pages/TagihanUser.vue').default           
const News = require('../pages/pdam-pages/News.vue').default
const Membership = require('../pages/pdam-pages/Membership.vue').default
const RequestMembership = require('../pages/pdam-pages/RequestMembership.vue').default
const PaymentMethod = require('../pages/pdam-pages/PaymentMethod.vue').default

import Admin from '../pages/admin-pages/Admin.vue'
import Member from '../pages/admin-pages/Member.vue'
import MemberProfile from '../pages/admin-pages/MemberProfile.vue'
import Report from '../pages/admin-pages/Report.vue'
import Tagihan from '../pages/admin-pages/Tagihan.vue'
import ListRequestMembership from '../pages/admin-pages/ListRequestMembership.vue'

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
        name: 'ReportUser',
        path: '/user/report/:id',
        component: ReportUser,
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
        name: 'TagihanUser',
        path: '/tagihan/:id',
        component: TagihanUser,
        props: true,
        meta: { requiresAuth: true }
    },
    {
        name: 'Sambungan',
        path: '/sambungan/:nomorsambungan?',
        component: Sambungan,
        props: true,
        meta: { requiresAuth: true }
    },
    {
        name: 'News',
        path: '/news/:id_news?',
        component: News,
        props: true,
        meta: { requiresAuth: true }
    },
    {
        name: 'Membership',
        path: '/membership',
        component: Membership,
        props: true,
        meta: { requiresAuth: true }
    },
    {
        name: 'RequestMembership',
        path: '/membership/:classify',
        component: RequestMembership,
        props: true,
        meta: { requiresAuth: true }
    },
    {
        name: 'PaymentMethod',
        path: '/payment',
        component: PaymentMethod,
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
        name: 'MemberProfile',
        path: '/admin/member/profile/:id',
        component: MemberProfile,
        props: true,
        meta: { requiresAuth: true }
    },
    {
        name: 'Report',
        path: '/admin/report',
        component: Report,
        props: true,
        meta: { requiresAuth: true }
    },
    {
        name: 'Tagihan',
        path: '/admin/tagihan',
        component: Tagihan,
        props: true,
        meta: { requiresAuth: true }
    },
    {
        name: 'ListRequestMembership',
        path: '/admin/request/membership',
        component: ListRequestMembership,
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