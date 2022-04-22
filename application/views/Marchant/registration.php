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
        body{
            background-image: url(./assets/images/bg.png);
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .login-form{
            height: 100vh;
            position: relative;
        }
       .card{
        margin: 0;
        position: absolute;
        top: 50%;
        left: 50%;
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        width: 400px;
        box-shadow: 0 0 15px #000;
       }
       .user-icon{
           font-size: 70px;
       }
    </style>
</head>
<body>
    <div class="container login-form" id="registration">
        <div class="card" >
            <div class="card-header">
                <h5 class="text-center">Marchant Registraion Form</h5>
            </div>
            <div class="card-body ">
                 <!-- <p style="color:red;"><?php if(isset($message)){ echo $message; } ?></p> -->
                <form v-on:submit.prevent="registration" >
                    <div class="form-group">
                        <label for="">Owner Name <span class="text-danger">*</span> </label>
                        <input type="text" v-model="form.name" class="form-control mt-1"  placeholder="Owner Name" required>
                    </div>
                    <div class="form-group">
                        <label for="">Page Name <span class="text-danger">*</span> </label>
                        <input type="text" v-model="form.page_name" class="form-control mt-1"  placeholder="Page Name" required>
                    </div>
                    <div class="form-group">
                        <label for="">Mobile <span class="text-danger">*</span></label>
                        <input type="text" v-model="form.mobile" class="form-control mt-1" v-on:input="phoneChekck"  placeholder="Mobile Number" required>
                        <div id="mobile_msg" class="text-danger"></div>
                    </div>
                  
                    <div class="form-group">
                        <label for="">Password <span class="text-danger">*</span></label>
                        <input type="password"  v-model="form.password" class="form-control mt-1" placeholder="Password" required>
                    </div>
                    <div class="form-group">
                        <label for="">Retype Password <span class="text-danger">*</span></label>
                        <input type="password" v-on:input="passwordMatch" v-model="form.retype_password" class="form-control mt-1"  placeholder="Retype Password" required>
                        <div id="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="">Address <span class="text-danger">*</span></label>
                        <textarea v-model="form.address" class="form-control" rows="2" placeholder="Address" required></textarea>
                    </div>

                    <div class="form-group mt-3">
                        <button type="submit" id="submit" class="form-control btn btn-success">Registration</button>
                    </div>
                    <div>
                        <p>You have alreay account Please <a :href="'user-login/'">Login</a></p>
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
				page_name: '',
                type: 'marchant',
			},

		}),
		created() {
		},
		methods: {
                 onChange(event) {
                    this.form.type = event.target.value;
                    console.log(this.form.type);
                    
                },
                phoneChekck(){
                    if(this.form.mobile != ''){
                        console.log(this.form.mobile);
                        axios.post('/number-check', this.form).then(res => {
                            console.log(res.data);
                            if(res.data == this.form.mobile){
                                $('#mobile_msg').text('Mobile Number already exist');
                                document.getElementById("submit").disabled = true;
                            }else{
                                $('#mobile_msg').text('');
                                document.getElementById("submit").disabled = false;
                            }
                            
                        })
                        
                    }
                   
                },
                passwordMatch(){
                    if(this.form.password != this.form.retype_password){
                        $('#error').text('password does not match');
                        $('#error').css('color','red');
                        document.getElementById("submit").disabled = true;
                    }
                    else{
                        $('#error').text('password  match');
                        $('#error').css('color','green');
                        document.getElementById("submit").disabled = false;
                    }
                },
                registration(){
                    
                    axios.post('/marcahnt-registration-store', this.form).then(res => {
					let r = res.data;
					alert('registration submited successfully');
					

				    });
                }



		    
        }
	})
</script>
</body>
</html>