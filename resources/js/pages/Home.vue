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

                <div class="circle-container" style="background-color: none;">
                    <div class="circle"><h1>63%</h1></div>
                </div>

                <div class="row g-0">
                    <div class="col-sm-6 col-md-8" style="background-color: none;">
                        <h3>Authenticated User</h3>
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

                    <div class="col-6 col-md-4" style="background-color: none;">
                        <h3>This Column</h3>
                        <b-col md="6" class="mb-3">
                            <p>Cylon animation:</p>
                            <b-icon icon="three-dots" animation="cylon" font-scale="4"></b-icon>
                        </b-col>
                        <div>
                            <b-form  @submit.stop.prevent>
                            <label for="feedback-user">User ID</label>
                            <b-form-input v-model="userId" :state="validation" id="feedback-user"></b-form-input>
                            <b-form-invalid-feedback :state="validation">
                                Your user ID must be 5-12 characters long.
                            </b-form-invalid-feedback>
                            <b-form-valid-feedback :state="validation">
                                Looks Good.
                            </b-form-valid-feedback>
                            </b-form>
                        </div>
                        <div id="watch-example">
                            <p class="mb-2 mt-2">Search User</p>
                            <input v-model="question" id="bd-search-input" type="search" placeholder="Search..." autocomplete="off" aria-label="Search docs" class="form-control ds-input" spellcheck="false" role="combobox" aria-autocomplete="list" aria-expanded="false" aria-owns="algolia-autocomplete-listbox-0" dir="auto" style="position: relative; vertical-align: top;">

                            <b-list-group style="height: 12rem; overflow: auto;">
                                <b-list-group-item href="#" variant="info" v-for="user in answer" :key="user.nomor_pelanggan">
                                    <a href="" @click.prevent="lihatuserByAdmin(user.nomor_pelanggan)">{{ user.name }} </a>
                                </b-list-group-item>
                            </b-list-group>
                        </div>
                        
                    </div>
                </div>
                
                <div>
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

                <v-dialog style="color: #333;"/>
            </div>
        </section>
        
    </div>
</template>

<script>
import {mapState} from 'vuex'                               // mapState must be imported to use vuex for user auth access_token local storage
import {getHeader} from '../config.js'                      // getHeader is a dynamic header constanta which already built on config.js file for calls access_token user that logged in to able using protected api routes api:sanctum

export default {
    data() {
        return {
            userAuth: {},
            sambunganAuth: {},
            userId: '',
            question: '',
            answer: null
        }
    },
    watch: {
        // whenever question changes, this function will run
        question: function (newQuestion, oldQuestion) {
        this.answer = 'Waiting for you to stop typing...'
        this.debouncedGetAnswer()
        }
    },
    mounted() {
        this.getUser(),
        this.getSambungan()
    },
    methods:{
        getAnswer() {
        // if (this.question.indexOf('?') === -1) {
        //     this.answer = 'Questions usually contain a question mark. ;-)'
        //     return
        // }
        this.answer = 'Thinking...'
        var vm = this
        axios.get('/api/users/search/' + this.question)
            .then(function (response) {
            vm.answer = response.data.data
            })
            .catch(function (error) {
            vm.answer = 'Error! Could not reach the API. ' + error
            })
        },
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
                    console.log('Authenticated User Object', response)                  
                    this.userAuth = response.data.data
                })
        },
        getSambungan() {
            axios.get('/api/sambunganAuth', {headers: getHeader()})
            .then(response => {
                console.log('Authenticated Sambungan Object', response)                  
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
        validation() {
            return this.userId.length > 4 && this.userId.length < 13
        }
    },
    created() {
        console.log('I was Created')
        const userObj = JSON.parse(window.localStorage.getItem('authUser'))                 
        this.$store.dispatch('setUserObject', userObj)                                      // trigger the state and get the authUser item

        this.debouncedGetAnswer = _.debounce(this.getAnswer, 500)
    }
}
</script>

<style>
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
    height: 90vh;
    width: 100%;
    display: flex;
    justify-content: center;
    flex-direction: column;
    align-items: center;
    background-color: rgb(16,12,20);
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