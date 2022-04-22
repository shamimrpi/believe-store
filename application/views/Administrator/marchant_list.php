<style>
    .v-select {
        margin-bottom: 5px;
    }

    .v-select.open .dropdown-toggle {
        border-bottom: 1px solid #ccc;
    }

    .v-select .dropdown-toggle {
        padding: 0px;
        height: 25px;
    }

    .v-select input[type=search],
    .v-select input[type=search]:focus {
        margin: 0px;
    }

    .v-select .vs__selected-options {
        overflow: hidden;
        flex-wrap: nowrap;
    }

    .v-select .selected-tag {
        margin: 2px 0px;
        white-space: nowrap;
        position: absolute;
        left: 0px;
    }

    .v-select .vs__actions {
        margin-top: -5px;
    }

    .v-select .dropdown-menu {
        width: auto;
        overflow-y: auto;
    }

    #customers label {
        font-size: 13px;
    }

    #customers select {
        border-radius: 3px;
    }

    #customers .add-button {
        padding: 2.5px;
        width: 28px;
        background-color: #298db4;
        display: block;
        text-align: center;
        color: white;
    }

    #customers .add-button:hover {
        background-color: #41add6;
        color: white;
    }

    #customers input[type="file"] {
        display: none;
    }

    #customers .custom-file-upload {
        border: 1px solid #ccc;
        display: inline-block;
        padding: 5px 12px;
        cursor: pointer;
        margin-top: 5px;
        background-color: #298db4;
        border: none;
        color: white;
    }

    #customers .custom-file-upload:hover {
        background-color: #41add6;
    }

    #customerImage {
        height: 100%;
    }
</style>
<div id="app">
    <div class="row">
        <div class="col-sm-12 form-inline">
            <div class="form-group">
                <label for="filter" class="sr-only">Filter</label>
                <input type="text" class="form-control" v-model="filter" placeholder="Filter">
            </div>
        </div>
        <div class="col-md-12">
            <div class="table-responsive">
                <datatable :columns="columns" :data="marchant" :filter-by="filter" style="margin-bottom: 5px;">
                    <template scope="{ row }">
                        <tr>
                            <td>{{ row.name}}</td>
                            <td>{{ row.mobile }}</td>
                            <td>{{ row.nid }}</td>
                            <td>{{ row.page_name }}</td>
                            <td>
                                <?php if ($this->session->userdata('accountType') != 'u') { ?>
                                 
                                    <button type="button" class="button" @click="active(row.id)">
                                    {{ row.status == 'a' ?'active':'deactive'}}
                                    </button>
                                <?php } ?>
                            </td>
                        </tr>
                    </template>
                </datatable>
                <datatable-pager v-model="page" type="abbreviated" :per-page="per_page" style="margin-bottom: 50px;"></datatable-pager>
            </div>
        </div>
    </div>
</div>

<script src="<?php echo base_url(); ?>assets/js/vue/vue.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/vuejs-datatable.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/vue-select.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/moment.min.js"></script>

<script>
    Vue.component('v-select', VueSelect.VueSelect);
    new Vue({
        el: '#app',
        data() {
            return {
                marchant: [],
                columns: [{
                        label: 'Name',
                        field: 'name',
                        align: 'center',
                        filterable: false
                    },
                    {
                        label: 'Mobile',
                        field: 'mobile',
                        align: 'center',
                        filterable: false
                    },
                    {
                        label: 'NID',
                        field: 'nid',
                        align: 'center'
                    },
                    {
                        label: 'Page Name',
                        field: 'page_name',
                        align: 'center'
                    },
                    {
                        label: 'Action',
                        field: 'Action',
                        align: 'center'
                    },
                ],
                page: 1,
                per_page: 10,
                filter: ''
            }
        },
        filters: {
            dateOnly(datetime, format) {
                return moment(datetime).format(format);
            }
        },
        created() {
            this.getMarchant();
        },
        methods: {
            getMarchant() {
                axios.get('/get-all-marchant').then(res => {
                    this.marchant = res.data;
                })
            },
            active(id){
                alert()
                axios.post('/approve/'+id).then(res => {
                    this.getMarchant();
                })
            }
         
          
           
          
        }
    })
</script>