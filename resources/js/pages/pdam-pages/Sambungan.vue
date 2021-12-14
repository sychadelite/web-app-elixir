<template>
    <div>
        <!-- <section id="section-content" v-if="datasambungan">
            <div class="body-content">
                <h1>Visualisasi Data Penggunaan Air Sambungan, {{datasambungan}}.</h1>
                <ul>
                    <li v-for="row in dataSambunganList" :key="row.id_data">
                        <p>{{ row.flow_rate }}</p>
                    </li>
                </ul>
                <router-link :to="{name: 'Sambungan'}"><button class="btn btn-danger">Back</button></router-link>
            </div>
        </section> -->

        <!-- <section id="section-content" v-else>
            <div class="body-content">
                <h1>Daftar Sambungan Anda</h1>
                <ul>
                    <li v-for="row in sambunganList" :key="row.nomor_sambungan">
                        <h3>Nomor Sambungan {{ row.nomor_sambungan }}</h3>
                        <router-link :to="profile_uri(row.nama_alat)">{{row.nama_alat}}</router-link>
                    </li>
                </ul>
                <div class="chart">
                    <PlanetChart/>
                </div>
            </div>
        </section> -->

        <section id="section-content" v-if="nomorsambungan">
            <div class="body-content">
                <h1>Visualisasi Data Penggunaan Air, Sambungan {{userSambunganAuth.nomor_sambungan}}.</h1>

                <div v-if="userSambunganAuth.kondisi_alat == 'broken'">
                    <b-badge class="mb-3 mt-3" variant="danger">Kondisi Alat: {{ userSambunganAuth.kondisi_alat }}</b-badge>
                    <br>
                    <small style="color: #e3342fa6;">* please contact the PDAM technician to fix it ASAP!</small>
                </div>

                <div v-else>
                    <b-badge class="mb-3 mt-3" variant="success">Kondisi Alat: {{ userSambunganAuth.kondisi_alat }}</b-badge>
                </div>

                <!-- <ul>
                    <li v-for="row in userDataSambunganAuth" :key="row.id_data">
                        <p>{{ row.flow_rate }}</p>
                    </li>
                </ul> -->

                <div class="table-sambungan">
                    <TableDataSambungan/>
                </div>
                
                <div class="chart">
                    <PlanetChart/>
                </div>

                <router-link :to="{name: 'Sambungan'}"><button class="btn btn-danger">Back</button></router-link>
            </div>
        </section>

        <section id="section-content" v-else-if="userSambunganAuth">
            <section id="section-title">
                <div class="body-section-title">
                    <h1><img src="/icons/2x/antenna.svg" alt="antenna" class="mr-4 mb-3"> Daftar Sambungan Anda</h1>
                </div>
            </section>

            <div class="body-content">
                <div>
                    <ul>
                        <li>
                            <h3>Nomor Sambungan, {{ userSambunganAuth.nomor_sambungan }}</h3>
                            <router-link :to="sambungan_uri(userSambunganAuth.nomor_sambungan)">{{userSambunganAuth.nama_alat}}</router-link>
                        </li>
                    </ul>
                </div>
            </div>
        </section>

        <section id="section-content" v-else>
            <div class="body-content">
                <div class="text-center" style="margin-top: 10rem;">
                    <b-spinner label="Spinning"></b-spinner>
                </div>
            </div>
        </section>
        
    </div>
</template>

<script>
import PlanetChart from '../../chart/PlanetChart.vue'
import TableDataSambungan from '../../table/TableDataSambungan.vue'
import {getHeader} from '../../config.js'
import {mapState} from 'vuex'

export default {
    props: ['nomorsambungan'],
    components: {
        PlanetChart,
        TableDataSambungan
    },
    data() {
        return {
            sambunganList: [],
            // dataSambunganList: [],
            userSambunganAuth: {},

        }
    },
    mounted() {
        // fetch('/api/sambungan')
        // .then(response => response.json())
        // .then(data => {
        //     console.log('asd', data);
        //     this.sambunganList = data
        // }),

        // fetch('/api/sambungan/datasambungan')
        // .then(response => response.json())
        // .then(data => {
        //     console.log('dsa', data);
        //     this.dataSambunganList = data
        // }),

        this.scrollToTop(),
        this.getAuthUserSambungan()
    },
    methods: {
        sambungan_uri(sambungan) {
            return '/sambungan/' + sambungan
        },
        scrollToTop() {
            window.scrollTo(0,0);
        },
        getAuthUserSambungan() {
            axios.get('/api/sambunganAuth', {headers: getHeader()})
            .then(response => {
                console.log('Authenticated User and Sambungan Object', response)                  
                this.userSambunganAuth = response.data.data
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