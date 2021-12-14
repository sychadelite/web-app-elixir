<template>
    <div>
        <!-- <pre>{{ userStore }}</pre> -->                                             <!-- show data in userStore-->
        <section id="section-title">
            <div class="morphing" id="morph">  
                <div class="word">Welcome</div>
                <div class="word">To</div>
                <div class="word">Elixir</div>
                <div class="word">Web Apps</div>
            </div>
        </section>

        <section id="section-content">
            <div class="body-content">

                <!-- <div class="circle-container" style="background-color: none;">
                    <div class="circle"><h1>63%</h1></div>
                </div> -->

                <div class="relative-container">
                    <b-container class="bv-first-row" style="position: relative; top: -80px;">
                        <b-row>
                            <b-col cols="12" md="12">
                                <b-jumbotron bg-variant="dark" text-variant="white" border-variant="dark" header-level="4">
                                    <b-container class="bv-card-intro-row">
                                    <b-row class="card-intro-row">
                                        <b-col class="card-intro-col">
                                            <div class="card-intro">
                                                <div class="card-intro-content">
                                                    <h1>95%</h1>
                                                    <small>Data transmission accuracy</small>
                                                </div>
                                            </div>
                                        </b-col>
                                        
                                        <b-col class="card-intro-col">
                                            <div class="card-intro">
                                                <div class="card-intro-content">
                                                    <h1>1,500+</h1>
                                                    <small>Solved members problem</small>
                                                </div>
                                            </div>
                                        </b-col>

                                        <b-col class="card-intro-col">
                                            <div class="card-intro">
                                                <div class="card-intro-content">
                                                    <h1>3000+</h1>
                                                    <small>Active members</small>
                                                </div>
                                            </div>
                                        </b-col>

                                        <b-col class="card-intro-col">
                                            <div class="card-intro">
                                                <div class="card-intro-content">
                                                    <h1>50</h1>
                                                    <small>Integrated clusters</small>
                                                </div>
                                            </div>
                                        </b-col> 
                                    </b-row>
                                    </b-container>
                                </b-jumbotron> 
                            </b-col>                  
                        </b-row>
                    </b-container>
                </div>

                <div class="relative-container">
                    <div class="sub-title">
                        <h1 class="sub-title-content"><span>Dashboard</span> Page</h1>
                    </div>

                    <b-container class="bv-dashboard-row mb-4">
                        <b-row>
                            <b-col cols="12" md="6">
                                <div class="home-container">
                                    <h3 class="mb-4" style="text-align: center;">Authenticated User</h3>
                                    <div>
                                        <p>Name: <strong>{{ userAuth.name }}</strong></p>
                                        <p>No. Pelanggan: <strong>{{ userAuth.nomor_pelanggan }}</strong></p>
                                        <p>Email: <strong>{{ userAuth.email }}</strong></p>
                                    </div>
                                    <div>
                                        <p v-if="sambunganAuth">No. Sambungan: <strong>{{ sambunganAuth.nomor_sambungan }}</strong></p>
                                        <p v-else>No. Sambungan: <strong>User has not patronized yet</strong></p>
                                    </div>
                                    <!-- <p>No. Pelanggan: <strong>{{ userStore.authUser.nomor_pelanggan }}</strong></p> -->
                                    <!-- <button class="btn btn-danger" @click.prevent="handleLogout">Logout</button> -->
                                </div>
                            </b-col>

                            <b-col cols="12" md="6">
                                <div class="home-container">
                                    <div class="calendar">
                                        <h3 class="mb-4" style="text-align: center;">Calendar</h3>
                                        <Calendar/>
                                    </div>
                                </div>
                            </b-col>
                        </b-row>
                    </b-container>
                </div>

 

                <div class="relative-container space-between-container">
                    <b-container class="bv-example-row">
                    <!-- Stack the columns on mobile by making one full-width and the other half-width -->
                        <b-row>
                            <b-col cols="12" md="6">
                                <img src="/icons/vector/digital-phone.png" class="" width="100%" height="" alt="sdigital-phone">
                            </b-col>
                            <b-col cols="12" md="6">
                                <div class="">
                                    <h1 class="sub-title-content" style="margin-bottom: 2rem; margin-top: 2rem;"><span>Smart Water </span>Platform to make it <span>Easier</span> for users</h1>
                                </div>
                                <div>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore ratione, repellat praesentium consequuntur iste eveniet nulla, at, 
                                        eius veritatis reiciendis labore doloribus. Consequatur accusamus cum dignissimos mollitia, tenetur amet nulla.</p>
                                    <small style="color: rgb(109, 163, 146);">Lorem ipsum dolor sit amet consectetur adipisicing elit.</small>
                                </div>

                                <b-button squared variant="outline-secondary" style="margin-bottom: 2rem; margin-top: 8rem;" size="lg">Check for details</b-button>
                            </b-col>
                        </b-row>
                    </b-container>                    
                </div> 

                <div class="relative-container space-between-container">
                    <b-container class="bv-example-row">
                    <!-- Stack the columns on mobile by making one full-width and the other half-width -->
                        <b-row>
                            <b-col cols="12" md="6">
                                <div class="">
                                    <h1 class="sub-title-content" style="margin-bottom: 2rem; margin-top: 2rem;">It is <span>believed</span> by many people</h1>
                                </div>
                                <div>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore ratione, repellat praesentium consequuntur iste eveniet nulla, at, 
                                        eius veritatis reiciendis labore doloribus. Consequatur accusamus cum dignissimos mollitia, tenetur amet nulla.</p>
                                    <small style="color: rgb(109, 163, 146);">Lorem ipsum dolor sit amet consectetur adipisicing elit.</small>
                                </div>

                                <b-button squared variant="outline-secondary" style="margin-bottom: 2rem; margin-top: 8rem;" size="lg">Check for details</b-button>
                            </b-col>
                            <b-col cols="12" md="6">
                                <img src="/icons/vector/software-integration.png" class="" width="100%" height="" alt="software-integration">
                            </b-col>
                        </b-row>
                    </b-container>                    
                </div> 




                <div class="relative-container space-between-container">
                    <div class="sub-title">
                        <h1 class="sub-title-content">Our Best <span>Services</span></h1>
                    </div>

                    <b-container class="bv-row">
                        <div class="home-container" style="text-align: center;">
                            <b-row>
                                <b-col>
                                    <div class="row-content mt-4">
                                        <img src="/icons/vector/green-stand-analysis.png" alt="green-stand-analysis" height="100" width="100">
                                        <h5 class="mt-4 mb-2">PDAM News</h5>
                                    </div>
                                </b-col>
                                <b-col>
                                    <div class="row-content mt-4">
                                        <img src="/icons/vector/green-analysis.png" alt="green-analysis" height="100" width="100">
                                        <h5 class="mt-4 mb-2">Water Monitoring</h5>
                                    </div>
                                </b-col>
                                <b-col>
                                    <div class="row-content mt-4">
                                        <img src="/icons/vector/green-audit-concept.png" alt="green-audit-concept" height="100" width="100">
                                        <h5 class="mt-4 mb-2">Payment Gateway</h5>
                                    </div>
                                </b-col>
                                <b-col>
                                    <div class="row-content mt-4">
                                        <img src="/icons/vector/data-invoice.png" alt="data-invoice" height="100" width="100">
                                        <h5 class="mt-4 mb-2">Customer Report</h5>
                                    </div>
                                </b-col>
                            </b-row>
                        </div>
                    </b-container>
                </div>

                <div class="relative-container space-between-container">
                    <div class="sub-title">
                        <h1 class="sub-title-content">List of <span>Partnership</span></h1>
                    </div>

                    <b-container class="bv-row">
                        <div class="home-container" style="text-align: center;">
                            <b-row>
                                <b-col>
                                    <div class="row-content mt-4">
                                        <img src="/icons/vendor/technofy.png" alt="technofy" height="100px" width="100px">
                                        <h5 class="mt-4">Technofy.corp</h5>
                                        <div class="row-inner-content">
                                            <small>Technofy corporation is a new startup that have a lot of achievement in tech industries.
                                            It is one of the most popular unicorn in Indonesia.</small>
                                        </div>
                                    </div>
                                </b-col>
                                <b-col>
                                    <div class="row-content mt-4">
                                        <img src="/icons/vendor/pdam-tb.png" alt="pdam" height="100px" width="100px">
                                        <h5 class="mt-4">PDAM TIRTA BENTENG</h5>
                                        <div class="row-inner-content">
                                            <small>PDAM Tirta Benteng Kota Tangerang merupakan user dalam pengelolaan air minum di Kota Tangerang</small>
                                        </div>
                                    </div>
                                </b-col>
                                <b-col>
                                    <div class="row-content mt-4">
                                        <img src="/icons/vendor/laravel.svg" alt="laravel" height="100px" width="100px">
                                        <h5 class="mt-4">Laravel.corp</h5>
                                        <div class="row-inner-content">
                                            <small>Laravel is a web application framework with expressive, elegant syntax.</small>
                                        </div>
                                    </div>
                                </b-col>
                                <b-col>
                                    <div class="row-content mt-4">
                                        <img src="/icons/vendor/aws.jpg" alt="amazon" height="100px" width="100px">
                                        <h5 class="mt-4">Amazon Web Services.inc</h5>
                                        <div class="row-inner-content">
                                            <small>AWS is a subsidiary of Amazon providing on-demand cloud computing platforms 
                                            and APIs to individuals, companies, and governments.</small>
                                        </div>
                                    </div>
                                </b-col>
                            </b-row>
                        </div>
                    </b-container>
                </div>

                

                <!-- <div>
                    <button class="btn btn-warning m-2" content="Hi!" v-tippy>My Button!</button>
                    <button class="btn btn-warning m-2" :content="userAuth.nomor_pelanggan" v-tippy>My Button!</button>
                    <button class="btn btn-warning m-2" content="Hello" v-tippy="{ placement : 'right',  arrow: true }">
                    My Button!
                    </button>
                </div>

                <button class="btn btn-info m-2" @click.prevent="showModal()">Modal</button>
                <button class="btn btn-info m-2" @click.prevent="showDialog()">Dialog</button>

                <modal name="my-first-modal" style="color: #333;" width="60%" height="50%" :adaptive="true">
                    <div class="window-header" style="padding: 2rem;">DRAG ME HERE</div>
                    <div slot="top-right">
                        <button class="btn btn-danger" @click.prevent="hideModal()">
                            ❌
                        </button>
                    </div>
                    <div>
                        <p style="padding: 2rem;">Hello, 🌎!</p>
                    </div>                            
                </modal>

                <v-dialog style="color: #333;"/> -->

            </div>
        </section>
        
    </div>
