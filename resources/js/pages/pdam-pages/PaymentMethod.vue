<template>
    <div>
        <section id="section-title">
            <div class="body-section-title" v-if="userAuth">
                <h1><b-icon icon="credit-card" class="mr-4 mb-2"></b-icon>Payment Gateway</h1>
                <div>
                    <b-badge class="mb-2" variant="info">Account: {{ userAuth.username }}</b-badge>
                </div>
            </div>
        </section>

        <div class="body-content" v-if="userAuth">
            <h2>Select Payment Method</h2>
            <div>
                <b-container class="bv-example-row mb-4" style="margin-top: 4rem;">
                    <b-row cols="4">
                        <b-col cols="12" md="3">
                            <b-card class="payment-card mb-4" style="width: 150px; height: 100px;"
                                overlay
                                img-src="/icons/vendor/bca.png"
                                img-alt="BCA"
                                bg-variant="light"
                            >
                            </b-card>
                        </b-col>
                        <b-col cols="12" md="3">
                            <b-card class="payment-card mb-4" style="width: 150px; height: 100px;"
                                overlay
                                img-src="/icons/vendor/mandiri.jpg"
                                img-alt="MANDIRI"
                                bg-variant="light"
                            >
                            </b-card>
                        </b-col>
                        <b-col cols="12" md="3">
                            <b-card class="payment-card mb-4" style="width: 150px; height: 100px;"
                                overlay
                                img-src="/icons/vendor/gopay.png"
                                img-alt="gopay"
                                bg-variant="light"
                            >
                            </b-card>
                        </b-col>
                        <b-col cols="12" md="3">
                            <b-card class="payment-card mb-4" style="width: 150px; height: 100px;"
                                overlay
                                img-src="/icons/vendor/ovo.png"
                                img-alt="ovo"
                                bg-variant="light"
                            >
                            </b-card>
                        </b-col>
                        <b-col cols="12" md="3">
                            <b-card class="payment-card mb-4" style="width: 150px; height: 100px;"
                                overlay
                                img-src="/icons/vendor/linkaja.png"
                                img-alt="linkaja"
                                bg-variant="light"
                            >
                            </b-card>
                        </b-col>
                        <b-col cols="12" md="3">
                            <b-card class="payment-card mb-4" style="width: 150px; height: 100px;"
                                overlay
                                img-src="/icons/vendor/sepulsa.png"
                                img-alt="sepulsa"
                                bg-variant="light"
                            >
                            </b-card>
                        </b-col>
                    </b-row>
                </b-container>
            </div>
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
.payment-card:hover {
    cursor: pointer;
    box-shadow: 0 0 11px rgb(2, 113, 152); 
    transform: scale(1.2);
    
}
</style>