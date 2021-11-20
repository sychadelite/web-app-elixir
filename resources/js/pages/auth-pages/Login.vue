<template>
    <div>
        <section id="section-content">
            <div class="body-content">
                <h1>Login Page</h1>
                <form class="col-sm-6 mt-4" @submit.prevent="handleLogin">
                    <div class="mb-3">
                        <label for="exampleInputEmail" class="form-label">Email </label>
                        <input type="email" placeholder="ex: your-registered@gmail.com" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" v-model="form.email">
                        <div id="emailHelp" class="form-text"></div>
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.email">
                        {{errors.email[0]}}
                    </div>

                    <div class="mb-3">
                        <label for="exampleInputPassword" class="form-label">Password </label>
                        <input type="password" placeholder="your-password" class="form-control" id="exampleInputPassword" aria-describedby="passHelp" v-model="form.password">
                        <div id="passHelp" class="form-text"></div>
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.password">
                        {{errors.password[0]}}
                    </div>

                    <button class="btn btn-primary mt-2" type="submit">Login!</button>
                </form>
                
                <p class="mt-4">Forgot Your Password? <router-link :to="{name: 'ForgetPass'}"><strong>Forgot Password</strong></router-link></p>
                <p class="mt-4">Don't Have an Account? <router-link :to="{name: 'Register'}"><strong>Register Now</strong></router-link></p>
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
                                authUser.name = response.data.data.name
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