</template>

<script>
import {mapState} from 'vuex'                               // mapState must be imported to use vuex for user auth access_token local storage
import {getHeader} from '../config.js'                      // getHeader is a dynamic header constanta which already built on config.js file for calls access_token user that logged in to able using protected api routes api:sanctum
import Calendar from '../calendar/calendar.vue'

export default {
    components: {
        Calendar
    },
    data() {
        return {
            userAuth: {},
            sambunganAuth: {}
        }
    },
    
    mounted() {
        this.getUser(),
        this.getSambungan()
    },
    methods:{        
            // getUser() {
            //     axios.get('/api/userAuth', {
            //         headers: {
            //             "Content-Type": "application/json",
            //             Authorization: "Bearer " + "60|S2sLcHoAaePIMlLyNjTnOKdzpMVA8x8qtrd4wRHj"
            //         }
            //     })            
            //     .then((response) => {                                                                                                                     // axios."get" here is depend on what method in api routing, + this.<your-props>
            //         console.log(response)
            //         this.userAuth = response.data.data
            //     })
            // },
        getUser() {
            axios.get('/api/userAuth', {headers: getHeader()})                              // getHeader() is a function that manually created on js/config.js to create dynamic header for accessing auth:sanctum api
                .then(response => {                 
                    this.userAuth = response.data.data
                })
        },
        getSambungan() {
            axios.get('/api/sambunganAuth', {headers: getHeader()})
            .then(response => {               
                this.sambunganAuth = response.data.data
            })
        },
        lihatuserByAdmin(id) {                      
            this.$router.push({                                                                             // second alternative method
                name: 'Profile',
                params: {id}                                                                                // params: {your-props-name: your-function-paramater}, the alternative if "your-function-paramater" is same as "your-props-name" you can concate them to {id}
            })
        },
        showDialog () {
            this.$modal.show('dialog', {
            title: 'The standard Lorem Ipsum passage',
            text: 'Lorem ipsum dolor sit amet, ...',
            buttons: [
                {
                title: 'Cancel',
                handler: () => {
                    this.$modal.hide('dialog')
                }
                },
                {
                title: 'Like',
                handler: () => {
                    alert('Like action')
                }
                },
                {
                title: 'Repost',
                handler: () => {
                    alert('Repost action')
                }
                }
            ]
            })
        },
        showModal () {
            this.$modal.show('my-first-modal');
        },
        hideModal () {
            this.$modal.hide('my-first-modal');
        }
    },
    computed: {
        ...mapState({                                                                       // use computed mapState vuex that already imported
            userStore: state => state.userStore
        }),
    },
    created() {
        console.log('I was Created for Session')
        const userObj = JSON.parse(window.localStorage.getItem('authUser'))                 
        this.$store.dispatch('setUserObject', userObj)                                      // trigger the state and get the authUser item
    }
}
</script>

