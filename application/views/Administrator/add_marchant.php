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
    <form @submit.prevent="saveMarchant" id="Marchant">
        <div class="row" style="margin-top: 10px;margin-bottom:15px;border-bottom: 1px solid #ccc;padding-bottom:15px;">
            <div class="col-md-6">
                <div class="form-group clearfix">
                <input type="hidden" class="form-control" v-model="form.id">
                    <label class="control-label col-md-4">Owner/Full Name:</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" v-model="form.name" required>
                    </div>
                </div>

                <div class="form-group clearfix">
                    <label class="control-label col-md-4">Page Name:</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" v-model="form.page_name">
                    </div>
                </div>
                <div class="form-group clearfix">
                    <label class="control-label col-md-4">NID No:</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" v-model="form.voter_id">
                    </div>
                </div>

                <div class="form-group clearfix">
                    <label class="control-label col-md-4">Address:</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" v-model="form.address">
                    </div>
                </div>
                <div class="form-group clearfix">
                    <label class="control-label col-md-4">Mobile:</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" v-model="form.mobile" required>
                    </div>
                </div>

                <div class="form-group clearfix">


                    <div class="form-group clearfix">
                        <label class="control-label col-md-4">Customer Type:</label>
                        <div class="col-md-7">
                            <input type="radio" name="customerType" value="marchant" v-model="form.type" > Marchant
                            <input type="radio" name="customerType" value="wholesaller" v-model="form.type"> Wholesaller
                        </div>
                    </div>


                </div>
            </div>
            <div class="col-md-2 text-center;">
                <div class="form-group clearfix">
                    <div style="width: 100px;height:100px;border: 1px solid #ccc;overflow:hidden;">
                        <img id="customerImage" v-if="imageUrl == '' || imageUrl == null" src="/assets/no_image.gif">
                        <img id="customerImage" v-if="imageUrl != '' && imageUrl != null" v-bind:src="imageUrl">
                    </div>
                    <div style="text-align:center;">
                        <label class="custom-file-upload">
                            <input type="file" name="owner_image" id="owner_image" @change="previewImage" ref="imageUpload" />
                            Select Image
                        </label>
                    </div>
                </div>
            </div>
            <div class="col-md-2 text-center;">
                <div class="form-group clearfix">
                    <div style="width: 100px;height:100px;border: 1px solid #ccc;overflow:hidden;">
                        <img id="customerImage" v-if="imageUrl2 == '' || imageUrl == null" src="/assets/no_image.gif">
                        <img id="customerImage" v-if="imageUrl2 != '' && imageUrl != null" v-bind:src="imageUrl2">
                    </div>
                    <div style="text-align:center;">
                        <label class="custom-file-upload">
                            <input type="file" name="nid_image" id="nid_image" @change="previewImage2" ref="imageUpload" />
                            Select NID
                        </label>
                    </div>
                </div>
            </div>
            <div class="col-md-10" style="display: flex;">
                    <input type="submit" class="btn btn-success btn-sm submit-btn" value="Save" id="submit">
                  
                
            </div>
        </div>
    </form>

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
                                    <button type="button" class="button edit" @click="editMarchant(row)">
                                        <i class="fa fa-pencil"></i>
                                    </button>
                                    <button type="button" class="button" @click="deleteCustomer(row.id)">
                                        <i class="fa fa-trash"></i>
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
                form: {
                    name: '',
                    mobile: '',
                    password: '',
                    retype_password: '',
                    address: '',
                    voter_id: '',
                    page_name: '',
                    type: '',
                    id: '',
                },
                marchant: [],
                selectedDistrict: null,
                imageUrl: '',
                imageUrl2: '',
                selectedFile: null,
                selectedFile2: null,

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
                axios.get('/get-marchant-wholeseller').then(res => {
                    this.marchant = res.data;
                })
            },
            previewImage() {
                if (event.target.files.length > 0) {
                    this.selectedFile = event.target.files[0];
                    this.imageUrl = URL.createObjectURL(this.selectedFile);
                } else {
                    this.selectedFile = null;
                    this.imageUrl = null;
                }
            },
            previewImage2() {
                if (event.target.files.length > 0) {
                    this.selectedFile2 = event.target.files[0];
                    this.imageUrl2 = URL.createObjectURL(this.selectedFile2);
                } else {
                    this.selectedFile2 = null;
                    this.imageUrl2 = null;
                }
            },
            saveMarchant() {
                if(this.form.type == ''){
                    alert('Please select account type');
                    return;
                }
                     let fd = new FormData();
                    let files = $('#nid_image')[0].files;

                    for (let i = 0; i < files.length; i++) {
                        let image_name = files[i].name;
                        let image_ext = image_name.substring(image_name.lastIndexOf('.') + 1);

                        if (!["png", "jpeg", "jpg", "gif"].includes(image_ext)) {
                            alert('Image format ' + image_ext + ' not support!');
                            return;
                        }
                        fd.append("id_image", files[i]);
                    }

                    let owner_image = $('#owner_image')[0].files;

                    for (let i = 0; i < owner_image.length; i++) {
                        let image_name = owner_image[i].name;
                        let image_ext = image_name.substring(image_name.lastIndexOf('.') + 1);

                        if (!["png", "jpeg", "jpg", "gif"].includes(image_ext)) {
                            alert('Image format ' + image_ext + ' not support!');
                            return;
                        }
                        fd.append("owner_image", owner_image[i]);
                    }
                  

                    fd.append('form', JSON.stringify(this.form));
                    console.log(this.fd);
                    axios.post('/marchant-store', fd).then(res => {
                        let r = res.data;
                        alert('registration submited successfully');
                        this.getMarchant();
                        this.resetForm();

                    })

               
            },
            editMarchant(marchant) {
               this.form.id = marchant.id;
               this.form.name = marchant.name;
               this.form.page_name = marchant.page_name;
               this.form.voter_id = marchant.nid;
               this.form.address = marchant.address;
               this.form.mobile = marchant.mobile;
               this.form.type = marchant.type;
               this.imageUrl = 'uploads/wholeseller/'+marchant.owner_image;
               this.imageUrl2 = 'uploads/wholeseller/'+marchant.nid_image;
               $('#submit').val('Update');
            },
            deleteCustomer(id) {
                let deleteConfirm = confirm('Are you sure?');
                if (deleteConfirm == false) {
                    return;
                }
                axios.post('/marchant-delete/'+id).then(res => {
                    this.getMarchant();
                })
            },
            resetForm() {
                    this.form.mobile = '';
                    this.form.password= '';
                    this.form.name = '';
                    this.form.address=  '';
                    this.form.voter_id = '';
                    this.form.page_name= '';
                    this.form.id = ''
                    this.imageUrl = ''
                    this.imageUrl2 = ''
                    $('#submit').val('Save');
             
            }
        }
    })
</script>