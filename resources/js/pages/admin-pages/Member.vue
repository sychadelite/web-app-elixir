<template>
    <div>
        <section id="section-content" style="margin-bottom: 20rem;">
            <div class="body-content" v-if="userAuth.role == 'admin'">
                <h1>Members</h1>
                <div>
                    <b-badge class="mb-3" variant="info">Admin: {{ userAuth.username }}</b-badge>
                </div>
                <ul>
                    <li v-for="user in users" :key="user.nomor_pelanggan">
                        <a href="" @click.prevent="lihatuserByAdmin(user.nomor_pelanggan)">{{ user.username }} </a>
                    </li>
                </ul>
            </div>
            <div class="body-content" v-else-if="userAuth.role !== 'admin'">
                <h1></h1>
            </div>
            <div class="body-content" v-else>
                <h1></h1>
            </div>
        </section>
    </div>
</template>

<script>
import {getHeader} from '../../config.js'

export default {
     data() {
        return {
            userAuth: {},
            users: null
        }
    },
    mounted() {
        this.getAuthUser(),
        this.getUsers()
    },
    methods: {
        getAuthUser() {
            axios.get('/api/userAuth', {headers: getHeader()})
                .then(response => {
                    console.log('Authenticated User Object', response)                  
                    this.userAuth = response.data.data
                })
        },
        getUsers() {
            axios.get('/api/users').then((response) => {
                this.users = response.data
            })
        },
        lihatuserByAdmin(id) {                      
            this.$router.push({
                name: 'Profile',
                params: {id}
            })
        },
    },
    created() {
        console.log('I was Created')
        const userObj = JSON.parse(window.localStorage.getItem('authUser'))                 
        this.$store.dispatch('setUserObject', userObj)
    }
}
</script>
