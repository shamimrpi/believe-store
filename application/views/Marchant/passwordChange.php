<style>
   .passwordChangeForm{
       border: 1px solid #ddd;
       padding: 20px;
       height: auto;
   }
</style>

<div id="pendingOrder">

    <div class="row justify-content-center my-5">
            <h5 class="text-center">Password Change</h5>
        <div class="col-md-5">
            <div class="passwordChangeForm">
                <form v-on:submit.prevent="passwordSave">
                    <div class="form-group">
                        <label for="">New Password</label>
                        <input type="password" v-model="form.password" v-on:input="passwordMatch" class="form-control" placeholder="New Password">
                    </div>
                    <div class="form-group">
                        <label for="">Retype Password</label>
                        <input type="password" v-model="form.retype_password" v-on:input="passwordMatch" class="form-control" placeholder="Retype Password">
                        <div id="error"></div>
                    </div>
                    <div class="d-flex">
                        <button type="submit" class="btn ms-auto mt-3 btn-success btn-sm" id="submit">Update</button>
                    </div>
                   
                </form>
            </div>
         
           
        </div>
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
            form:{
                password:'',
                retype_password:''
            },
            page: 1,
            per_page: 1,
            filter: '',
        }),

        created() {
            
        },
        methods: {
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
                passwordSave(){
                    axios.post('/password-update', this.form).then(res => {
                        let r = res.data;
                        alert('Password changed successfully');

                    })
                }
        }
    })
</script>