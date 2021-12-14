<template>
    <div>
        <section id="section-content">
            <div class="body-content">
                <h1>Forget Password</h1>
                <form class="col-sm-6 mt-4" @submit.prevent="handleResetPassword">
                    <div class="mb-3">
                        <label for="exampleInputEmail" class="form-label">Email </label>
                        <input type="email" placeholder="ex: your-registered@gmail.com" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" v-model="form.email">
                        <div id="emailHelp" class="form-text text-info">This is your registered email, please check the mail we sent after you hit the request button.</div>
                    </div>
                    <div class="error alert alert-danger" role="alert" v-if="errors.email">
                        {{errors.email[0]}}
                    </div>

                    <button class="btn btn-primary mt-2" type="submit">Request</button>
                </form>
                
                <p class="mt-4">Changes Mind ? <router-link :to="{name: 'Login'}"><strong>Login Now</strong></router-link></p>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    data() {
        return {
            form: {
                email: ''
            },
            errors: {}
        }
    },
    methods: {
        handleResetPassword() {
            console.log(this.form)
            axios.post('/api/forget', this.form).then((response) => {
                if(response.data.status) {
                    this.$noty.info(response.data.message)  
                }
            }).catch((error) => {
                if(error.response.status == 403) {
                    this.errors = error.response.data.message
                } 
                else if (error.response.status == 404) {
                    this.errors = error.response.data.message
                    this.$noty.error(error.response.data.message)
                }           
            })            
        }
    },
}
</script>


<style>
</style>