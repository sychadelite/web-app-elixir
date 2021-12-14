<template>
    <section id="section-content">
        <section id="section-title">
                <div class="body-section-title">
                    <h1><img src="/icons/2x/lightbulb_white_48dp.svg" alt="light" class="mr-4 mb-3">About</h1>
                </div>
        </section>

        <div class="body-content">
            <div class="md:pt-16 md:grid-rows-1 max-w-screen-2xl grid grid-cols-12 mx-auto">
                <div class="md:col-span-5 md:col-start-2 flex items-center col-span-10 col-start-2 row-start-2 group-link-underline">
                    <a href="" class="md:py-16 lg:py-20 group flex flex-col" aria-label="Things I Didn't Know About SQS">
                    <div class="flex items-center mb-4">
                        <span class="inline-flex items-center px-3 py-0.5 rounded-full text-xs font-bold leading-5 text-white font-display mr-2 capitalize bg-brand-500" style="background-color: #4662B2">
                        Tutorials
                        </span>
                        <p class="font-mono text-xs font-normal opacity-75 text-white">October 30th, 2021</p>
                    </div>
                    <h2 class="mb-4 font-semibold leading-tight">
                        <span class="link link--lg text-white link-underline">
                        Things I Didn't Know About Elixir Web Application
                        </span>
                    </h2>
                    <div class="abt-sub-content">
                        <p class="prose prose-lg">Elixir Web Application is a great option for your smart water management system, however, there are a few key differences you need to know about it. Each of the following has bitten me before, so before you use Elixir Web Apps read through these tips.</p>
                    </div>
                    </a>
                </div>

                <!-- <div class="md:col-span-5 md:col-start-8 md:row-start-2 md:mb-0 relative col-span-10 col-start-2 row-start-1 mb-6 overflow-hidden">
                    <div class="row">
                        <div class="col"> <img src="/icons/vector/red-fams-analysis.png" class="md:absolute md:top-0 md:left-0 md:h-full object-cover object-left rounded" alt="red-fams-analysis"></div>
                        <div class="col"> <img src="/icons/vector/red-shangchi-analysis.png" class="md:absolute md:top-0 md:left-0 md:h-full object-cover object-left rounded" alt="red-shangchi-analysis"></div>
                        <div class="col"> <img src="/icons/vector/stats.png" class="md:absolute md:top-0 md:left-0 md:h-full object-cover object-left rounded" alt="stats"></div>
                        <div class="col"> <img src="/icons/vector/red-security.png" class="md:absolute md:top-0 md:left-0 md:h-full object-cover object-left rounded" alt="red-security"></div>
                    </div>
                </div> -->

                <b-container class="bv-ex-row">

                    <b-row>
                        <b-col cols="12" md="8">
                            <b-row class="mt-4">
                                <b-col cols="12" md="4">
                                    <div> 
                                        <img src="/icons/vector/red-fams-analysis.png" class="" width="100%" height="100%" alt="red-fams-analysis">
                                    </div>
                                </b-col>
                                <b-col cols="12" md="8">
                                    <div class="abt-sub-title">
                                        <h5 class="mt-4">Powerful <span>Insights</span></h5>
                                    </div>
                                    <p class="mt-3 mb-0 abt-sub-content">
                                        Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.
                                        Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc
                                        ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                    </p>
                                </b-col>
                            </b-row>

                            <b-row class="mt-4">
                                <b-col cols="12" md="4">
                                    <div> 
                                        <img src="/icons/vector/red-shangchi-analysis.png" class="" width="100%" height="100%" alt="red-fams-analysis">
                                    </div>
                                </b-col>
                                <b-col cols="12" md="8">
                                    <div class="abt-sub-title">
                                        <h5 class="mt-4"><span>Real-time </span>Performance</h5>
                                    </div>
                                    <p class="mt-3 mb-0 abt-sub-content">
                                        Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.
                                        Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc
                                        ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                    </p>
                                </b-col>
                            </b-row>

                            <b-row class="mt-4">
                                <b-col cols="12" md="4">
                                    <div> 
                                        <img src="/icons/vector/stats.png" class="" width="100%" height="100%" alt="red-fams-analysis">
                                    </div>
                                </b-col>
                                <b-col cols="12" md="8">
                                    <div class="abt-sub-title">
                                        <h5 class="mt-4">Reliable <span>Technology</span></h5>
                                    </div>
                                    <p class="mt-3 mb-0 abt-sub-content">
                                        Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.
                                        Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc
                                        ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                    </p>
                                </b-col>
                            </b-row>

                            <b-row class="mt-4">
                                <b-col cols="12" md="4">
                                    <div> 
                                        <img src="/icons/vector/red-security.png" class="" width="100%" height="100%" alt="red-fams-analysis">
                                    </div>
                                </b-col>
                                <b-col cols="12" md="8">
                                    <div class="abt-sub-title">
                                        <h5 class="mt-4"><span>ISO 27001 </span>Certified</h5>
                                    </div>
                                    <p class="mt-3 mb-0 abt-sub-content">
                                        Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.
                                        Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc
                                        ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                    </p>
                                </b-col>
                            </b-row>
                        </b-col>

                        <b-col cols="12" md="4">
                            FAQ
                        </b-col>
                        
                    </b-row>

                </b-container>

            </div>
        </div>
    </section>
</template>

<script>
import {mapState} from 'vuex'

export default {
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

<style>
.abt-sub-title {
    text-transform: uppercase;
}
.abt-sub-title span {
    color: rgba(54, 156, 122, 0.904);
}
.abt-sub-content {
    color: rgb(201, 227, 219);
}
</style>