<?php
$companyInfo = $this->db->query("select * from tbl_company c order by c.Company_SlNo desc limit 1")->row();

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form</title>
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/marchant/css/bootstrap.min.css">
    <style>
        body {
            background-image: url(./assets/images/bg.png);
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .login-form {
            height: 100vh;
            position: relative;
        }

        .card {
            margin: 0;
            position: absolute;
            top: 50%;
            left: 50%;
            -ms-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            width: 800px;
            box-shadow: 0 0 15px #000;
        }

        .user-icon {
            font-size: 70px;
        }
    </style>
</head>

<body>
    <div class="container login-form" id="registration">
        <div class="card">
            <div class="card-header">
                <h5 class="text-center">Wholeseller Registraion Form</h5>
            </div>
            <div class="card-body ">
                <!-- <p style="color:red;"><?php if (isset($message)) {
                                                echo $message;
                                            } ?></p> -->
                <form v-on:submit.prevent="registration">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for=""> Name <span class="text-danger">*</span> </label>
                                <input type="text" v-model="form.name" class="form-control mt-1" placeholder="Full Name" required>
                            </div>
                            <div class="form-group">
                                <label for="">Mobile <span class="text-danger">*</span></label>
                                <input type="text" v-model="form.mobile" class="form-control mt-1" v-on:input="phoneChekck" placeholder="Mobile Number" required>
                                <div id="mobile_msg" class="text-danger"></div>
                            </div>
                            <div class="form-group">
                                <label for="">Voter ID No. <span class="text-danger">*</span></label>
                                <input type="text" v-model="form.voter_id" class="form-control mt-1" v-on:input="phoneChekck" placeholder="Voter ID" required>

                            </div>
                            <div class="form-group">
                                <label for="">Password <span class="text-danger">*</span></label>
                                <input type="password" v-model="form.password" class="form-control mt-1" placeholder="Password" required>
                            </div>
                            <div class="form-group">
                                <label for="">Retype Password <span class="text-danger">*</span></label>
                                <input type="password" v-on:input="passwordMatch" v-model="form.retype_password" class="form-control mt-1" placeholder="Retype Password" required>
                                <div id="error"></div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="">Address <span class="text-danger">*</span></label>
                                <textarea v-model="form.address" class="form-control" rows="2" placeholder="Address"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="">Voter Id Image <span class="text-danger">*</span></label>
                                <input type="file" name="id_image" id="id_image" class="form-control" ref="imageUpload">
                            </div>
                            <div class="form-group">
                                <label for="">Owner Image <span class="text-danger">*</span></label>
                                <input type="file" name="owener_image" id="owner_image" class="form-control" ref="imageUpload">
                            </div>
                            <div class="form-group mt-5">
                                <button type="submit" id="submit" class="form-control btn btn-success">Registration</button>
                            </div>
                            <div class="mt-3">
                                <p>You have alreay account Please <a :href="'user-login/'">Login</a></p>
                            </div>
                        </div>
                    </div>


                </form>
            </div>
        </div>
    </div>
    <script src="<?php echo base_url(); ?>assets/marchant/js/jquery.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/marchant/js/bootstrap.bundle.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/marchant/js/all.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/js/vue/vue.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/js/vue/axios.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/marchant/js/vue-select.js"></script>
    <script src="<?php echo base_url(); ?>assets/js/moment.min.js"></script>

    <script>
        Vue.component('v-select', VueSelect.VueSelect)

        new Vue({
            el: '#registration',
            data: () => ({
                form: {
                    name: '',
                    mobile: '',
                    password: '',
                    retype_password: '',
                    address: '',
                    voter_id: '',
                    type: 'marchant',
                },
                selectedFile: ''

            }),
            created() {},
            methods: {
                onChange(event) {
                    this.form.type = event.target.value;
                    console.log(this.form.type);

                },
                phoneChekck() {
                    if (this.form.mobile != '') {
                        console.log(this.form.mobile);
                        axios.post('/number-check', this.form).then(res => {
                            console.log(res.data);
                            if (res.data == this.form.mobile) {
                                $('#mobile_msg').text('Mobile Number already exist');
                                document.getElementById("submit").disabled = true;
                            } else {
                                $('#mobile_msg').text('');
                                document.getElementById("submit").disabled = false;
                            }

                        })

                    }

                },
                passwordMatch() {
                    if (this.form.password != this.form.retype_password) {
                        $('#error').text('password does not match');
                        $('#error').css('color', 'red');
                        document.getElementById("submit").disabled = true;
                    } else {
                        $('#error').text('password  match');
                        $('#error').css('color', 'green');
                        document.getElementById("submit").disabled = false;
                    }
                },
                previewImage() {
                    // let selectedFiles =e.target.files;
                    let files = $('#multi_image')[0].files;
                    for (i = 0; i < files.length; i++) {
                        if (event.target.files.length > 0) {
                            this.selectedFile = event.target.files;

                        } else {
                            this.selectedFile = null;
                        }
                        console.log(this.selectedFile);
                    }

                },
                registration() {
                    let fd = new FormData();
                    let files = $('#id_image')[0].files;

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
                        fd.append("owner_iamge", owner_image[i]);
                    }

                    fd.append('form', JSON.stringify(this.form));
                    axios.post('/wholeseller-registration-store', fd).then(res => {
                        let r = res.data;
                        alert('registration submited successfully');
                        // location.reload();

                    })
                }




            }
        })
    </script>
</body>

</html>