<style>
.relative-container {
    position: relative; 
    top: -100px;
}
.space-between-container {
    margin-top: 6rem;
}
.card-intro-row {
    text-align: center;
    border-color: rgba(204, 204, 204, 0.418);
    border: none;
    border-collapse: collapse;
}
.card-intro-row .card-intro-col {
    border-left: 1px solid #5151536c; 
    border-right: 1px solid #5151536c; 
} 
.card-intro-row .card-intro-col:first-child {
    border-left: none;
} 
.card-intro-row .card-intro-col:last-child {
    border-right: none;
}
.card-intro .card-intro-content h1 {
    color: rgba(54, 156, 122, 0.904)
}
.card-intro .card-intro-content small {
    color: #979797;
}
.sub-title {
    margin-top: 4rem;
    margin-bottom: 2rem;
}
.sub-title .sub-title-content {
    text-align: center;
}
.sub-title-content span {
    color: rgba(54, 156, 122, 0.904);
}
.home-container {
    background-color: #5151536c; 
    border-radius: 5px; 
    margin: 5px;
    padding: 1rem;
}
.row-content:hover {
    cursor: pointer;
    background: rgba(75, 75, 75, 0.185);
}
.row-inner-content {
    color: rgba(173, 226, 206, 0.829);
}
.glass-blur {
    background-color: #ffffff10;
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
}


