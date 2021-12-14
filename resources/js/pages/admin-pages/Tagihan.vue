<template>
    <div>

        <section id="section-title">
            <div class="body-section-title" v-if="userAuth.role == 'admin'">
                <h1><b-icon icon="credit-card2-front" class="mr-4 mb-2"></b-icon>Payment</h1>
                <div>
                    <b-badge class="mb-2" variant="info">Admin: {{ userAuth.username }}</b-badge>
                </div>
            </div>
        </section>

        <div class="body-content" v-if="userAuth.role == 'admin'">
            <h2>Log Tagihan Member</h2>
            <br>
            <TableTagihan/>
        </div>

        <div class="body-content" v-else>
            <div class="text-center" style="margin-top: 10rem;">
                <b-spinner label="Spinning"></b-spinner>
            </div>
        </div>

    </div>
</template>

<script>
import {getHeader} from '../../config.js'
import TableTagihan from '../../table/TableTagihan.vue'

export default {
    components: {
        TableTagihan,
    },
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
                this.userAuth = response.data.data
            })
        },
        lihatuserByPublic(id) {                      
            this.$router.push({
                name: 'TagihanUser',
                params: {id}
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

<style>
</style>