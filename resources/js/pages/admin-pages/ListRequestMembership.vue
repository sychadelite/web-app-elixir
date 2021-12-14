<template>
    <div>
        <section id="section-content" style="margin-bottom: 20rem;">
            <section id="section-title" v-if="userAuth.role == 'admin'">
                <div class="body-section-title">
                    <h1><img src="/icons/2x/loyalty_white_48dp.svg" alt="members" class="mr-4 mb-2">All of Membership Requests</h1>
                    <div>
                        <b-badge class="mb-2" variant="info">Admin: {{ userAuth.username }}</b-badge>
                    </div>
                </div>
            </section>

            <div class="body-content" v-if="userAuth.role == 'admin'">
                <div class="home-container">
                    <div class="mt-4">
                        <h3>Tabel Request Membership</h3>
                    </div>
                        
                    <div class="mt-4">
                        <TableRequestMembership/>
                    </div>
                </div>
            </div>
            
            <div class="body-content" v-else>
                <div class="text-center" style="margin-top: 10rem;">
                    <b-spinner label="Spinning"></b-spinner>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
import {getHeader} from '../../config.js'
import TableRequestMembership from '../../table/TableRequestMembership.vue'

export default {
    components: {
        TableRequestMembership,
    },
    data() {
        return {
            userAuth: {},
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
                this.userAuth = response.data.data
            })
        },
        scrollToTop() {
            window.scrollTo(0,0);
        }
    },
    created() {
        const userObj = JSON.parse(window.localStorage.getItem('authUser'))                 
        this.$store.dispatch('setUserObject', userObj)
    }
}
</script>