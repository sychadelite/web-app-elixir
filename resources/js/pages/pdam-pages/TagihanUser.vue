<template>
    <div>
        <section id="section-title">
            <div class="body-section-title" v-if="sambunganAuth">
                <h1>{{ userAuth.name }}</h1>
                <div>
                    <b-row>
                        <b-col cols="12" md="6">
                            <h4>{{ sambunganAuth.nomor_sambungan }}</h4>
                        </b-col>
                        <b-col cols="6" md="6">
                            <div class="float-right">
                                <div v-if="userAuth.status == 0">
                                    <h4>Status: <b-badge variant="dark" class="text-danger">TIDAK AKTIF</b-badge></h4>
                                </div>
                                <div v-if="userAuth.status == 1">
                                    <h4>Status: <b-badge variant="dark" class="text-info">AKTIF</b-badge></h4>
                                </div>
                            </div>
                        </b-col>
                    </b-row>
                </div>
            </div> 
        </section>

        <section id="section-content">
            <div class="body-content" v-if="sambunganAuth">
                <b-row>
                    <b-col cols="6" md="6">
                        <h3>
                            Informasi Rekening Air
                        </h3>
                    </b-col>
                    <b-col cols="6" md="6">
                        
                        <h3 id="popover-target-1" class="info-ic float-right">
                            <b-icon icon="info-circle" variant="info"></b-icon>
                        </h3>
                        <b-popover target="popover-target-1" triggers="hover" placement="top" variant="info">
                            <template #title>Information</template>
                            This is the <b>guidance</b> for you to create payments
                        </b-popover>
                    </b-col>
                </b-row>

                <div style="margin-top: 2rem;">
                    <!-- Tabs with card integration -->
                    <b-card no-body bg-variant="dark">
                        <b-tabs 
                        v-model="tabIndex" 
                        card 
                        align="center" 
                        active-nav-item-class="font-weight-bold text-white bg-primary"
                        active-tab-class="font-weight-bold text-white"
                        >
                            <b-tab title="Tagihan">
                                <h6>Status Tagihan: <span class="float-right">Belum Lunas</span></h6>
                                <div style="margin-top: 4rem;">
                                    <TableTagihanUser/>
                                </div>
                                <div>
                                    <TableTagihanUserSum/>
                                </div>
                            </b-tab>
                            
                            <b-tab title="Detail">
                                I'm the second tab
                                <b-card>
                                    I'm the card in tab
                                </b-card>
                            </b-tab>

                            <b-tab title="Riwayat">
                                I'm the last tab
                            </b-tab>

                            <b-tab title="Premium Plan" disabled>
                                Sibzamini!
                            </b-tab>
                            
                            <b-tab title="Foto">
                                Photo...
                            </b-tab>
                        </b-tabs>
                    </b-card>

                    <!-- Control buttons-->
                    <div class="text-center">
                    <b-button-group class="mt-4">
                        <b-button @click="tabIndex--">Previous</b-button>
                        <b-button @click="tabIndex++">Next</b-button>
                    </b-button-group>

                    <div class="text-muted mt-2">Current Tab: {{ tabIndex }}</div>
                    </div>
                </div>

                <br>
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
import TableTagihanUser from '../../table/TableTagihanUser.vue'
import TableTagihanUserSum from '../../table/TableTagihanUserSum.vue'

export default {
    props: ['id'],
    components: {
        TableTagihanUser, 
        TableTagihanUserSum,
    },
    data() {
        return {
            userAuth: {},
            sambunganAuth: null,
            tabIndex: 0
        }
    },
    mounted() {
        this.getAuthUser(),
        this.getSambungan(),
        this.scrollToTop()
    },
    methods: {
        getAuthUser() {
            axios.get('/api/userAuth', {headers: getHeader()})
                .then(response => {                 
                    this.userAuth = response.data.data
                })
        },
        getSambungan() {
            axios.get('/api/sambunganAuth', {headers: getHeader()})
            .then(response => {               
                this.sambunganAuth = response.data.data
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
.info-ic {
    cursor: pointer;
}
</style>