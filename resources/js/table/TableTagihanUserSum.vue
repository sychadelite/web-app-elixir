<template>
    <div>
         <!-- <b-table :items="authTagihanSum" :fields="fields" tbody-tr-class="table-danger"></b-table> -->
         <div style="margin-left: 15px; margin-right: 15px; text-align: center;">
             <b-row>
                <b-col class="table-info" style="color: #333; padding: 2rem;">
                    <h5>Total Biaya Yang Tersisa: </h5>
                    <br>
                    <h2><strong>Rp. {{ authTagihanSum }},-</strong></h2>
                    <b-button variant="primary" class="mt-4 mb-4" @click.prevent="toPaymentMethod" :content="'Pay for Rp, ' + authTagihanSum + ',-'" v-tippy="{ placement : 'bottom',  arrow: true }">
                        PAY NOW <b-icon icon="credit-card" aria-hidden="true"></b-icon>
                    </b-button>
                </b-col>
             </b-row>
             
         </div>
    </div>
</template>

<script>
import {getHeader} from '../../js/config.js'

export default {
    name: 'TableTagihanUserSum',
    data() {
        return {
            authTagihanSum: 0
        }
    },
    mounted() {
        this.getAuthTagihanSum()
    },
    methods: {
        getAuthTagihanSum() {
            axios.get('/api/tagihan/user/sum', {headers: getHeader()})
            .then(response => {               
                this.authTagihanSum = response.data.data
            })
        },
        toPaymentMethod() {                      
            this.$router.push({
                name: 'PaymentMethod',
            })
        },
    }
}
</script>