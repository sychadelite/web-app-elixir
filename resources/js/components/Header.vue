<template>
  <div v-if="userStore.authUser !== null && userStore.authUser.access_token">
    <b-navbar toggleable="lg" type="dark" variant="faded">
      <b-navbar-brand href="#" class="brand-text" style="color: rgb(58, 207, 182); padding: 1rem; font-size: 20px; margin-right: 2rem">
        <img src="/icons/elixir.png" width="30" height="30" class="d-inline-block align-top mr-3" alt="">
        Elixir Web App
      </b-navbar-brand>

      <b-navbar-toggle target="nav-collapse">
        <template #default="{ expanded }">
          <b-icon v-if="expanded" icon="chevron-bar-up"></b-icon>
          <b-icon v-else icon="chevron-bar-down"></b-icon>
        </template>
      </b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav class="topnav">
          <router-link class="nav-item nav-link nav-link-navbar" style="text-decoration: none; margin-right: 2rem;" to="/home">Home</router-link>
          <router-link class="nav-item nav-link nav-link-navbar" style="text-decoration: none; margin-right: 2rem;" v-bind:to="{name: 'About'}">About</router-link>
          
          <b-nav-item-dropdown text="PDAM" right style="margin-right: 2rem;">
            <b-dropdown-item href="#" class="m-1" :to="{name: 'Pdam'}"><img src="/icons/2x/home-work.svg" alt="pusat" class="mr-2"><strong>Pusat</strong></b-dropdown-item>
            <b-dropdown-item href="#" class="m-1" :to="{name: 'Sambungan'}"><img src="/icons/1x/analytic.png" alt="analytic" class="mr-2"><strong>Bacameter</strong></b-dropdown-item>
            <b-dropdown-item href="#" class="m-1" @click.prevent="lihattagihanByPublic(userStore.authUser.nomor_pelanggan)"><img src="/icons/1x/payment.png" alt="payment" class="mr-2"><strong>Tagihan</strong></b-dropdown-item>
            <b-dropdown-item href="#" class="m-1" :to="{name: 'News'}"><img src="/icons/1x/newspaper.png" alt="news" class="mr-2"><strong>News</strong></b-dropdown-item>
            <b-dropdown-item href="#" class="m-1" @click.prevent="lihatreportByPublic(userStore.authUser.nomor_pelanggan)"><img src="/icons/2x/report_gmailerrorred_black_48dp.svg" alt="report" class="mr-2" width="24" height="24"><strong>Report</strong></b-dropdown-item>
          </b-nav-item-dropdown>

          <router-link class="nav-item nav-link nav-link-navbar" style="text-decoration: none;" v-bind:to="{name: 'Membership'}">Membership</router-link>
          <b-nav-item disabled></b-nav-item>
        </b-navbar-nav>

        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto topnav">
          <!-- <b-nav-form>
            <b-form-input size="sm" class="mr-sm-2" placeholder="Search"></b-form-input>
            <b-button size="sm" class="my-2 my-sm-0" type="submit">Search</b-button>
          </b-nav-form> -->

          <!-- <b-nav-item-dropdown text="Lang" right>
            <b-dropdown-item href="#" class="m-1">EN</b-dropdown-item>
            <b-dropdown-item href="#" class="m-1">ES</b-dropdown-item>
            <b-dropdown-item href="#" class="m-1">RU</b-dropdown-item>
            <b-dropdown-item href="#" class="m-1">FA</b-dropdown-item>
            <b-dropdown-item href="#" class="m-1">ID</b-dropdown-item>
          </b-nav-item-dropdown> -->

          <b-nav-item-dropdown right>
            <!-- Using 'button-content' slot -->
            <template #button-content>
              <img id="dp" class="rounded-circle center-cropped mr-2" alt="" width="24  " height="24" v-if="userStore.authUser.photo" :src="'/images/' + userStore.authUser.photo">
              <img id="dp" class="rounded-circle center-cropped mr-2" alt="" width="24  " height="24" v-else src="/images/yoda.png">
              <em>{{ userStore.authUser.username }}</em>
            </template>
            <b-dropdown-item href="#" class="m-1" @click.prevent="lihatuserByPublic(userStore.authUser.nomor_pelanggan)"><img src="/icons/1x/outline_account_circle_black_24dp.png" alt="profile" class="mr-2"> <strong>Profile</strong></b-dropdown-item>
            
            <div v-if="userStore.authUser.role == 'admin'">
              <b-dropdown-item href="#" class="m-1" :to="{name: 'Admin'}"><img src="/icons/1x/admin_panel.png" alt="admin" class="mr-2"> <strong>Admin</strong></b-dropdown-item>
            </div>

            <b-dropdown-item href="#" class="m-1" @click.prevent="handleLogout()"><img src="/icons/1x/logout-black-1x.png" alt="sign out" class="mr-2"> <strong>Sign Out</strong></b-dropdown-item>
          </b-nav-item-dropdown>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div>

  <!-- <nav class="navbar navbar-expand-lg navbar-light" v-if="userStore.authUser !== null && userStore.authUser.access_token">
    <div class="container-fluid">
      <a class="navbar-brand" href="#" style="color: rgb(58, 207, 182); padding: 1rem; font-size: 20px"><img src="/icons/elixir.png" width="30" height="30" class="d-inline-block align-top mr-3" alt="">Elixir Web App</a>        
      <button class="navbar-toggler bg-light" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse py-2" id="navbarSupportedContent">
        <div class="navbar-nav">
            <router-link class="nav-item nav-link ml-3" style="text-decoration: none; color: #fff; padding-left: 1.2rem; padding-right: 1.2rem;" to="/home">Home</router-link>
            <router-link class="nav-item nav-link ml-3" style="text-decoration: none; color: #fff; padding-left: 1.2rem; padding-right: 1.2rem;" v-bind:to="{name: 'About'}">About</router-link>
            <router-link class="nav-item nav-link ml-3" style="text-decoration: none; color: #fff; padding-left: 1.2rem; padding-right: 1.2rem;" :to="{name: 'User'}">User</router-link>
            <router-link class="nav-item nav-link ml-3" style="text-decoration: none; color: #fff; padding-left: 1.2rem; padding-right: 1.2rem;" :to="{name: 'Sambungan'}">Sambungan</router-link>
            <router-link class="nav-item nav-link ml-3" style="text-decoration: none; color: #fff; padding-left: 1.2rem; padding-right: 1.2rem;" :to="{name: 'Pdam'}">PDAM</router-link>
            <router-link class="nav-item nav-link ml-3" style="text-decoration: none; color: #fff; padding-left: 1.2rem; padding-right: 1.2rem;" :to="{name: 'Login'}">Login</router-link>
            <a href="" class="nav-item nav-link ml-3" style="text-decoration: none; color: #fff; padding-left: 1.2rem; padding-right: 1.2rem;" @click.prevent="handleLogout()">Logout</a>
        </div>
      </div>
      <form class="d-flex">
      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
    </div>  
  </nav> -->
