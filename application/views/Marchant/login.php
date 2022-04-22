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
        width: 325px;
        box-shadow: 0 0 15px #000;
       }
       .user-icon{
           font-size: 70px;
       }
    </style>
</head>
<body>
    <div class="container login-form">
        <div class="card" >
            <div class="card-header">
                <h5 class="text-center">Login Form</h5>
            </div>
            <div class="card-body ">
                <div class="user-img text-center">
                    <i class="fa-solid fa-user user-icon"></i>
                </div>
                <form action="<?php echo base_url();?>customer-check" method="post">
                <p style="color:red;"><?php if(isset($message)){ echo $message; } ?></p>
                    <div class="form-group">
                        <label for="">Mobile</label>
                        <input type="text" class="form-control mt-1" name="mobile" placeholder="Mobile Number">
                    </div>
                    <div class="form-group">
                        <label for="">Password</label>
                        <input type="password" class="form-control mt-1" name="password" placeholder="Password">
                    </div>
                    <div class="form-group mt-3">
                        <input type="submit" class="form-control btn btn-success" name="" value="Login">
                    </div>
                    <div>
                        <p>You have no account please Register as <a href="<?php echo base_url();?>marchant-registration">Marchant </a> Or <a href="<?php echo base_url();?>wholeseller-registration">Wholeseller</a> </p>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="<?php echo base_url(); ?>assets/marchant/js/jquery.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/marchant/js/bootstrap.bundle.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/marchant/js/all.min.js"></script>
    
</body>
</html>