<template>
    <div>
        <section id="section-content" v-if="datasambungan">
            <div class="body-content">
                <h1>Visualisasi Data Penggunaan Air Sambungan, {{datasambungan}}.</h1>
                <ul>
                    <li v-for="row in dataSambunganList" :key="row.id_data">
                        <p>{{ row.flow_rate }}</p>
                    </li>
                </ul>
                <router-link :to="{name: 'Sambungan'}"><button class="btn btn-danger">Back</button></router-link>
            </div>
        </section>

        <section id="section-content" v-else>
            <div class="body-content">
                <h1>Daftar Sambungan Anda</h1>
                <ul>
                    <li v-for="row in sambunganList" :key="row.nomor_sambungan">
                        <h3>Nomor Sambungan {{ row.nomor_sambungan }}</h3>
                        <router-link :to="profile_uri(row.nama_alat)">{{row.nama_alat}}</router-link>
                    </li>
                </ul>
            </div>
        </section>
    </div>
</template>

<script>
import {mapState} from 'vuex'

export default {
    props: ['datasambungan'],
    data() {
        return {
            sambunganList: [],
            dataSambunganList: []
        }
    },
    mounted() {
        fetch('/api/sambungan')
        .then(response => response.json())
        .then(data => {
            console.log(data);
            this.sambunganList = data
        }),

        fetch('/api/sambungan/datasambungan')
        .then(response => response.json())
        .then(data => {
            console.log(data);
            this.dataSambunganList = data
        })
    },
    methods: {
        profile_uri(sambungan) {
            return '/sambungan/' + sambungan
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