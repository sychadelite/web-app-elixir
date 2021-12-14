<template>
    <div>
        <section id="section-title">
            <div class="body-section-title" v-if="userAuth">
                <h1><b-icon icon="hourglass-split" class="mr-4 mb-2"></b-icon>Request Membership</h1>
                <div>
                    <b-badge class="mb-2" variant="info">Account: {{ userAuth.username }}</b-badge>
                </div>
            </div>
        </section>

        <div class="body-content" v-if="userAuth">
            <b-form class="home-container" @submit.prevent="handleSubmit" style="margin-top: 3rem;">

                <div>
                    <b-card bg-variant="light" text-variant="dark">
                        <b-form-group
                        label-cols-lg="3"
                        label="Membership Form"
                        label-size="lg"
                        label-class="font-weight-bold pt-0"
                        class="mb-0"
                        >
                            <b-form-group
                                label="Street:"
                                label-for="nested-street"
                                label-cols-sm="3"
                                label-align-sm="right"
                            >
                                <b-form-input id="nested-street"></b-form-input>
                            </b-form-group>

                            <b-form-group
                                label="City:"
                                label-for="nested-city"
                                label-cols-sm="3"
                                label-align-sm="right"
                            >
                                <b-form-input id="nested-city"></b-form-input>
                            </b-form-group>

                            <b-form-group
                                label="State:"
                                label-for="nested-state"
                                label-cols-sm="3"
                                label-align-sm="right"
                            >
                                <b-form-input id="nested-state"></b-form-input>
                            </b-form-group>

                            <b-form-group
                                label="Country:"
                                label-for="nested-country"
                                label-cols-sm="3"
                                label-align-sm="right"
                            >
                                <b-form-input id="nested-country"></b-form-input>
                            </b-form-group>

                            <b-form-group 
                            id="input-group-3" 
                            label="Subdivision:" 
                            label-for="input-3" 
                            label-cols-sm="3" 
                            label-align-sm="right">

                                <b-form-select v-model="form.id_cabang">                   
                                    <option v-for="row in cabangPdamAndPusat" 
                                        :key="row.id_cabang"
                                        :value="row.id_cabang"
                                    >
                                        {{ row.nama_cabang }}
                                    </option>
                                </b-form-select>
                            </b-form-group>

                            <b-form-group
                                label="Controller:"
                                label-cols-sm="3"
                                label-align-sm="right"
                                class="mb-0"
                                v-slot="{ ariaDescribedby }"
                            >
                                <b-form-radio-group
                                class="pt-2"
                                v-model="form.nama_alat"
                                :options="pilihanController"
                                :aria-describedby="ariaDescribedby"
                                ></b-form-radio-group>
                            </b-form-group>
                        </b-form-group>
                    </b-card>
                </div>

                <div class="text-center mt-4 mb-2">
                    <b-overlay
                    :show="busy"
                    squared
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
                        style="font-weight: bold;"
                        squared
                        >
                        REQUEST MEMBERSHIP
                        </b-button> 
                    </b-overlay> 
                </div>
            </b-form>

            <!-- <div>
                <h3 style="margin-top: 2rem;">Domisili Kota Jakarta</h3>
                <div v-for="row in cabangPdamAndPusat" :key="row.id_cabang">
                <div v-if="row.kota_pusat == 'Kota Jakarta'">
                    <h5>{{ row.nama_pusat }}</h5>
                    <p>{{ row.nama_cabang }}</p>
                    </div>
                </div>
            </div>

            <div>
                <h3 style="margin-top: 2rem;">Domisili Kota Sukabumi</h3>
                <div v-for="row in cabangPdamAndPusat" :key="row.id_cabang">
                <div v-if="row.kota_pusat == 'Kota Sukabumi'">
                    <h5>{{ row.nama_pusat }}</h5>
                    <p>{{ row.nama_cabang }}</p>
                    </div>
                </div>
            </div>

            <div>
                <h3 style="margin-top: 2rem;">Domisili Kota Semarang</h3>
                <div v-for="row in cabangPdamAndPusat" :key="row.id_cabang">
                <div v-if="row.kota_pusat == 'Kota Semarang'">
                        <h5>{{ row.nama_pusat }}</h5>
                        <p>{{ row.nama_cabang }}</p>
                    </div>
                </div>
            </div>     -->

        </div>
    </div>
</template>

<script>
import {getHeader} from '../../config.js'

export default {
    props: ['classify'],  
    data() {
        return {
            userAuth: {},
            cabangPdamAndPusat: [{}],
            form: {
                id_cabang: '',
                jenis_member: this.classify,
                nama_alat: ''
            },
            pilihanController: [
                {text: 'LoRa', value: 'LoRa'}, 
                {text: 'IoT Raspberry Pi 4', value: 'IoT Raspberry Pi 4'}, 
                {text: 'IoT ESP8266', value: 'IoT ESP8266'}
            ],
            busy: false,
            timeout: null
        }
    },
    mounted() {
        this.getAuthUser(),
        this.getCabangPdamAndPusat(),
        this.scrollToTop()
    },
    methods: {
        getAuthUser() {
            axios.get('/api/userAuth', {headers: getHeader()})
            .then(response => {               
                this.userAuth = response.data.data
            })
        },
        getCabangPdamAndPusat() {
            axios.get('/api/pdam/cabangpdamandpusat')
            .then(response => {               
                this.cabangPdamAndPusat = response.data.data
            })
        },
        handleSubmit() {
            this.onClick()
            console.log(this.form)
            axios.post('/api/membership/storeRequest', this.form, {headers: getHeader()}).then((response) => {
                if(response.data.status) {
                    this.$noty.success(response.data.message)
                    this.$router.push({
                        name: 'Membership'                    
                    })    
                }  
            }).catch((error) => {
                if(error.response.status == 403) {
                    this.errors = error.response.data.message
                }             
            })
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
            this.$refs.button.focus()
        },
        onClick() {
            this.busy = true
            this.setTimeout(() => {
            this.busy = false
            })
        },
        scrollToTop() {
            window.scrollTo(0,0);
        }
    },
    beforeDestroy() {
        this.clearTimeout()
    },
    created() {
        const userObj = JSON.parse(window.localStorage.getItem('authUser'))                 
        this.$store.dispatch('setUserObject', userObj)
    }
}
</script>