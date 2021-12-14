<template>
    <b-container fluid>
        <!-- User Interface controls -->
        <b-row>
        <b-col lg="6" class="my-1">
            <b-form-group
            label="Sort"
            label-for="sort-by-select"
            label-cols-sm="3"
            label-align-sm="right"
            label-size="sm"
            class="mb-0"
            v-slot="{ ariaDescribedby }"
            >
            <b-input-group size="sm">
                <b-form-select
                id="sort-by-select"
                v-model="sortBy"
                :options="sortOptions"
                :aria-describedby="ariaDescribedby"
                class="w-75"
                >
                <template #first>
                    <option value="">-- none --</option>
                </template>
                </b-form-select>

                <b-form-select
                v-model="sortDesc"
                :disabled="!sortBy"
                :aria-describedby="ariaDescribedby"
                size="sm"
                class="w-25"
                >
                <option :value="false">Asc</option>
                <option :value="true">Desc</option>
                </b-form-select>
            </b-input-group>
            </b-form-group>
        </b-col>

        <b-col lg="6" class="my-1">
            <b-form-group
            label="Initial sort"
            label-for="initial-sort-select"
            label-cols-sm="3"
            label-align-sm="right"
            label-size="sm"
            class="mb-0"
            >
            <b-form-select
                id="initial-sort-select"
                v-model="sortDirection"
                :options="['asc', 'desc', 'last']"
                size="sm"
            ></b-form-select>
            </b-form-group>
        </b-col>

        <b-col lg="6" class="my-1">
            <b-form-group
            label="Filter"
            label-for="filter-input"
            label-cols-sm="3"
            label-align-sm="right"
            label-size="sm"
            class="mb-0"
            >
            <b-input-group size="sm">
                <b-form-input
                id="filter-input"
                v-model="filter"
                type="search"
                placeholder="Type to Search"
                ></b-form-input>

                <b-input-group-append>
                <b-button :disabled="!filter" @click="filter = ''">Clear</b-button>
                </b-input-group-append>
            </b-input-group>
            </b-form-group>
        </b-col>

        <b-col lg="6" class="my-1">
            <b-form-group
            v-model="sortDirection"
            label="Filter On"
            description="Leave all unchecked to filter on all data"
            label-cols-sm="3"
            label-align-sm="right"
            label-size="sm"
            class="mb-0"
            v-slot="{ ariaDescribedby }"
            >
            <b-form-checkbox-group
                v-model="filterOn"
                :aria-describedby="ariaDescribedby"
                class="mt-1"
            >
                <b-form-checkbox value="name">Name</b-form-checkbox>
                <b-form-checkbox value="nomor_sambungan">Nomor Sambungan</b-form-checkbox>
                <b-form-checkbox value="status_tagihan">Status Tagihan</b-form-checkbox>
            </b-form-checkbox-group>
            </b-form-group>
        </b-col>

        <b-col sm="5" md="6" class="my-1">
            <b-form-group
            label="Per page"
            label-for="per-page-select"
            label-cols-sm="6"
            label-cols-md="4"
            label-cols-lg="3"
            label-align-sm="right"
            label-size="sm"
            class="mb-0"
            >
            <b-form-select
                id="per-page-select"
                v-model="perPage"
                :options="pageOptions"
                size="sm"
            ></b-form-select>
            </b-form-group>
        </b-col>

        <b-col sm="7" md="6" class="my-1">
            <b-pagination
            v-model="currentPage"
            :total-rows="totalRows"
            :per-page="perPage"
            first-text="First"
            prev-text="Prev"
            next-text="Next"
            last-text="Last"
            align="fill"
            size="sm"
            class="my-0"
            >
                <template #first-text><span class="text-success" style="font-weight: bold;">First</span></template>
                <template #prev-text><span class="text-danger" style="font-weight: bold;">Prev</span></template>
                <template #next-text><span class="text-primary" style="font-weight: bold;">Next</span></template>
                <template #last-text><span class="text-info" style="font-weight: bold;">Last</span></template>
            </b-pagination>
        </b-col>
        </b-row>

        <!-- Main table element -->
        <div style="overflow: auto;">
            <b-table
            :items="tagihan"
            :fields="fields"
            :current-page="currentPage"
            :per-page="perPage"
            :filter="filter"
            :filter-included-fields="filterOn"
            :sort-by.sync="sortBy"
            :sort-desc.sync="sortDesc"
            :sort-direction="sortDirection"
            stacked="md"
            show-empty
            @filtered="onFiltered"
            :tbody-tr-class="rowClass"
            head-variant="dark"
            table-variant="light"
            responsive="sm"
            style="margin-top: 2rem;"
            >
            <template #cell(name)="row">
                {{ row.value }}
            </template>

            <template #cell(status)="row">
                {{ row.value }}
            </template>

            <template #cell(actions)="row">
                <b-button size="sm" @click="row.toggleDetails">
                {{ row.detailsShowing ? 'Hide' : 'Show' }} Details
                </b-button>
            </template>

            <template #cell(modal)="row">
                <b-button size="sm" @click="info(row.item, row.index, $event.target)" class="mr-1">
                Info modal
                </b-button>
            </template>

            <template #row-details="row">
                <b-card style="color: #fff; background-color: #333;">
                <ul>
                    <li v-for="(value, key) in row.item" :key="key">{{ key }}: {{ value }}</li>
                </ul>
                </b-card>
            </template>
            </b-table>
        </div>

        <!-- Info modal -->
        <!-- <b-modal 
        :id="infoModal.id" 
        :title="infoModal.title" 
        ok-only 
        @hide="resetInfoModal" 
        centered 
        hide-backdrop 
        v-model="show" 
        :header-bg-variant="headerBgVariant"
        :header-text-variant="headerTextVariant"
        :body-bg-variant="bodyBgVariant"
        :body-text-variant="bodyTextVariant"
        :footer-bg-variant="footerBgVariant"
        :footer-text-variant="footerTextVariant"
        >
            <pre style="max-height: 10rem;">{{ infoModal.content }}</pre>

            <b-container fluid>
                <b-row class="mb-1 text-center">
                <b-col cols="3"></b-col>
                <b-col>Background</b-col>
                <b-col>Text</b-col>
                </b-row>

                <b-row class="mb-1">
                <b-col cols="3">Header</b-col>
                <b-col>
                    <b-form-select
                    v-model="headerBgVariant"
                    :options="variants"
                    ></b-form-select>
                </b-col>
                <b-col>
                    <b-form-select
                    v-model="headerTextVariant"
                    :options="variants"
                    ></b-form-select>
                </b-col>
                </b-row>

                <b-row class="mb-1">
                <b-col cols="3">Body</b-col>
                <b-col>
                    <b-form-select
                    v-model="bodyBgVariant"
                    :options="variants"
                    ></b-form-select>
                </b-col>
                <b-col>
                    <b-form-select
                    v-model="bodyTextVariant"
                    :options="variants"
                    ></b-form-select>
                </b-col>
                </b-row>

                <b-row>
                <b-col cols="3">Footer</b-col>
                <b-col>
                    <b-form-select
                    v-model="footerBgVariant"
                    :options="variants"
                    ></b-form-select>
                </b-col>
                <b-col>
                    <b-form-select
                    v-model="footerTextVariant"
                    :options="variants"
                    ></b-form-select>
                </b-col>
                </b-row>
            </b-container>

            <template #modal-footer>
                <div class="w-100">
                <p class="float-left">Caution: don't share this credentials member data</p>
                <b-button
                    variant="primary"
                    size="sm"
                    class="float-right"
                    @click="show=false"
                >
                    Close
                </b-button>
                </div>
            </template>
        </b-modal> -->
    </b-container>
