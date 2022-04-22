<style>
    .passwordChangeForm {
        border: 1px solid #ddd;
        padding: 20px;
        height: auto;
    }
</style>

<div id="pendingOrder">

    <div class="row justify-content-center mt-5">
        <form @submit.prevent="saveMarchant" id="Marchant">
            <div class="container">
                <h5 class="text-center">Profile Update</h5>
                <div class="row justify-content-center" style="margin-top: 10px;margin-bottom:15px;border-bottom: 1px solid #ccc;padding-bottom:15px;">
                    <div class="col-md-4">
                        <div class="form-group clearfix">
                            <input type="hidden" class="form-control" v-model="form.id">
                            <label class="control-label col-md-4">Full Name:</label>
                            <input type="text" class="form-control" v-model="form.name" required>

                        </div>
                        <div class="form-group clearfix">
                            <label class="control-label col-md-4">Page Name:</label>
                            <input type="text" class="form-control" v-model="form.page_name">

                        </div>
                        <div class="form-group clearfix">
                            <label class="control-label col-md-4">NID No:</label>
                            <input type="text" class="form-control" v-model="form.voter_id">

                        </div>

                        <div class="form-group clearfix">
                            <label class="control-label col-md-4">Address:</label>
                            <input type="text" class="form-control" v-model="form.address">

                        </div>
                        <div class="form-group clearfix">
                            <label class="control-label col-md-4">Mobile:</label>
                            <input type="text" class="form-control" v-model="form.mobile" required>

                        </div>
                    </div>
                    <div class="col-md-3 text-center d-flex;">
                        <div class="form-group clearfix">
                            <div style="width: 100px;height:100px;border: 1px solid #ccc;overflow:hidden;">
                                <img id="customerImage" v-if="imageUrl == '' || imageUrl == null" src="/assets/no_image.gif" >
                                <img id="customerImage" v-if="imageUrl != '' && imageUrl != null" v-bind:src="imageUrl">
                            </div>
                            <div style="text-align:center;">
                                <label class="custom-file-upload">
                                    <input type="file" name="owner_image" id="owner_image" @change="previewImage" ref="imageUpload" />

                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 text-center d-flex;">
                        <div class="form-group clearfix">
                            <div style="width: 100px;height:100px;border: 1px solid #ccc;overflow:hidden;">
                                <img id="customerImage" v-if="imageUrl2 == '' || imageUrl == null" src="/assets/no_image.gif">
                                <img id="customerImage" v-if="imageUrl2 != '' && imageUrl != null" v-bind:src="imageUrl2">
                            </div>
                            <div style="text-align:center;">
                                <label class="custom-file-upload">
                                    <input type="file" name="nid_image" id="nid_image" @change="previewImage2" ref="imageUpload" />

                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10" style="display: flex;">
                        <input type="submit" class="btn btn-success btn-sm submit-btn ms-auto" value="Update" id="submit">


                    </div>
                </div>
            </div>

        </form>
    </div>
</div>

<script src="<?php echo base_url(); ?>assets/js/vue/vue.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/vuejs-datatable.js"></script>
<script src="<?php echo base_url(); ?>assets/marchant/js/vue-select.js"></script>
<script src="<?php echo base_url(); ?>assets/js/moment.min.js"></script>

<script>
    new Vue({
        el: '#pendingOrder',
        data: () => ({
            form: {
                name: '',
                mobile: '',
                address: '',
                voter_id: '',
                page_name: '',
                type: '',
                id: '',
            },
            imageUrl: '/uploads/wholeseller/<?php echo $this->session->userdata('owner_image')?>',
            imageUrl2: '/uploads/wholeseller/<?php echo $this->session->userdata('nid_image')?>',
            selectedFile: null,
            selectedFile2: null,
        }),

        created() {
            this.getUser();
        },
        methods: {

            saveMarchant() {
                axios.post('/password-update', this.form).then(res => {
                    let r = res.data;
                    alert('Password changed successfully');

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
            getUser(){
                let id = '<?php echo $this->session->userdata('marchant_id')?>';
                axios.post('/get-profile-data/'+id ).then(res => {
                    console.log(res.data);
                    this.form.name = res.data.name;
                    this.form.mobile = res.data.mobile;
                    this.form.address = res.data.address;
                    this.form.voter_id = res.data.nid;
                    this.form.page_name = res.data.page_name;
                    this.form.type = res.data.type;
                    this.form.id = id;
                    
                })
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
                    axios.post('/profileUpdate', fd).then(res => {
                        let r = res.data;
                        alert('Profile update successfully');
                        this.getUser();
                    })

               
            },
        }
    })
</script>