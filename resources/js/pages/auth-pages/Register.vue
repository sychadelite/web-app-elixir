<template>
    <div>
        <section id="section-content">
            <div class="body-content">
                <h1>Register</h1>
                <b-form class="col-sm-6 mt-4" @submit.prevent="handleSubmit">                                           <!--  action="/users" method="POST" -->               <!-- @submit.prevent="<your-method-variable>" is event script onSubmit, action="<your-path>" -->
                    <div class="mb-3">
                        <label for="exampleInputName" class="form-label">Name </label>
                        <b-form-input type="text" placeholder="Full Name" class="form-control" id="exampleInputName" aria-describedby="nameHelp" v-model="form.name"></b-form-input>                                 <!-- v-model="<your-key-variable>.<your-attribute> in data() return object" and it used to insert value into database-->
                        <div id="nameHelp" class="form-text"></div>
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.name">
                        {{errors.name[0]}}
                    </div>

                    <div class="mb-3">
                        <label for="feedback-username">Username</label>
                        <b-form-input type="text" placeholder="ex: angelina" class="form-control" id="feedback-username" aria-describedby="usernameHelp" v-model="form.username"></b-form-input>
                        <div id="feedback-username" class="form-text"></div>
                        <b-form-invalid-feedback :state="validationUsername">
                            Your username must be 6-18 characters long.
                        </b-form-invalid-feedback>
                        <b-form-valid-feedback :state="validationUsername">
                            Looks Good.
                        </b-form-valid-feedback>
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.username">
                        {{errors.username[0]}}
                    </div>

                    <div class="mb-3">
                        <label for="exampleInputEmail" class="form-label">Email </label>
                        <input type="text" placeholder="ex: angelina@gmail.com" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" v-model="form.email">
                        <div id="emailHelp" class="form-text text-info">We'll never share your email with anyone else.</div>
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.email">
                        {{errors.email[0]}}
                    </div>

                    <div class="mb-3">
                        <label for="exampleInputPassword" class="form-label">Password </label>
                        <input type="password" placeholder="Strongest Password" class="form-control" id="exampleInputPassword" aria-describedby="passHelp" v-model="form.password">
                        <div id="passHelp" class="form-text text-info">We'll never share your password with anyone else.</div>
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.password">
                        {{errors.password[0]}}
                    </div>

                    <div class="mb-3">
                        <label for="exampleInputAlamat" class="form-label">Alamat </label>
                        <input type="text" placeholder="ex: New Ark st.101, Mazatlan Sinaloa" class="form-control" id="exampleInputAlamat" aria-describedby="alamatHelp" v-model="form.alamat">
                        <div id="alamatHelp" class="form-text"></div>
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.alamat">
                        {{errors.alamat[0]}}
                    </div>

                    <button class="btn btn-warning mt-2" type="submit">Create!</button> 
                </b-form>

                <p class="mt-4">Already Have an Account? <router-link :to="{name: 'Login'}"><strong>Login</strong></router-link></p>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    data() {
        return {
            form: {                                         // declare attribute in database to null
                name: '',
                username: '',
                email: '',
                password: '',
                alamat: ''
            },
            errors: {}                                     // declare and binding errors from handleSubmit() catch error
        }
    },
    methods: {
        handleSubmit() {
            console.log(this.form)
            axios.post('/api/register', this.form).then((response) => {             // route post method api in api.php and the method from AuthController
                if(response.data.status) {                                          // check if "status" in AuthController return response is true
                    // alert(response.data.message)                                    // give an alert to user if the data is successfully uploaded
                    this.$noty.success(response.data.message)                             // give a notification to user with vuejs-noty library. for method like success(), info() etc you can read the documentation in github vuejs-noty. for layout configuration you can read the documentation in configuration section

                    console.log(response)
                    this.$router.push({                                             // push data to User route, and directly go to User pages
                        name: 'Login'                    
                    })    
                }
                
            }).catch((error) => {
                // console.log(error.response) 
                /* if(error.response.status == 422) {                                    // first method if validate automatically
                    this.errors = error.response.data.errors                     
                } */

                // console.log(error.response.status)
                if(error.response.status == 403) {                                       // second method if validate manually
                    this.errors = error.response.data.message
                }             
            })
        }
    },
    computed: {
        validationUsername() {
            return this.form.username.length > 5 && this.form.username.length < 19
        }
    },
}
</script>

<style>
</style>