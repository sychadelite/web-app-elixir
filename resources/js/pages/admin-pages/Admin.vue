<template>
    <div>
        <section id="section-content" style="margin-bottom: 20rem;">
            <div class="body-content" v-if="userAuth.role == 'admin'">
                <h1>Admin Playground</h1>
                <div>
                    <b-badge class="mb-3" variant="info">Admin: {{ userAuth.username }}</b-badge>
                </div>
            <router-link :to="{name: 'Member'}">Check Members</router-link>
            </div>
        </section>
    </div>
</template>

<script>
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
    },
    // get current local authUser to display the header
    created() {
        console.log('I was Created')
        const userObj = JSON.parse(window.localStorage.getItem('authUser'))                 
        this.$store.dispatch('setUserObject', userObj)
    }
}
</script>

<style>

</style>