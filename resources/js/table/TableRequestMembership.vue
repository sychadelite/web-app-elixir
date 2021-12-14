<template>
  <div>
    <div style="height: 30rem; overflow: auto;">
      <b-table :items="requestMembership" :fields="fields" striped responsive="sm" table-variant="dark" hover small>
        <template #cell(show_details)="row">
            
          <b-button size="sm" @click="row.toggleDetails" class="mr-2" variant="info">
            {{ row.detailsShowing ? 'Hide' : 'Show'}} Details
          </b-button>

        </template>

        <template #cell(status)="row">
            <div v-if="row.item.status == 0">
              <b-button size="sm" class="mr-2" variant="danger" type="submit" @click.prevent="updateStatus0(row.item.nomor_pelanggan)" content="Change Status" v-tippy="{ placement : 'right',  arrow: true }">
              Not Active
              </b-button>
            </div>
            <div v-else>
              <b-button size="sm" class="mr-2" variant="success" type="submit" @click.prevent="updateStatus1(row.item.nomor_pelanggan)" content="Change Status" v-tippy="{ placement : 'right',  arrow: true }">
              Active
              </b-button>
            </div>
        </template>

        <template #row-details="row">
          <b-card style="color: #fff; background-color: #333;">

            <b-row class="mb-2">
              <b-col sm="3" class="text-sm-right"><b>Email:</b></b-col>
              <b-col>{{ row.item.email }}</b-col>
            </b-row>

            <b-row class="mb-2">
              <b-col sm="3" class="text-sm-right"><b>Alamat:</b></b-col>
              <b-col>{{ row.item.alamat }}</b-col>
            </b-row>

            <b-button size="sm" @click="row.toggleDetails">
              Hide Details
            </b-button>

            <b-button size="sm" @click.prevent="lihatuserByAdmin(row.item.nomor_pelanggan)" class="ml-2" variant="warning">
              Edit
            </b-button>
            
          </b-card>
        </template>
      </b-table>
    </div>
  </div>
</template>

<script>
import {getHeader} from '../../js/config.js'

export default {
    name: "TableRequestMembership",
    data() {
      return {
        fields: ['nomor_pelanggan', 'username', 'status' , 'nomor_sambungan', 'jenis_member', 'nama_cabang', 'nama_alat', 'kondisi_alat', 'show_details'],
        requestMembership: [
          { 
            alamat: 'alamat', 
            username: 'username', 
            nomor_pelanggan: 'nomor_pelanggan',
            email: 'email',
            status: 'status',
            nomor_sambungan: 'nomor_sambungan',
            jenis_member: 'jenis_member',
            nama_cabang: 'nama_cabang',
            nama_alat: 'nama_alat',
            kondisi_alat: 'kondisi_alat',
          }
        ],
      }
    },
    mounted() {
        this.getMembershipRequest()
    },
    methods: {
        getMembershipRequest() {
            axios.get('/api/membership/memberRequest', {headers: getHeader()}).then((response) => {
                console.log('fetched')
                this.requestMembership = response.data.data
            })
        },
        updateStatus0(id_s0) {
            axios.put('/api/users/status0/' + id_s0).then((response) => {
                if(response.data.status) {
                    this.getMembershipRequest()
                    this.$noty.success(response.data.message)
                }  
            })
        },
        updateStatus1(id_s1) {
            axios.put('/api/users/status1/' + id_s1).then((response) => {
                if(response.data.status) {
                    this.getMembershipRequest()
                    this.$noty.success(response.data.message)
                }  
            })
        },
        lihatuserByAdmin(id) {                      
            this.$router.push({
                name: 'MemberProfile',
                params: {id}
            })
        }
    }
};
</script>