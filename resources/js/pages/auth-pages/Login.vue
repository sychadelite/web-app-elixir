<template>
    <div>
        <section id="section-content">
            <div class="body-content">

                <h1 class="text-center">LOGIN PAGE</h1>

                <b-row style="margin-top: 1rem;">
                    <b-col cols="12" md="6" style="">
                        
                        <b-form class="home-container" @submit.prevent="handleLogin" style="margin-top: 3rem;">
                            <div class="mb-3 mr-4 ml-4 mt-4">
                                <label for="exampleInputEmail" class="form-label">Email </label>
                                <input type="email" placeholder="ex: your-registered@gmail.com" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" v-model="form.email">
                                <div id="emailHelp" class="form-text"></div>
                            </div>
                            <div class="error alert alert-danger mr-4 ml-4" role="alert" v-if="errors.email">
                                {{errors.email[0]}}
                            </div>

                            <div class="mb-3 mr-4 ml-4">
                                <label for="exampleInputPassword" class="form-label">Password </label>
                                <input type="password" placeholder="ex: %jack51*****" class="form-control" id="exampleInputPassword" aria-describedby="passHelp" v-model="form.password">
                                <div id="passHelp" class="form-text"></div>
                            </div>
                            <div class="error alert alert-danger mr-4 ml-4" role="alert" v-if="errors.password">
                                {{errors.password[0]}}
                            </div>

                            <div class="text-center">
                                <b-button squared variant="primary" class="mt-4 mb-4" style="font-weight: bold;" type="submit"> LOGIN </b-button>
                            </div>
                        </b-form>
                        
                        <div class="text-center" style="margin-top: 4rem; margin-bottom: 4rem;">
                            <p class="mt-4">Forgot Your Password? <router-link :to="{name: 'ForgetPass'}"><strong>Forgot Password</strong></router-link></p>
                            <p class="mt-4">Don't Have an Account? <router-link :to="{name: 'Register'}"><strong>Register Now</strong></router-link></p>
                        </div>
                    </b-col>

                    <b-col cols="12" md="6">
                        <img src="/icons/vector/unlock.png" class="" style="margin-top: -3.5rem;" width="100%" height="" alt="unlock">
                    </b-col>
                </b-row>



            </div>
        </section>
    </div>
</template>

<script>
import {mapState} from 'vuex'
import {getHeader} from '../../config.js'                                                              // import the exported constanta that manually created on this path

export default {
    data() {
        return {
            form: {
                email: '',
                password: ''
            },
            errors: {}
        }
    },
    mounted() {
        this.scrollToTop()
    },
    methods: {
        handleLogin() {
            console.log(this.form)
            const authUser = {}                                                                     // constanta object that created for gathering authorized user data by token that stored in window local storage
            axios.get('/sanctum/csrf-cookie').then(response => {
                //console.log(response);
                axios.post('/api/login', this.form).then((response) => {
                    if(response.data.status) {                                          
                        // alert(response.data.message) 
                        // console.log(response)      
                        // authUser.refresh_token = response.data.refresh_token                 
                        authUser.access_token = response.data.access_token                          // get the access_token         
                        window.localStorage.setItem('authUser', JSON.stringify(authUser))           // stored the access_token in window local storage. you can access it on f12 browser->application->local storage

                        axios.get('/api/userAuth', {headers: getHeader()})                          // getHeader() is a function that manually created on js/config.js to create dynamic header for accessing auth:sanctum api
                            .then(response => {
                                console.log('Authenticated User Object', response)                  
                                authUser.nomor_pelanggan = response.data.data.nomor_pelanggan       // declare one by one user data by saved access_token authUser on local storage
                                authUser.email = response.data.data.email
                                authUser.username = response.data.data.username
                                authUser.name = response.data.data.name
                                authUser.photo = response.data.data.photo
                                authUser.role = response.data.data.role
                                window.localStorage.setItem('authUser', JSON.stringify(authUser))
                                this.$store.dispatch('setUserObject', authUser)
                            })
                        this.$noty.info(response.data.message)                            
     
                        this.$router.push({
                            name: 'Home'                    
                        })    
                    }
                }).catch((error) => {
                    if(error.response.status == 403) {                                       // second method if validate manually
                        this.errors = error.response.data.message
                    } else if (error.response.status == 401) {
                        this.errors = error.response.data.message
                        this.$noty.error(error.response.data.message)
                    }           
                })
            });
        },
        scrollToTop() {
            window.scrollTo(0,0);
        }
    },
    computed: {
        ...mapState({
            userStore: state => state.userStore                                             // this Login.vue just store the authenticated user data and not create the userStore because its for public like registration and about
        })
    },
    
}
</script>


<style>

</style>