</template>

<script>
  export default {
    name: 'TableTagihan',
    data() {
        return {
            // items: [
            //     { isActive: true, age: 40, name: { first: 'Dickerson', last: 'Macdonald' } },
            //     { isActive: false, age: 21, name: { first: 'Larsen', last: 'Shaw' } },
            //     {
            //         isActive: false,
            //         age: 9,
            //         name: { first: 'Mini', last: 'Navarro' },
            //         _rowVariant: 'success'
            //     },
            //     { isActive: false, age: 89, name: { first: 'Geneva', last: 'Wilson' } },
            //     { isActive: true, age: 38, name: { first: 'Jami', last: 'Carney' } },
            //     { isActive: false, age: 27, name: { first: 'Essie', last: 'Dunlap' } },
            //     { isActive: true, age: 40, name: { first: 'Thor', last: 'Macdonald' } },
            //     {
            //         isActive: true,
            //         age: 87,
            //         name: { first: 'Larsen', last: 'Shaw' },
            //         _cellVariants: { age: 'danger', isActive: 'warning' }
            //     },
            //     { isActive: false, age: 26, name: { first: 'Mitzi', last: 'Navarro' } },
            //     { isActive: false, age: 22, name: { first: 'Genevieve', last: 'Wilson' } },
            //     { isActive: true, age: 38, name: { first: 'John', last: 'Carney' } },
            //     { isActive: false, age: 29, name: { first: 'Dick', last: 'Dunlap' } }
            // ],
            tagihan: [{}],
            fields: [
                { key: 'name', label: 'Person full name', sortable: true, sortDirection: 'desc' },
                { key: 'nomor_sambungan', label: 'No. Sambungan', sortable: true, class: 'text-center' },
                { key: 'keterangan', label: 'Keterangan', sortable: true, class: 'text-center', variant: 'info' },
                { key: 'jumlah', label: 'Jumlah', sortable: true, class: 'text-center' },
                { key: 'biaya', label: 'Biaya', sortable: true, class: 'text-center', variant: 'danger' },
                {
                    key: 'status_tagihan',
                    label: 'Status Tagihan',
                    sortable: true,
                    sortByFormatted: true,
                    filterByFormatted: true,
                },
                { key: 'actions', label: 'Actions' },
                { key: 'modal', label: 'Modal' },
            ],
            //table
            totalRows: 1,
            currentPage: 1,
            perPage: 5,
            pageOptions: [5, 10, 15, { value: 100, text: "Show a lot" }],
            sortBy: '',
            sortDesc: false,
            sortDirection: 'asc',
            filter: null,
            filterOn: [],
            // // modal
            // infoModal: {
            //     id: 'info-modal',
            //     title: '',
            //     content: ''
            // },
            // show: false,
            // variants: ['primary', 'secondary', 'success', 'warning', 'danger', 'info', 'light', 'dark'],
            // headerBgVariant: 'dark',
            // headerTextVariant: 'light',
            // bodyBgVariant: 'light',
            // bodyTextVariant: 'dark',
            // footerBgVariant: 'warning',
            // footerTextVariant: 'dark'
        }
    },
    computed: {
        sortOptions() {
            // Create an options list from our fields
            return this.fields
            .filter(f => f.sortable)
            .map(f => {
                return { text: f.label, value: f.key }
            })
        }
    },
    mounted() {        
        this.getAllTagihan()
        // this.getCountAllTagihan()
    },
    methods: {
        // info(item, index, button) {
        //     this.infoModal.title = `Row index: ${index}`
        //     this.infoModal.content = JSON.stringify(item, null, 2)
        //     this.$root.$emit('bv::show::modal', this.infoModal.id, button)
        // },
        // resetInfoModal() {
        //     this.infoModal.title = ''
        //     this.infoModal.content = ''
        // },
        onFiltered(filteredItems) {
            // Trigger pagination to update the number of buttons/pages due to filtering
            this.totalRows = filteredItems.length
            this.currentPage = 1
        },
        rowClass(item, type) {
            if (!item || type !== 'row') return
            if (item.status_tagihan === 'lunas') return 'table-success'
            else return 'table-warning'
        },
        getAllTagihan() {
            axios.get('/api/tagihan')
            .then(response => {               
                this.tagihan = response.data.data

                // Set the initial number of items
                this.totalRows = this.tagihan.length
            })
        },
        getCountAllTagihan() {
            axios.get('/api/tagihan/count')
            .then(response => {               
                this.tagihanCount = response.data.data
                console.log(response)
            })
        }
    }
  }
</script>

<style>

</style>
