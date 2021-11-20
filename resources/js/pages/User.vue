<template>
    <div>
        <section id="section-content">
            <div class="body-content" v-if="userAuth.role == 'admin'">
                <h1>Daftar Users</h1>
                <ul>
                    <li v-for="user in users" :key="user.nomor_pelanggan">
                        <a href="" @click.prevent="lihatuserByAdmin(user.nomor_pelanggan)">{{ user.username }} </a>                       <!-- second method "lihatuser([temp-for-variable.<primary-key-field>])"-->
                    </li>
                </ul>
            </div>
            <div class="body-content" v-else>
                <h1>Data Kamu</h1>
                <ul>
                    <li>
                        <a href="" @click.prevent="lihatuserByPublic(userAuth.nomor_pelanggan)">{{ userAuth.username }} </a>
                    </li>
                </ul>
            </div>
        </section>
    </div>
</template>

<script>
import {mapState} from 'vuex'
import {getHeader} from '../config.js'

export default {                                                                                         
    data() {
        return {
            users: null,
            userAuth: {}
        }
    },
    mounted() {
        this.getUsers(),
        this.getAuthUser()
    },
    methods: {
        getUsers() {
            axios.get('/api/users').then((response) => {                                                    // axios."get" here is depend on what method in api routing
                // console.log(response)
                this.users = response.data                                                                  // this.<your-data()-return-variable>
            })
        },
        getAuthUser() {
            axios.get('/api/userAuth', {headers: getHeader()})
                .then(response => {
                    console.log('Authenticated User Object', response)                  
                    this.userAuth = response.data.data
                })
        },
        // profile_uri(name) {                                                                              // first alternative method
        //     return '/users/' + name.toLowerCase()
        // },
        lihatuserByAdmin(id) {                      
            this.$router.push({                                                                             // second alternative method
                name: 'Profile',
                params: {id}                                                                                // params: {your-props-name: your-function-paramater}, the alternative if "your-function-paramater" is same as "your-props-name" you can concate them to {id}
            })
        },
        lihatuserByPublic(id) {                      
            this.$router.push({
                name: 'Profile',
                params: {id}
            })
        },
    },
    computed: {
        ...mapState({
            userStore: state => state.userStore
        })
    },
    created() {
        console.log('I was Created')
        const userObj = JSON.parse(window.localStorage.getItem('authUser'))                 
        this.$store.dispatch('setUserObject', userObj)
    }
}
</script>

<style>
.card-bg {
    background-color: rgb(40,44,52);
}
</style>