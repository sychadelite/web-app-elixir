<template>
    <div>
        <section id="section-title">
            <div class="body-section-title" v-if="userAuth">
                <h1><b-icon icon="cup-straw" class="mr-4 mb-2"></b-icon>Membership</h1>
                <div>
                    <b-badge class="mb-2" variant="info">Account: {{ userAuth.username }}</b-badge>
                </div>
            </div>
        </section>

        <div class="body-content" v-if="userAuth">
            <h2 class="text-center">Membership Limited Offers</h2>
            <div style="margin-top: 4rem;">
                <b-row class="text-center">
                    <b-col class="mt-4" cols="12" xl="6" >
                        <div>
                            <b-card no-body class="card-offers overflow-hidden" style="max-width: 540px; background-color: #333;" @click.prevent="lihatofferByPublic('newbie')">
                                <b-row no-gutters>
                                    <b-col cols="6" md="6">
                                        <b-card-img src="/icons/member/dragon-newbie.jpg" alt="Image" class="rounded-0" width="" height="100%"></b-card-img>
                                    </b-col>
                                    <b-col cols="6" md="6">
                                        <b-card-body title="NEWBIE"  style="color: #b4c2dd;">
                                            <b-list-group>
                                                <b-list-group-item class="d-flex justify-content-between align-items-center" variant="warning">
                                                    Cras justo odio
                                                    <b-badge variant="primary" pill>14</b-badge>
                                                </b-list-group-item>

                                                <b-list-group-item class="d-flex justify-content-between align-items-center" variant="success">
                                                    Dapibus ac facilisis in
                                                    <b-badge variant="primary" pill>2</b-badge>
                                                </b-list-group-item>

                                                <b-list-group-item class="d-flex justify-content-between align-items-center" variant="dark">
                                                    Morbi leo risus
                                                    <b-badge variant="primary" pill>1</b-badge>
                                                </b-list-group-item>
                                            </b-list-group>
                                        </b-card-body>
                                    </b-col>
                                </b-row>
                            </b-card>
                        </div> 
                    </b-col>
                    
                    <b-col class="mt-4" cols="12" xl="6" >
                        <div>
                            <b-card no-body class="card-offers overflow-hidden" style="max-width: 540px; background-color: #317655;" @click.prevent="lihatofferByPublic('epic')">
                                <b-row no-gutters>
                                    <b-col cols="6" md="6">
                                        <b-card-img src="/icons/member/dragon-epic.jpg" alt="Image" class="rounded-0" width="" height="100%"></b-card-img>
                                    </b-col>
                                    <b-col cols="6" md="6">
                                        <b-card-body title="EPIC"  style="color: #e7e5d5;">
                                            <b-card-text style="color: #333;">
                                                <b-list-group>
                                                    <b-list-group-item class="d-flex justify-content-between align-items-center" variant="warning">
                                                        Cras justo odio
                                                        <b-badge variant="primary" pill>14</b-badge>
                                                    </b-list-group-item>

                                                    <b-list-group-item class="d-flex justify-content-between align-items-center" variant="success">
                                                        Dapibus ac facilisis in
                                                        <b-badge variant="primary" pill>2</b-badge>
                                                    </b-list-group-item>

                                                    <b-list-group-item class="d-flex justify-content-between align-items-center" variant="dark">
                                                        Morbi leo risus
                                                        <b-badge variant="primary" pill>1</b-badge>
                                                    </b-list-group-item>
                                                </b-list-group>
                                            </b-card-text>
                                        </b-card-body>
                                    </b-col>
                                </b-row>
                            </b-card>
                        </div>
                    </b-col>

                    <b-col class="mt-4" cols="12" xl="6" offset-xl="3" >
                        <div>
                            <b-card no-body class="card-offers overflow-hidden" style="max-width: 540px; background-color: rgb(43, 13, 51);" @click.prevent="lihatofferByPublic('mythical')">
                                <b-row no-gutters>
                                    <b-col cols="6" md="6">
                                        <b-card-img src="/icons/member/dragon-mythical.jpg" alt="Image" class="rounded-0" width="" height="100%"></b-card-img>
                                    </b-col>
                                    <b-col cols="6" md="6">
                                        <b-card-body title="MYTHICAL"  style="color: #b4c2dd;">
                                            <b-card-text>
                                                <b-list-group>
                                                    <b-list-group-item class="d-flex justify-content-between align-items-center" variant="warning">
                                                        Cras justo odio
                                                        <b-badge variant="primary" pill>14</b-badge>
                                                    </b-list-group-item>

                                                    <b-list-group-item class="d-flex justify-content-between align-items-center" variant="success">
                                                        Dapibus ac facilisis in
                                                        <b-badge variant="primary" pill>2</b-badge>
                                                    </b-list-group-item>

                                                    <b-list-group-item class="d-flex justify-content-between align-items-center" variant="dark">
                                                        Morbi leo risus
                                                        <b-badge variant="primary" pill>1</b-badge>
                                                    </b-list-group-item>
                                                </b-list-group>
                                            </b-card-text>
                                        </b-card-body>
                                    </b-col>
                                </b-row>
                            </b-card>
                        </div>
                    </b-col>
                </b-row>
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
        lihatofferByPublic(classify) {                    
            this.$router.push({
                name: 'RequestMembership',
                params: {classify}
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
.card-offers {
    margin-bottom: 4rem;
}
.card-offers:hover {
    cursor: pointer;
    box-shadow: 0 0 11px rgb(2, 152, 82); 
    transform: scale(1.05);
}
</style>