</template>

<script>
import {mapState} from 'vuex'
import {getHeader} from '../config.js'
 
export default {
  name: "Header",
  computed: {
    ...mapState({
        userStore: state => state.userStore
    })
  },
  data() {
    return {

    }
  },
  mounted() {
    
  },
  methods: {
    handleLogout() {
      if(confirm('Apakah ingin keluar?')) {
        axios.post('/api/logout', {headers: getHeader()})
          .then((response) => {
            console.log(response)
        })

        this.$noty.warning('You have successfully logged out')
        this.$router.push({
            name: 'Login'                    
        })
        this.$store.dispatch('clearAuthUser')                     // clear vuex storage
        window.localStorage.removeItem('authUser')                // clear local storage with authUser key
      } else {
          return false
      }
    },
    lihatuserByPublic(id) {                      
        this.$router.push({
          name: 'Profile',
          params: {id}
        })
    },
    lihatreportByPublic(id) {                      
        this.$router.push({
          name: 'ReportUser',
          params: {id}
        })
    },
    lihattagihanByPublic(id) {                      
        this.$router.push({
            name: 'TagihanUser',
            params: {id}
        })
    },
  },
  // created() {
  //   setInterval(()=>{                                             // this function will loop the method within declared secs
  //     this.getAuthUser()
  //   }, 10000);   
  // }
}
</script> 

<style>
.navbar {
  background-color: rgb(24,20,28);
  font-family: 'Roboto', sans-serif;
}
.topnav {
  font-weight: bold;
}
.topnav .active {
    border-bottom: 3px solid rgb(54, 75, 133);
    border-radius: 4px;
}
.nav-link-navbar:hover {
  /* padding: 7px; */
  /* border-radius: 5px; */
  filter: invert(11%) sepia(8%) saturate(900%) hue-rotate(169deg) brightness(98%) contrast(90%);
}
</style>