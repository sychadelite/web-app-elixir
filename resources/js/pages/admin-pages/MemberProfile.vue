<template>
    <div>

        <section id="section-content">
            <section id="section-title" v-if="userAuth.role == 'admin'">
                <div class="body-section-title">
                    <h1><img src="/icons/2x/loyalty_white_48dp.svg" alt="members" class="mr-4 mb-2">Member Profile</h1>
                    <div>
                        <b-badge class="mb-2" variant="info">Admin: {{ userAuth.username }}</b-badge>
                    </div>
                </div>
            </section>
            <div class="body-content" v-if="userAuth.role == 'admin'">
            
                <div class="rounded-circle box-photo mb-3">
                    <img id="dp" class="rounded-circle center-cropped" alt="" width="100" height="100" v-if="detailuser.photo" :src="'/images/' + detailuser.photo">
                    <img id="dp" class="rounded-circle center-cropped" alt="" width="100" height="100" v-else src="/images/yoda.png">
                </div>
                <div>
                    <h1>Hai, {{detailuser.username}}.</h1>
                    <p>Name : <strong>{{detailuser.name}}</strong></p>
                    <p>Email : <strong>{{detailuser.email}}</strong></p>
                    <p>Alamat : <strong>{{detailuser.alamat}}</strong></p>
                    <div v-if="detailuser.status == 0"><p>Status : <span class="badge bg-danger text-white">Not Active</span></p></div>
                    <div v-if="detailuser.status == 1"><p>Status : <span class="badge bg-success text-white">Active</span></p></div>

                    <a @click.prevent="editUser"><button class="btn btn-warning rounded-pill btn-material-icon-edit m-3"><img class="mr-2" type="image/x-icon" src="/icons/2x/edit.png" alt="" width="24" height="24">Edit</button></a>
                    <a @click.prevent="updatePhoto(detailuser.nomor_pelanggan)"><button class="btn btn-dark rounded-pill btn-material-icon-edit m-3"><img class="mr-2" type="image/x-icon" src="/icons/2x/add-camera-white.png" alt="" width="24" height="24">Update Photo</button></a>
                    <a @click.prevent="handleDelete"><button class="btn btn-outline-danger rounded-pill btn-material-icon-delete m-3"><img class="mr-2" type="image/x-icon" src="/icons/2x/delete-forever.png" alt="" width="24" height="24">Delete</button></a>

                    <button class="btn btn-outline-primary rounded-pill btn-material-icon-back m-3" @click.prevent="toMembers()"><img class="mr-2" type="image/x-icon" src="/icons/2x/reply.png" alt="" width="24" height="24">Check Other Members</button>
                </div>
            </div>
        
            <div class="body-content" v-else-if="userAuth.role == 'public'">
                <div class="text-center" style="margin-top: 10rem;">
                    <b-spinner label="Spinning"></b-spinner>
                    <h2>Hey yo, 401 Unauthorized. You are not admin right?</h2>
                </div>
            </div>

            <!-- <div class="body-content" v-else-if="detailuser.nomor_pelanggan == null || userAuth.role == 'admin'">
                <div class="text-center" style="margin-top: 10rem;">
                    <b-spinner label="Spinning"></b-spinner>
                    <h2>404: USER NOT FOUND</h2>
                </div>
            </div> -->

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
    props: ['id'],
    data() {
        return {
            detailuser: {},
            userAuth: {},
        }
    },
     mounted() {
        this.getUser(),
        this.getAuthUser(),
        this.scrollToTop()
    },
    methods: {
        getUser() {
            axios.get('/api/users/' + this.id).then((response) => {
                this.detailuser = response.data
            })
        },
        getAuthUser() {
            axios.get('/api/userAuth', {headers: getHeader()})
                .then(response => {                 
                    this.userAuth = response.data.data
                })
        },
        handleDelete() {
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
            this.$router.push({
                name: 'EditUser',
                params: {id: this.id}
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
    },
    created() {
        const userObj = JSON.parse(window.localStorage.getItem('authUser'))                 
        this.$store.dispatch('setUserObject', userObj)
    }
}
</script>

<style>

</style>