<template>
    <div>
        <section id="section-content">
            <!-- <div class="body-content" v-if="userAuth.role == 'admin'">
                <h1>Daftar Users</h1>
                <ul>
                    <li v-for="user in users" :key="user.nomor_pelanggan">
                        <a href="" @click.prevent="lihatuserByAdmin(user.nomor_pelanggan)">{{ user.username }} </a>                       
                    </li>
                </ul>
            </div> -->
            <div class="body-content">
                <h1>Data Kamu</h1>
                <ul>
                    <li>
                        <a href="" @click.prevent="lihatuserByPublic(userAuth.nomor_pelanggan)">{{ userAuth.username }} </a>                                <!-- second method "lihatuser([temp-for-variable.<primary-key-field>])"-->
                    </li>
                </ul>
            </div>
        </section>
    </div>
</template>

<script>
import {mapState} from 'vuex'
import {getHeader} from '../../config.js'

export default {                                                                                         
    data() {
        return {
            userAuth: {}
        }
    },
    mounted() {
        this.getAuthUser()
    },
    methods: {
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
        lihatuserByPublic(id) {                      
            this.$router.push({
                name: 'Profile',
                params: {id}
            })
        }
    },
    computed: {
        ...mapState({
            userStore: state => state.userStore
        })
    },
    created() {
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