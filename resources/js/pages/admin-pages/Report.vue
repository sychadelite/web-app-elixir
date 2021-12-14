<template>
    <div>
        <section id="section-content" style="margin-bottom: 20rem;">
            <section id="section-title" v-if="userAuth.role == 'admin'">
                <div class="body-section-title">
                    <h1><img src="/icons/2x/report_problem_white_48dp.svg" alt="members" class="mr-4 mb-2">Reports</h1>
                    <div>
                        <b-badge class="mb-2" variant="info">Admin: {{ userAuth.username }}</b-badge>
                    </div>
                </div>
            </section>
            <div class="body-content" v-if="userAuth.role == 'admin'">
                <ul>
                    <li v-for="row in reports" :key="row.id_report">
                        <p>{{ row.keluhan }}, {{ row.username }}, {{ row.email }}</p>
                    </li>
                </ul>
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

export default {
    data() {
        return {
            userAuth: {},
            reports: null
        }
    },
    mounted() {
        this.getAuthUser(),
        this.getReports(),
        this.scrollToTop()
    },
    methods: {
        getAuthUser() {
            axios.get('/api/userAuth', {headers: getHeader()})
                .then(response => {             
                    this.userAuth = response.data.data
                })
        },
        getReports() {
            axios.get('/api/report').then((response) => {
                this.reports = response.data.data
                console.log('joined', response)
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
