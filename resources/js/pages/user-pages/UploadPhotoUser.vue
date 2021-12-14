<template>
    <div>
        <section id="section-content">
            <div class="body-content" v-if="id == userAuth.nomor_pelanggan">
                <h1>Upload Photo</h1>
                <div class="col-sm-6 mt-4">

                    <div class="rounded-circle box-photo mb-3">
                        <img id="dp" class="rounded-circle center-cropped" alt="" width="100" height="100" :src="previewImage">
                        <img id="cam" src="/icons/2x/add-camera-white.png" alt="" width="24" height="24">
                    </div>                   
                    <div class="error alert alert-danger" role="alert" v-if="errors.photo">
                        {{errors.photo[0]}}
                    </div>

                    <div class="mb-3" style="width: 100%;">
                        <!-- <input type="file" class="" name="photoUser" @change="uploadPhoto"> -->

                        <b-form-file
                        v-model="photoUser"
                        :state="Boolean(photoUser)"
                        placeholder="Choose a file..."
                        drop-placeholder="Drop file here..."
                        @change="uploadPhoto"
                        ></b-form-file>
                        <!-- <div class="mt-3">Selected file: {{ photoUser ? photoUser.name : '' }}</div> -->
                    </div>

                    <div class="form-footer">
                        <button class="btn btn-outline-primary rounded-pill mr-2" @click.prevent="toProfile()">Back</button>
                        <button class="btn btn-warning rounded-pill" @click="submitFiles">Upload</button>
                    </div>
                </div>
            </div>

            <div class="body-content" v-else-if="userAuth.role == 'admin'">
                <h1>Upload Photo</h1>
                <div class="col-sm-6 mt-4">

                    <div class="rounded-circle box-photo mb-3">
                        <img id="dp" class="rounded-circle center-cropped" alt="" width="100" height="100" :src="previewImage">
                        <img id="cam" src="/icons/2x/add-camera-white.png" alt="" width="24" height="24">
                    </div>                   
                    <div class="error alert alert-danger" role="alert" v-if="errors.photo">
                        {{errors.photo[0]}}
                    </div>

                    <div class="mb-3" style="width: 100%;">
                        <b-form-file
                        v-model="photoUser"
                        :state="Boolean(photoUser)"
                        placeholder="Choose a file..."
                        drop-placeholder="Drop file here..."
                        @change="uploadPhoto"
                        ></b-form-file>
                    </div>

                    <div class="form-footer">
                        <button class="btn btn-outline-primary rounded-pill mr-2" @click.prevent="toMemberProfile()">Back To Member Profile</button>
                        <button class="btn btn-warning rounded-pill" @click="submitFilesByAdmin">Upload This Photo Member</button>
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
import {mapState} from 'vuex'
import {getHeader} from '../../config.js'

export default {
    props: ['id'],
    data() {
        return {
            previewImage: "/images/yoda.png",
            photoUser: null,
            errors: {},
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
        uploadPhoto(e) {                                                                                    // method to preview image before uploaded on database
            let files = e.target.files[0]
            this.previewImage = URL.createObjectURL(files)
            this.photoUser = files
        },
        submitFiles() {
            let formData = new FormData()
            formData.append('photo', this.photoUser)                                // append('<prefix-name-for-uploaded-photo>, this.<instance-of-FormData()>')

            axios.post('/api/users/photo/' + this.id, formData)
                .then(response => {
                    if(response.data.status) {
                        this.$noty.success(response.data.message)                                                   
                        this.$router.push({                                                                         
                            name: 'Profile',
                            params: {id: this.id}                    
                        })  
                    }
                }).catch((error) => {
                if(error.response.status == 403) {                                                              // second method if validate manually
                    this.errors = error.response.data.message
                    this.$noty.error("Forbidden file of type")
                }             
            })
        },
        submitFilesByAdmin() {
            let formData = new FormData()
            formData.append('photo', this.photoUser)

            axios.post('/api/users/photo/' + this.id, formData)
                .then(response => {
                    if(response.data.status) {
                        this.$noty.success(response.data.message)                                                   
                        this.$router.push({                                                                         
                            name: 'MemberProfile',
                            params: {id: this.id}                    
                        })  
                    }
                }).catch((error) => {
                if(error.response.status == 403) {
                    this.errors = error.response.data.message
                    this.$noty.error("Forbidden file of type")
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
        },
    },
    computed: {
        ...mapState({                                                                       // use computed mapState vuex that already imported
            userStore: state => state.userStore
        })
    },
    created() {
        const userObj = JSON.parse(window.localStorage.getItem('authUser'))                 
        this.$store.dispatch('setUserObject', userObj)                                      // trigger the state and get the authUser item
    }
}
</script>