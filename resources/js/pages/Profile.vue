<template>
    <div>
        <section id="section-content">
            <div class="body-content" v-if="id == userAuth.nomor_pelanggan | userAuth.role == 'admin'">
                <div class="rounded-circle box-photo mb-3">
                    <img id="dp" class="rounded-circle center-cropped" alt="" width="100" height="100" v-if="detailuser.photo" :src="'/images/' + detailuser.photo">
                    <img id="dp" class="rounded-circle center-cropped" alt="" width="100" height="100" v-else src="/images/yoda.png">
                </div>
                <h1>Hai, {{detailuser.username}}.</h1>
                <p>Name : <strong>{{detailuser.name}}</strong></p>                                                                                                                                                                                                                    <!-- "$route.params.name" is used to render segment value to the template -->
                <p>Email : <strong>{{detailuser.email}}</strong></p>                                                                                                                                                                                                                    <!-- "$route.params.name" is used to render segment value to the template -->
                <p>Alamat : <strong>{{detailuser.alamat}}</strong></p>
                <div v-if="detailuser.status == 0"><p>Status : <span class="badge bg-danger text-white">Not Active</span></p></div>
                <div v-if="detailuser.status == 1"><p>Status : <span class="badge bg-success text-white">Active</span></p></div>
                <button class="btn btn-outline-primary rounded-pill btn-material-icon-back m-3" @click.prevent="toUsers()"><img class="mr-2" type="image/x-icon" src="/icons/2x/reply.png" alt="" width="24" height="24">Back</button>
                <a @click.prevent="editUser"><button class="btn btn-warning rounded-pill btn-material-icon-edit m-3"><img class="mr-2" type="image/x-icon" src="/icons/2x/edit.png" alt="" width="24" height="24">Edit</button></a>                                                                                                          <!-- second method using editUser() methods -->
                <a @click.prevent="updatePhoto(detailuser.nomor_pelanggan)"><button class="btn btn-dark rounded-pill btn-material-icon-edit m-3"><img class="mr-2" type="image/x-icon" src="/icons/2x/add-camera-white.png" alt="" width="24" height="24">Update Photo</button></a>
                <a @click.prevent="handleDelete"><button class="btn btn-outline-danger rounded-pill btn-material-icon-delete m-3"><img class="mr-2" type="image/x-icon" src="/icons/2x/delete-forever.png" alt="" width="24" height="24">Delete</button></a>
                <!-- <router-link :to="{name: 'EditUser'}"><button class="btn btn-warning">Edit</button></router-link> -->
                <!-- <router-link :to="{name: 'UploadPhotoUser', params: {id: detailuser.nomor_pelanggan}}"><button class="btn btn-dark">Update Photo</button></router-link> -->                                                                                                        <!-- params: {<your-props>: <your-data-return-field>.<your-column-unique-id>} -->
            </div>
            <div class="body-content" v-else>
                <div class="rounded-circle box-photo mb-3"></div>
            </div>
        </section>
    </div>
</template>

<script>
import {mapState} from 'vuex'
import {getHeader} from '../config.js'

export default {
    props: ['id'],                                                                                                                                                                      // 'name' url path parameter in router configuration because the props value is true
    data() {
        return {
            detailuser: {},
            userAuth: {}
        }
    },
    mounted() {
        this.getUser(),
        this.getAuthUser(),
        this.scrollToTop()
    },
    methods: {
        getUser() {
            axios.get('/api/users/' + this.id).then((response) => {                                                                                                                     // axios."get" here is depend on what method in api routing, + this.<your-props>
                console.log(response)
                this.detailuser = response.data
            })
        },
        getAuthUser() {
            axios.get('/api/userAuth', {headers: getHeader()})
                .then(response => {                 
                    this.userAuth = response.data.data
                })
        },
        handleDelete() {                                                                                                                                                                // axios."delete" is used to delete specific id <props>
            if(confirm('Apakah ingin dihapus?')) {
                axios.delete('/api/users/' + this.id).then((response) => {
                    if(response.data.status) {                        
                        this.$router.push({                                             
                            name: 'User'                    
                        })    
                    }
                })
                this.$noty.error('Data user berhasil dihapus')
            } else {
                return false
            }
        },
        toUsers() {                      
            this.$router.push({
                name: 'User',
            })
        },
        editUser() {
            this.$router.push({                                                                                                                                                      // second alternative method
                name: 'EditUser',
                params: {id: this.id}                                                                                                                                                // params: {your-props-name: your-function-paramater}, the alternative if "your-function-paramater" is same as "your-props-name" you can concate them to {id}
            })
        },
        updatePhoto(id) {
            this.$router.push({
                name: 'UploadPhotoUser', 
                params: {id}
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
        console.log('I was Created')
        const userObj = JSON.parse(window.localStorage.getItem('authUser'))                 
        this.$store.dispatch('setUserObject', userObj)
    }
}
</script>