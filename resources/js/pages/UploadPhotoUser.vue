<template>
    <div>
        <section id="section-content">
            <div class="body-content" v-if="id == userAuth.nomor_pelanggan | userAuth.role == 'admin'">
                <h1>Upload Photo</h1>
                <div class="col-sm-6 mt-4">
                    <div class="rounded-circle box-photo mb-3">
                        <img id="dp" class="rounded-circle center-cropped" alt="" width="100" height="100" :src="previewImage">
                        <img id="cam" src="/icons/2x/add-camera-white.png" alt="" width="24" height="24">
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.photo">
                        {{errors.photo[0]}}
                    </div>
                    <div class="mb-3">
                        <input type="file" class="" name="photoUser" @change="uploadPhoto">
                    </div>
                    <button class="btn btn-outline-primary rounded-pill" @click.prevent="toProfile()">Back</button>
                    <button class="btn btn-warning rounded-pill" @click="submitFiles">Upload</button>
                </div>
            </div>
            <div class="body-content" v-else>
                <h1></h1>
            </div>
        </section>
    </div>
</template>

<script>
import {mapState} from 'vuex'
import {getHeader} from '../config.js'

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
        this.getAuthUser()
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
        toProfile() {                      
            this.$router.push({
                name: 'Profile',
            })
        }
    },
    computed: {
        ...mapState({                                                                       // use computed mapState vuex that already imported
            userStore: state => state.userStore
        })
    },
    created() {
        console.log('I was Created')
        const userObj = JSON.parse(window.localStorage.getItem('authUser'))                 
        this.$store.dispatch('setUserObject', userObj)                                      // trigger the state and get the authUser item
    }
}
</script>