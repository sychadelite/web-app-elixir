<template>
    <div>
        <section id="section-content">
            <section id="section-title">
                <div class="body-section-title">
                    <h1>Hi, {{ userAuth.username }}</h1>
                    <p>This is your reports page</p>
                </div>
            </section>

            <div class="body-content" v-if="id">
                <div class="sub-title" style="margin-bottom: 4rem;">
                    <h1 class="sub-title-content">PENGADUAN</h1>
                </div>
    
                <div>
                    <b-tabs content-class="mt-4" 
                    active-nav-item-class="font-weight-bold text-uppercase text-warning"
                    active-tab-class="font-weight-bold text-white"
                    fill>

                        <b-tab active>
                            <template #title>
                                <b-spinner class="mr-2" type="grow" small></b-spinner> <strong>RIWAYAT</strong>
                            </template>
                            <div style=" margin-top: 4rem;">
                                
                                <b-row>
                                    <div v-for="row in authReport" :key="row.id_report" style="margin: auto;">


                                            <b-card 
                                            :title="'Report, ' + row.id_report" 
                                            bg-variant="dark"
                                            style="width: 20rem; height: 20rem;"
                                            footer-tag="footer"
                                            class="mb-4 mr-4">

                                                <b-card-text>
                                                    <div>
                                                        <div v-if="row.status_report == 'accepted'">
                                                            <h6>
                                                                <h5><b-badge variant="primary">Pengaduan Diajukan</b-badge></h5>
                                                            </h6>
                                                        </div>
                                                        
                                                        <div v-else-if="row.status_report == 'working'">
                                                            <h6>
                                                                <h5><b-badge variant="warning">Pengaduan Dikerjakan</b-badge></h5>
                                                            </h6>
                                                        </div>

                                                        <div v-else-if="row.status_report == 'fixed'">
                                                            <h6>
                                                                <h5><b-badge variant="success">Pengaduan Selesai</b-badge></h5>
                                                            </h6>   
                                                        </div>
                                                    </div>

                                                    <div style="margin-top: 2rem;">
                                                        <p>{{ row.keluhan | truncate(72, ' ...')}}</p>
                                                    </div>

                                                </b-card-text>

                                                <a href="#" class="card-link">Show Details</a>

                                                <template #footer>
                                                    <div class="mt-4">
                                                        <div style="text-align: end; margin-bottom: -25px;">
                                                            <small>{{ row.created_at }}</small>
                                                        </div>
                                                        
                                                        <a @click.prevent="">
                                                            <b-button variant="outline-light" size="sm">
                                                                <b-icon icon="eye" class="mr-2"></b-icon>
                                                                View
                                                            </b-button>
                                                        </a>
                                                        <a @click.prevent="handleDeleteReport(row.id_report)">
                                                            <b-button variant="outline-danger" size="sm">
                                                                <b-icon icon="trash" class="mr-2"></b-icon>
                                                                Delete
                                                            </b-button>
                                                        </a>
                                                       
                                                    </div>
                                                </template>

                                            </b-card>

                                    </div>
                                </b-row>
                                
                            </div>                            
                        </b-tab>

                        <b-tab title="BUAT PENGADUAN">
                            <div style="margin-top: 4rem;">
                                <b-form @submit.prevent="handleSubmit">
                                    <div style="margin: auto;">
                                        <b-form-group
                                        id="fieldset-1"
                                        description="Informasikan kepada kami keluhan anda"
                                        label="Tulis pengaduan anda"
                                        label-for="textarea-state"
                                        valid-feedback="Thank you!"
                                        :invalid-feedback="invalidFeedback"
                                        :state="state"
                                        >
                                            <b-form-textarea
                                            id="textarea-state"
                                            v-model="form.keluhan"
                                            :state="state"
                                            placeholder="Contoh: Pipa rumah saya mengalami kebocoran sejak jam 2 siang ini, tolong segera diperbaiki..."
                                            rows="4"
                                            style="font-family: 'Roboto', sans-serif;"
                                            ></b-form-textarea>

                                            <!-- <div v-if="errors.keluhan">
                                                <small class="text-danger" style="font-weight: bold;">{{errors.keluhan[0]}}</small>
                                            </div> -->

                                        </b-form-group>
                                    </div>

                                    <b-overlay
                                    :show="busy"
                                    rounded
                                    opacity="0.6"
                                    spinner-small
                                    spinner-variant="dark"
                                    class="d-inline-block"
                                    @hidden="onHidden"
                                    >
                                        <b-button 
                                        type="submit" 
                                        ref="button"
                                        :disabled="busy" 
                                        variant="warning"
                                        >
                                        Kirim Pengaduan
                                        </b-button> 
                                    </b-overlay>
                                </b-form>
                            </div>
                        </b-tab>

                    </b-tabs>
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
            authReport: null,
            form: {
                keluhan: ''
            },
            errors: {},
            busy: false,
            timeout: null
        }
    },
    beforeDestroy() {
        this.clearTimeout()
    },
    mounted() {
        this.getAuthUser(),
        this.getAuthReports(),
        this.scrollToTop()
    },
    methods: {
        getAuthUser() {
            axios.get('/api/userAuth', {headers: getHeader()})
                .then(response => {                 
                    this.userAuth = response.data.data
                })
        },
        getAuthReports() {
            axios.get('/api/report/user', {headers: getHeader()})
                .then(response => {                
                    this.authReport = response.data.data
                })
        },
        handleSubmit() {
            this.onClick()
            axios.post('/api/report/create', this.form, {headers: getHeader()}).then((response) => {
                if(response.data.status) {
                    this.$noty.success(response.data.message)
                    this.form.keluhan = ""

                    this.getAuthReports()
                }       
            }).catch((error) => {
                if(error.response.status == 403) {
                    this.errors = error.response.data.message
                    this.$noty.error(error.response.data.message.keluhan[0])
                }             
            })
        },
        handleDeleteReport(id_report) {                                                                                                                                                                // axios."delete" is used to delete specific id <props>
            if(confirm('Apakah anda ingin menghapus report ini?')) {
                axios.delete('/api/report/delete/' + id_report, {headers: getHeader()}).then((response) => {
                    if(response.data.status) {                        
                        this.getAuthReports()
                        this.$noty.error(response.data.message)
                    }
                })
            } else {
                return false
            }
        },
        scrollToTop() {
            window.scrollTo(0,0);
        },
        clearTimeout() {
            if (this.timeout) {
            clearTimeout(this.timeout)
            this.timeout = null
            }
        },
        setTimeout(callback) {
            this.clearTimeout()
            this.timeout = setTimeout(() => {
            this.clearTimeout()
            callback()
            }, 5000)
        },
        onHidden() {
            // Return focus to the button once hidden
            this.$refs.button.focus()
        },
        onClick() {
            this.busy = true
            // Simulate an async request
            this.setTimeout(() => {
            this.busy = false
            })
        }
    },
    computed: {
        state() {
            return this.form.keluhan.length >= 4 && this.form.keluhan.length <= 200
        },
        invalidFeedback() {
            if (this.form.keluhan.length <= 4) {
                return 'Enter at least 4 characters.'
            } else if (this.form.keluhan.length > 200) {
                return 'You have reached the limit of 200 characters.'
            }
            return 'Please enter something.'
        }
    },
    created() {
        const userObj = JSON.parse(window.localStorage.getItem('authUser'))                 
        this.$store.dispatch('setUserObject', userObj)
    }

}
</script>


<style>

</style>