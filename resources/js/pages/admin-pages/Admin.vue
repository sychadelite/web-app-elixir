<template>
    <div>
        <section id="section-content" style="margin-bottom: 20rem;">
            <section id="section-title">

                <div class="body-section-title">
                    <h1><img src="/icons/2x/admin_panel_settings_white_48dp.svg" alt="admin" class="mr-4 mb-2">Admin Playground</h1>
                    <div>
                        <b-badge class="mb-2" variant="info">Admin: {{ userAuth.username }}</b-badge>
                    </div> 
                </div>

            </section>

        <div class="body-content" v-if="userAuth.role == 'admin'">    
            <h3>Your Privileges</h3>                      
            <router-link :to="{name: 'Member'}">Check Users</router-link>
            <br>
            <router-link :to="{name: 'Report'}">Check Reports</router-link>
            <br>
            <router-link :to="{name: 'Tagihan'}">Check Tagihan</router-link>
            <br>
            <router-link :to="{name: 'ListRequestMembership'}">Check Request Membership</router-link>
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
        this.getAuthUser(),
        this.scrollToTop()
    },
    methods: {
        getAuthUser() {
            axios.get('/api/userAuth', {headers: getHeader()})
                .then(response => {
                    console.log('Authenticated User Object', response)                  
                    this.userAuth = response.data.data
                })
        },
        scrollToTop() {
            window.scrollTo(0,0);
        }
    },
    // get current local authUser to display the header
    created() {
        const userObj = JSON.parse(window.localStorage.getItem('authUser'))                 
        this.$store.dispatch('setUserObject', userObj)
    }
}
</script>

<style>

</style>