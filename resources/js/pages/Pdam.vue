<template>
    <div>
        <section id="section-content" v-if="cabangpdam">
            <div class="body-content">
                <h1>Selamat Datang di Cabang PDAM, {{cabangpdam}}.</h1>     <!-- "$route.params.pdam" is used to render segment value to the template -->
                <ul>
                    <li v-for="row in cabangPdamList" :key="row.nama_cabang">
                        <p>{{ row.nama_cabang }}</p>
                    </li>
                </ul>
                <router-link :to="{name: 'Pdam'}"><button class="btn btn-danger">Back</button></router-link>
            </div>
        </section>

        <section id="section-content" v-else>
            <div class="body-content">
                <h1>Daftar Cabang PDAM</h1>
                <ul>
                    <li v-for="row in pdamList" :key="row.nama_pusat">
                        <h3>Domisili {{ row.kota_pusat }}</h3>
                        <router-link :to="profile_uri(row.nama_pusat)">{{row.nama_pusat}}</router-link>
                    </li>
                </ul>
                <div class="chart">
                    <PlanetChart/>
                </div>
            </div>  
        </section>
    </div>
</template>

<script>
import PlanetChart from '../chart/PlanetChart.vue'
import {mapState} from 'vuex'

export default {
    components: {
        PlanetChart
    },
    props: ['cabangpdam'],                                                          // 'pdam' url path parameter in router configuration because the props value is true
    data() {
        return {
            pdamList: [],
            cabangPdamList: []
        }
    },
    mounted() {
        // axios.get('/api/pdam').then((response) => {                              // first method: axios."get" here is depend on what method in api routing
            // this.pdamList = response.data                                        // this.<your-data()-return-variable>
        // }),

        fetch('/api/pdam')                                                          // second method to fetch data from database intead of using axios
        .then(response => response.json())
        .then(data => {
            console.log(data);
            this.pdamList = data
        }),

        fetch('/api/pdam/cabangpdam')
        .then(response => response.json())
        .then(data => {
            console.log(data);
            this.cabangPdamList = data
        })
    },
    methods: {
        profile_uri(pdam) {
            return '/pdam/' + pdam.toLowerCase()
        }
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