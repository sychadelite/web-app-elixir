<template>
    <div>
        <section id="section-content" style="margin-bottom: 20rem;">
            <section id="section-title" v-if="userAuth.role == 'admin'">
                <div class="body-section-title">
                    <h1><img src="/icons/2x/loyalty_white_48dp.svg" alt="members" class="mr-4 mb-2">Members</h1>
                    <div>
                        <b-badge class="mb-2" variant="info">Admin: {{ userAuth.username }}</b-badge>
                    </div>
                </div>
            </section>
            
            <div class="body-content" v-if="userAuth.role == 'admin'">
                <div class="home-container">
                    <div id="watcher-search-example">
                        <div class="mb-4">
                            <h3>Search Member</h3>
                        </div>

                        <div style="width: 100%;">
                            <input v-model="question" id="bd-search-input" type="search" placeholder="Search..." autocomplete="off" aria-label="Search docs" class="form-control ds-input" spellcheck="false" role="combobox" aria-autocomplete="list" aria-expanded="false" aria-owns="algolia-autocomplete-listbox-0" dir="auto" style="position: relative; vertical-align: top;">

                            <b-list-group style="max-height: 12rem; overflow: auto;">
                                <b-list-group-item href="#" variant="info" v-for="user in answer" :key="user.nomor_pelanggan">
                                    <a href="" @click.prevent="lihatuserByAdmin(user.nomor_pelanggan)">{{ user.name }} </a>
                                </b-list-group-item>
                            </b-list-group>
                        </div>
                    </div>
                </div>

                <div class="home-container">
                    <div class="mt-4">
                        <h3>Tabel Member</h3>
                    </div>
                        
                    <div class="mt-4">
                        <TableMember/>
                    </div>
                </div>
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
import TableMember from '../../table/TableMember.vue'

export default {
    components: {
        TableMember,
    },
    data() {
        return {
            userAuth: {},
            users: null,
            question: '',
            answer: null
        }
    },
    watch: {
        // whenever question changes, this function will run
        question: function (newQuestion, oldQuestion) {
        this.answer = 'Waiting for you to stop typing...'
        this.debouncedGetAnswer()
        }
    },
    mounted() {
        this.getAuthUser(),
        this.getUsers(),
        this.scrollToTop()
    },
    methods: {
        getAnswer() {
        // if (this.question.indexOf('?') === -1) {
        //     this.answer = 'Questions usually contain a question mark. ;-)'
        //     return
        // }
        this.answer = 'Thinking...'
        var vm = this
        axios.get('/api/users/search/' + this.question)
            .then(function (response) {
            vm.answer = response.data.data
            })
            .catch(function (error) {
            vm.answer = 'Error! Could not reach the API. ' + error
            })
        },
        getAuthUser() {
            axios.get('/api/userAuth', {headers: getHeader()})
                .then(response => {
                    console.log('Authenticated User Object', response)                  
                    this.userAuth = response.data.data
                })
        },
        getUsers() {
            axios.get('/api/users').then((response) => {                                        // axios."get" here is depend on what method in api routing
                this.users = response.data                                                      // this.<your-data()-return-variable>
            })
        },
        lihatuserByAdmin(id) {                      
            this.$router.push({
                name: 'MemberProfile',
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

        // answer
        this.debouncedGetAnswer = _.debounce(this.getAnswer, 500)
    }
}
</script>

<style>
</style>
