<template>
    <div>
        <section id="section-content" v-if="cabangpdam">
            <section id="section-title">
                <div class="body-section-title">
                    <h1><img src="/icons/2x/holiday_village_white_48dp.svg" alt="office" class="mr-4 mb-3">Daftar Cabang PDAM, {{cabangpdam}}</h1>
                </div>
            </section>

            <div class="body-content">
                <h3>Selamat Datang di Cabang PDAM, {{cabangpdam}}.</h3>     <!-- "$route.params.pdam" is used to render segment value to the template -->
                <ul>
                    <li v-for="row in cabangPdamList" :key="row.nama_cabang">
                        <p>{{ row.nama_cabang }}</p>
                    </li>
                </ul>
                <router-link :to="{name: 'Pdam'}"><button class="btn btn-danger">Back</button></router-link>
            </div>
        </section>

        <section id="section-content" v-else>
            <section id="section-title">
                <div class="body-section-title">
                    <h1><img src="/icons/2x/maps_home_work_white_48dp.svg" alt="office" class="mr-4 mb-3">Daftar Pusat PDAM</h1>
                </div>
            </section>
            <div class="body-content">
                <ul>                  
                        <div>
                            <h3 style="margin-top: 2rem;">Domisili Kota Jakarta</h3>
                            <div v-for="row in pdamList" :key="row.id_pusat">
                                <li v-if="row.kota_pusat == 'Kota Jakarta'">
                                    <router-link :to="profile_uri(row.nama_pusat)">{{row.nama_pusat}}</router-link>
                                </li>
                            </div>

                            
                        </div>

                        <div>
                            <h3 style="margin-top: 2rem;">Domisili Kota Sukabumi</h3>
                            <div v-for="row in pdamList" :key="row.id_pusat">
                                <li v-if="row.kota_pusat == 'Kota Sukabumi'">
                                    <router-link :to="profile_uri(row.nama_pusat)">{{row.nama_pusat}}</router-link>
                                </li>
                            </div>
                        </div>

                        <div>
                            <h3 style="margin-top: 2rem;">Domisili Kota Semarang</h3>
                            <div v-for="row in pdamList" :key="row.id_pusat">
                                <li v-if="row.kota_pusat == 'Kota Semarang'">
                                    <router-link :to="profile_uri(row.nama_pusat)">{{row.nama_pusat}}</router-link>
                                </li>
                            </div>
                        </div>

                </ul>
                
            </div>  
        </section>
    </div>
</template>

<script>
import {mapState} from 'vuex'

export default {
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
        }),

        this.scrollToTop()
    },
    methods: {
        profile_uri(pdam) {
            return '/pdam/' + pdam.toLowerCase()
        },
        scrollToTop() {
            window.scrollTo(0,0);
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