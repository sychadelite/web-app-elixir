<template>
    <section id="section-content">
        <div class="body-content">
            <h1>About</h1>
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
                    <p class="prose prose-lg text-white">Elixir Web Application is a great option for your smart water management system, however, there are a few key differences you need to know about it. Each of the following has bitten me before, so before you use Elixir Web Apps read through these tips.</p>
                    </a>
                </div>
                <div class="md:col-span-5 md:col-start-8 md:row-start-2 md:mb-0 relative col-span-10 col-start-2 row-start-1 mb-6 overflow-hidden">
                    <div class="row">
                        <div class="col"> <img src="/icons/pdam/pipe.png" class="md:absolute md:top-0 md:left-0 md:h-full object-cover object-left rounded" alt="pipe.png"></div>
                        <div class="col"> <img src="/icons/pdam/pipe.png" class="md:absolute md:top-0 md:left-0 md:h-full object-cover object-left rounded" alt="pipe.png"></div>
                        <div class="col"> <img src="/icons/pdam/pipe.png" class="md:absolute md:top-0 md:left-0 md:h-full object-cover object-left rounded" alt="pipe.png"></div>
                    </div>
                </div>
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
        console.log('I was Created')
        const userObj = JSON.parse(window.localStorage.getItem('authUser'))                 
        this.$store.dispatch('setUserObject', userObj)                                      // trigger the state and get the authUser item
    }
}
</script>