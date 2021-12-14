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
                    <b-form-checkbox value="keterangan">Keterangan</b-form-checkbox>
                    <b-form-checkbox value="jumlah">Jumlah</b-form-checkbox>
                    <b-form-checkbox value="biaya">Biaya</b-form-checkbox>
                    <b-form-checkbox value="status_tagihan">Status Tagihan</b-form-checkbox>
                </b-form-checkbox-group>
                </b-form-group>
            </b-col>

            <!-- Main table element -->
            <div style="overflow: auto; width: 100%;">
                <b-table
                :items="authTagihan"
                :fields="fields"
                :filter="filter"
                :filter-included-fields="filterOn"
                :sort-by.sync="sortBy"
                :sort-desc.sync="sortDesc"
                :sort-direction="sortDirection"
                stacked="md"
                show-empty
                :tbody-tr-class="rowClass"
                head-variant="secondary"
                table-variant="light"
                responsive="lg"
                style="margin-top: 2rem;"
                >
                    <b-thead head-variant="dark">
                    <b-tr>
                        <b-th colspan="2">Region</b-th>
                        <b-th colspan="3">Clothes</b-th>
                        <b-th colspan="2">Accessories</b-th>
                    </b-tr>
                    </b-thead>
                    <template #cell(name)="row">
                        {{ row.value }}
                    </template>

                    <template #cell(status)="row">
                        {{ row.value }}
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
        </b-row>
    </b-container>
</template>

<script>
import {getHeader} from '../../js/config.js'

export default {
    name: 'TableTagihanUser',
    data() {
        return {
            authTagihan: [{}],
            fields: [
                { key: 'keterangan', label: 'Keterangan', sortable: true, sortDirection: 'desc' },
                { key: 'jumlah', label: 'Jumlah', sortable: true, class: 'text-center' },
                { key: 'biaya', label: 'Biaya', sortable: true, class: 'text-center', variant: 'danger' },
                { key: 'status_tagihan', label: 'Status', sortable: true, class: 'text-center', variant: 'success' },
            ],
            //table
            sortBy: '',
            sortDesc: false,
            sortDirection: 'asc',
            filter: null,
            filterOn: [],
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
        this.getAuthTagihan()
    },
    methods: {
        getAuthTagihan() {
            axios.get('/api/tagihan/user', {headers: getHeader()})
            .then(response => {               
                this.authTagihan = response.data.data
            })
        },
        rowClass(item, type) {
            if (!item || type !== 'row') return
            if (item.status_tagihan === 'lunas') return 'table-success'
            else return 'table-warning'
        },
    },
}
</script>

<style>

</style>