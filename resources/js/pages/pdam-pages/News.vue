<template>
    <div>
        <section id="section-content">
            <NewsCarousel/>
            <div class="body-content">
                <!-- <div v-if="person.name == 'Edson'">
                    <span>person.name: {{ person.name }}</span><br>
                    <br>
                    <button @click="changeName">this.person.name = 'Arantes'; (will auto update because `name` was in `data`)</button><br>
                    <br>
                </div>
                <div v-else>
                    <span>person.name: {{ person.name }}</span><br>
                    <br>
                    <button @click="changeName1">this.person.name = 'Arantes'; (will auto update because `name` was in `data`)</button><br>
                    <br>
                </div>
                <br>
                For more info, read the comments in the code. Or check the docs on <b>Reactivity</b> (link below). -->

                <h3 class="title-chart">BERITA TERKINI</h3>

                <div class="card-news" v-for="row in news" :key="row.id_news">
                    <b-card no-body class="overflow-hidden" style="max-width: 100%;" bg-variant="dark" text-variant="white">
                        <b-row no-gutters>
                        <b-col md="4">
                            <b-card-img src="/images/news/healthy-env.jpg" alt="Image" class="rounded-0" height="100%"></b-card-img>
                        </b-col>
                        <b-col md="8">
                            <b-card-body :title="row.headline">
                                <b-card-text>
                                    {{ row.content }}
                                </b-card-text>
                                <b-card-footer>
                                    <small class="text-muted">{{row.nama_pusat}}</small>
                                    <br>
                                    <small class="text-muted">{{row.created_at}}</small>
                                </b-card-footer>
                            </b-card-body>
                        </b-col>
                        </b-row>
                    </b-card>
                </div>
                
            </div>
        </section>
    </div>
</template>

<script>
import NewsCarousel from '../../carousel/NewsCarousel.vue'

export default {
    components: {
        NewsCarousel,
    },
    data() {
        return {
            // person: {
            //     name: 'Edson'
            // }
            news: null
        }
    },
    mounted() {
        this.getAllNews()
    },
    methods: {
        // changeName() {
        //     // because name is declared in data, whenever it
        //     // changes, Vue automatically updates
        //     this.person.name = 'Arantes';
        // },
        // changeName1() {
        //     // because name is declared in data, whenever it
        //     // changes, Vue automatically updates
        //     this.person.name = 'Edson';
        // }
        getAllNews() {
            axios.get('/api/news')
                .then(response => {                
                    this.news = response.data.data
                })
        },
    },
    created() {
        const userObj = JSON.parse(window.localStorage.getItem('authUser'))                 
        this.$store.dispatch('setUserObject', userObj)
    }
}
</script>

<style>
.card-news {
    margin-bottom: 4rem;
}
.card-news:hover {
    cursor: pointer;
    box-shadow: 0 0 11px rgb(2, 113, 152); 
}
</style>