.circle-container {
    top: -180px;
    position: relative;
}
.circle {
    height: 200px;
    width: 200px;
    border-radius: 50%;
    background: rgb(40,44,52);;
    overflow: hidden;
    border: 5px solid #1a1a1a;
    margin: auto;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
}
.circle::after {
    content: "";
    position: absolute;
    top: 40%;
    width: 200%;
    height: 200%;
    left: -50%;
    background: rgba(81, 166, 235, 0.5);
    box-shadow: 0 0 20px #217da8;
    border-radius: 40%;
    animation: rotate 10s linear forwards infinite;
}

@keyframes rotate {
    to {
        transform: rotate(360deg);
    }
}

.morphing {
    position: relative;
    height: 92vh;
    width: 100%;
    display: flex;
    justify-content: center;
    flex-direction: column;
    align-items: center;
    /* background-color: rgb(24 20 28); */
    /* background-color: rgb(16,12,20); */
    /* background-image: url("/background/forest-04.jpg"); */
    /* background-size: cover; */
    /* filter: drop-shadow(0.35rem 0.35rem 0.4rem rgba(0, 0, 0, 0.5)); */
}
.word {
    max-width: 90%;
    letter-spacing: 5px;
    font-size: 5rem;
    position: absolute;
    text-align: center;
    color: rgb(15, 194, 164);
    font-family: 'Fruktur', sans-serif;
    animation: word 15s infinite ease-in-out;
    text-shadow: 1px 1px 2px black, 0 0 25px rgb(81, 81, 85), 0 0 5px rgb(168, 168, 170);
}
.word:nth-child(1) {
    animation-delay: -15s;
}
.word:nth-child(2) {
    animation-delay: -11s;
}
.word:nth-child(3) {
    animation-delay: -7s;
}
.word:nth-child(4) {
    animation-delay: -3s;
}

@keyframes word {
    0%, 5%, 100% {
        filter: blur(0px);
        opacity: 1;
    }
    20%, 80% {
        filter: blur(35px);
        opacity: 0;
    }
}

.form-control {
    display: block;
    width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

</style>