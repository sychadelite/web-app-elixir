<template>
    <div>
        <section id="section-content">
            <div class="body-content" v-if="id == userAuth.nomor_pelanggan || userAuth.role == 'public'">
                <h1>Edit User</h1>

                <form class="col-sm-6 mt-4" @submit.prevent="handleUpdate">                                           <!--  action="/users" method="POST" -->               <!-- @submit.prevent="<your-method-variable>" is event script onSubmit, action="<your-path>" -->
                    <div class="mb-3">
                        <label for="exampleInputName" class="form-label">Name </label>
                        <input type="text" class="form-control" id="exampleInputName" aria-describedby="nameHelp" v-model="userdetail.name">                                 <!-- v-model="<your-key-variable>.<your-attribute> in data() return object" and it used to insert value into database-->
                        <div id="nameHelp" class="form-text"></div>
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.name">
                        {{errors.name[0]}}
                    </div>

                    <div class="mb-3">
                        <label for="exampleInputUsername" class="form-label">Username </label>
                        <input type="text" class="form-control" id="exampleInputUsername" aria-describedby="usernameHelp" v-model="userdetail.username">                                 <!-- v-model="<your-key-variable>.<your-attribute> in data() return object" and it used to insert value into database-->
                        <div id="usernameHelp" class="form-text"></div>
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.username">
                        {{errors.username[0]}}
                    </div>

                    <div class="mb-3">
                        <label for="exampleInputEmail" class="form-label">Email </label>
                        <input type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" v-model="userdetail.email">
                        <div id="emailHelp" class="form-text text-info">We'll never share your email with anyone else.</div>
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.email">
                        {{errors.email[0]}}
                    </div>

                    <div class="mb-3">
                        <label for="exampleInputAlamat" class="form-label">Alamat </label>
                        <input type="text" class="form-control" id="exampleInputAlamat" aria-describedby="alamatHelp" v-model="userdetail.alamat">
                        <div id="alamatHelp" class="form-text"></div>
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.alamat">
                        {{errors.alamat[0]}}
                    </div>

                    <div class="form-footer">
                        <button class="btn btn-outline-primary rounded-pill mr-2 mt-4" @click.prevent="toProfile()">Back</button>
                        <button class="btn btn-warning rounded-pill mt-4" type="submit">Update</button> 
                    </div>
                </form>
            </div>

            <div class="body-content" v-else-if="userAuth.role == 'admin'">
                <h1>Edit This Member</h1>

                <form class="col-sm-6 mt-4" @submit.prevent="handleUpdateByAdmin">                                           <!--  action="/users" method="POST" -->               <!-- @submit.prevent="<your-method-variable>" is event script onSubmit, action="<your-path>" -->
                    <div class="mb-3">
                        <label for="exampleInputName" class="form-label">Member Name </label>
                        <input type="text" class="form-control" id="exampleInputName" aria-describedby="nameHelp" v-model="userdetail.name">                                 <!-- v-model="<your-key-variable>.<your-attribute> in data() return object" and it used to insert value into database-->
                        <div id="nameHelp" class="form-text"></div>
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.name">
                        {{errors.name[0]}}
                    </div>

                    <div class="mb-3">
                        <label for="exampleInputUsername" class="form-label">Member Username </label>
                        <input type="text" class="form-control" id="exampleInputUsername" aria-describedby="usernameHelp" v-model="userdetail.username">                                 <!-- v-model="<your-key-variable>.<your-attribute> in data() return object" and it used to insert value into database-->
                        <div id="usernameHelp" class="form-text"></div>
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.username">
                        {{errors.username[0]}}
                    </div>

                    <div class="mb-3">
                        <label for="exampleInputEmail" class="form-label">Member Email </label>
                        <input type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" v-model="userdetail.email">
                        <div id="emailHelp" class="form-text text-info">We'll never share your email with anyone else.</div>
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.email">
                        {{errors.email[0]}}
                    </div>

                    <div class="mb-3">
                        <label for="exampleInputAlamat" class="form-label">Member Alamat </label>
                        <input type="text" class="form-control" id="exampleInputAlamat" aria-describedby="alamatHelp" v-model="userdetail.alamat">
                        <div id="alamatHelp" class="form-text"></div>
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.alamat">
                        {{errors.alamat[0]}}
                    </div>

                    <div class="form-footer">
                        <button class="btn btn-outline-primary rounded-pill mr-2 mt-4" @click.prevent="toMemberProfile()">Back To Member Profile</button>
                        <button class="btn btn-warning rounded-pill mt-4" type="submit">Update This Member Details</button> 
                    </div>
                </form>
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
import {mapState} from 'vuex'
import {getHeader} from '../../config.js'

export default {
    props: ['id'],
    data() {
        return {
            userdetail: {                                                                                             // declare attribute in database to null
                name: '',
                username: '',
                email: '',
                alamat: ''
            },
            errors: {},                                                                                          // declare and binding errors from handleSubmit() catch error
            userAuth: {}
        }
    },
    mounted() {
        this.getUser(),
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
        getUser() {
             axios.get('/api/users/' + this.id).then((response) => {                                            // axios."get" here is depend on what method in api routing, + this.<your-props>
                this.userdetail = {
                    name: response.data.name,
                    username: response.data.username,
                    email: response.data.email,
                    alamat: response.data.alamat
                }
            })
        },
        handleUpdate() {
            axios.put('/api/users/' + this.id, this.userdetail).then((response) => {                            // route http request "put" method api in api.php and the method from AuthController; ('/api/users' + this.<props>, this.<your-data()-return-variable)
                if(response.data.status) {                                                                      // check if "status" in AuthController return response is true
                    // alert(response.data.message)                                                             // give an alert to user if the data is successfully uploaded
                    this.$noty.success(response.data.message)                                                   // give a notification to user with vuejs-noty library. for method like success(), info() etc you can read the documentation in github vuejs-noty. for layout configuration you can read the documentation in configuration section
                    this.$router.push({                                                                         // push data to User route, and directly go to User pages
                        name: 'Profile'                    
                    })    
                }  
            }).catch((error) => {
                if(error.response.status == 403) {                                                              // second method if validate manually
                    this.errors = error.response.data.message
                }             
            })
        },
        handleUpdateByAdmin() {
            axios.put('/api/users/' + this.id, this.userdetail).then((response) => {
                if(response.data.status) {
                    this.$noty.success(response.data.message)
                    this.$router.push({
                        name: 'MemberProfile'                    
                    })    
                }  
            }).catch((error) => {
                if(error.response.status == 403) {
                    this.errors = error.response.data.message
                }             
            })
        },
        toProfile() {                      
            this.$router.push({
                name: 'Profile',
            })
        },
        toMemberProfile() {                      
            this.$router.push({
                name: 'MemberProfile',
            })
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

<style>
</style>