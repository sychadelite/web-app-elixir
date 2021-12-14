<template>
    <div>
        <section id="section-content">

            <div class="body-content" v-if="id == userAuth.nomor_pelanggan">
                <div class="rounded-circle box-photo mb-3">
                    <img id="dp" class="rounded-circle center-cropped" alt="" width="100" height="100" v-if="userAuth.photo" :src="'/images/' + userAuth.photo">
                    <img id="dp" class="rounded-circle center-cropped" alt="" width="100" height="100" v-else src="/images/yoda.png">
                </div>
                <h1>Hai, {{userAuth.username}}.</h1>
                <p>Name : <strong>{{userAuth.name}}</strong></p>                                                                                                                                                                                                                    <!-- "$route.params.name" is used to render segment value to the template -->
                <p>Email : <strong>{{userAuth.email}}</strong></p>                                                                                                                                                                                                                    <!-- "$route.params.name" is used to render segment value to the template -->
                <p>Alamat : <strong>{{userAuth.alamat}}</strong></p>
                <div v-if="userAuth.status == 0"><p>Status : <span class="badge bg-danger text-white">Not Active</span></p></div>
                <div v-if="userAuth.status == 1"><p>Status : <span class="badge bg-success text-white">Active</span></p></div>

                <a @click.prevent="editUser"><button class="btn btn-warning rounded-pill btn-material-icon-edit m-3"><img class="mr-2" type="image/x-icon" src="/icons/2x/edit.png" alt="" width="24" height="24">Edit</button></a>                                                                                                          <!-- second method using editUser() methods -->
                <a @click.prevent="updatePhoto(userAuth.nomor_pelanggan)"><button class="btn btn-dark rounded-pill btn-material-icon-edit m-3"><img class="mr-2" type="image/x-icon" src="/icons/2x/add-camera-white.png" alt="" width="24" height="24">Update Photo</button></a>
                <a @click.prevent="handleDelete"><button class="btn btn-outline-danger rounded-pill btn-material-icon-delete m-3"><img class="mr-2" type="image/x-icon" src="/icons/2x/delete-forever.png" alt="" width="24" height="24">Delete</button></a>
                <!-- <router-link :to="{name: 'EditUser'}"><button class="btn btn-warning">Edit</button></router-link> -->
                <!-- <router-link :to="{name: 'UploadPhotoUser', params: {id: userAuth.nomor_pelanggan}}"><button class="btn btn-dark">Update Photo</button></router-link> -->                                                                                                        <!-- params: {<your-props>: <your-data-return-field>.<your-column-unique-id>} -->

                <div v-if="userAuth.role == 'admin'">
                    <button class="btn btn-outline-primary rounded-pill btn-material-icon-back m-3" @click.prevent="toMembers()"><img class="mr-2" type="image/x-icon" src="/icons/2x/reply.png" alt="" width="24" height="24">Check Other Members</button>
                </div>
            </div>

            <div class="body-content" v-else>
                <div>
                    <div class="d-flex align-items-center mb-3">
                    <b-progress class="w-100" :max="maxLoadingTime" height="1.5rem">
                        <b-progress-bar :value="loadingTime" :label="`${((loadingTime / maxLoadingTime) * 100).toFixed(2)}%`"></b-progress-bar>
                    </b-progress>

                    <!-- <b-button class="ml-3" @click="startLoading()">Reload</b-button> -->
                    </div>

                    <!-- <b-skeleton-wrapper :loading="loading">
                    <template #loading>
                        <b-card>
                        <b-skeleton width="85%"></b-skeleton>
                        <b-skeleton width="55%"></b-skeleton>
                        <b-skeleton width="70%"></b-skeleton>
                        </b-card>
                    </template>
                    </b-skeleton-wrapper> -->
                </div>
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
    props: ['id'],                                                                                                                                                                      // 'name' url path parameter in router configuration because the props value is true
    data() {
        return {
            userAuth: {},
            loading: false,
            loadingTime: 0,
            maxLoadingTime: 3
        }
    },
    watch: {
        loading(newValue, oldValue) {
            if (newValue !== oldValue) {
                this.clearLoadingTimeInterval()

                if (newValue) {
                    this.$_loadingTimeInterval = setInterval(() => {
                    this.loadingTime++
                    }, 1000)
                }
            }
        },
        loadingTime(newValue, oldValue) {
            if (newValue !== oldValue) {
                if (newValue === this.maxLoadingTime) {
                    this.loading = false
                }
            }
        }
    },
    mounted() {
        this.getAuthUser(),
        this.scrollToTop(),
        this.startLoading()
    },
    methods: {
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
                            name: 'Member'                    
                        })    
                    }
                })
                this.$noty.error('Data user berhasil dihapus')
            } else {
                return false
            }
        },
        toMembers() {                      
            this.$router.push({
                name: 'Member',
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
        },
        clearLoadingTimeInterval() {
            clearInterval(this.$_loadingTimeInterval)
            this.$_loadingTimeInterval = null
        },
        startLoading() {
            this.loading = true
            this.loadingTime = 0
        }
    },
    created() {
        const userObj = JSON.parse(window.localStorage.getItem('authUser'))                 
        this.$store.dispatch('setUserObject', userObj)

        this.$_loadingTimeInterval = null
    }
}
</script>