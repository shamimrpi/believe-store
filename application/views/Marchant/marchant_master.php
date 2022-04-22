<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Product Order </title>
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/marchant/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/marchant/css/vue-select.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/marchant/css/style.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/marchant/css/responsive.css">
    
    
</head>
<body>
<nav class="d-flex main-nav">
    <a href="#" class="company-name"> Believe Store BD </a>
<div class="menu-hide-open my-auto mx-3">
        <a href="#"><i class="fa-solid fa-bars-staggered bar-icon"></i></a>
</div>
<div class="ms-auto date-time d-flex">
   <span class="clock "><i class="fas fa-clock "></i></span><span id="date"></span> <span id="timer" class=""></span>
</div>

<div class="user-logo  position-relative " onclick='profile()'>
    <img src="<?php echo base_url(); ?>uploads/wholeseller/<?php echo $this->session->userdata('owner_image'); ?>" alt="Avatar Logo" style="width:40px;" class="rounded-pill"> 
    <ul class="header-right-toggle position-absolute">
        <p class="text-white toggle-username"><?php echo $this->session->userdata('marchant_username'); ?></p>
        <!-- <li><a href="#"><i class="fas fa-user me-1"></i> Profile</a></li> -->
        <li><a href="<?php echo base_url();?>password-change"><i class="fas fa-wrench me-1"></i> Changer Password</a></li>
        <li><a href="<?php echo base_url();?>customer-logout" onclick="return confirm('Are you sure! Logout from dashboard.')"><i class="fas fa-sign-out-alt text-warning me-1"></i> Logout</a></li>
    </ul>
</div>
</nav>
    <div class="main">
    <div class="left-sidebar">
   
   <nav class="sidebar custom-sidebar py-2 mb-4">
       <ul class="nav flex-column" id="nav_accordion">
           <li class="nav-item li-item">
               <a class="nav-link a-link  " href="<?php echo base_url();?>dashboard"><i class="fas fa-tachometer-alt-average icon"></i> Dashboard </a>
           </li>
           <li class="nav-item li-item">
               <a class="nav-link a-link" href="<?php echo base_url();?>order-create"><i class="fa-solid fa-note-sticky  icon"></i>Order Create </a>
           </li>
           <li class="nav-item li-item">
               <a class="nav-link a-link" href="<?php echo base_url();?>complete-order"><i class="fa-solid fa-square-check icon"></i> Number of Complete </a>
           </li>
           <li class="nav-item li-item">
               <a class="nav-link a-link" href="<?php echo base_url();?>processing-order"><i class="fa-brands fa-accessible-icon icon"></i> Number of Processing </a>
           </li>
           <li class="nav-item li-item">
               <a class="nav-link a-link" href="<?php echo base_url();?>hold-order"><i class="fa-solid fa-hand-holding icon"></i> Number of Hold </a>
           </li>
           <li class="nav-item li-item">
               <a class="nav-link a-link" href="<?php echo base_url();?>cancel-order"><i class="fa-solid fa-ban icon"></i> Number of Cancel </a>
           </li>
         
          
           <li class="nav-item li-item has-submenu">
               <a class="nav-link a-link d-flex " href="#"><i class="fa-solid fa-screwdriver-wrench icon my-auto"></i><span class="my-auto"> Settings</span> <i class="fa-solid fa-angle-down down-icon my-auto ms-auto"></i>  </a> 
               <ul class="submenu collapse ">
                   <li><a class="nav-link a-link  " href="<?php echo base_url();?>password-change"> <i class="fa-brands fa-first-order icon"></i> Password Change</a></li>
                   <li><a class="nav-link a-link  " href="<?php echo base_url();?>user-profile"> <i class="fa-brands fa-first-order icon"></i> Profile Update</a></li>
               </ul>
           </li>
           <li class="nav-item li-item">
               <a class="nav-link a-link" href="<?php echo base_url();?>customer-logout" onclick="return confirm('Are you sure! Logout from dashboard.')"><i class="fa-solid fa-right-from-bracket icon"></i> logout </a>
           </li>
       </ul>
       </nav>
</div>

        <div class="main-section mt-3">
            <div class="container custom-container">
                <?php echo $martchant_content; ?>
            </div>
        </div>
    </div>

    <script src="<?php echo base_url(); ?>assets/marchant/js/jquery.min.js"></script>
    <!-- <script src="<?php echo base_url(); ?>assets/marchant/js/vue-select.js"></script> -->
    <script src="<?php echo base_url(); ?>assets/marchant/js/bootstrap.bundle.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/marchant/js/all.min.js"></script>
  
    <script>
       function profile(){
           $('.header-right-toggle').toggle('fast');
       }
    </script>
    <script type="text/javascript">

        setInterval(function() {

            var currentTime = new Date ( );    

            var currentHours = currentTime.getHours ( );   

            var currentMinutes = currentTime.getMinutes ( );   

            var currentSeconds = currentTime.getSeconds ( );

            currentMinutes = ( currentMinutes < 10 ? "0" : "" ) + currentMinutes;   

            currentSeconds = ( currentSeconds < 10 ? "0" : "" ) + currentSeconds;    

            var timeOfDay = ( currentHours < 12 ) ? "AM" : "PM";    

            currentHours = ( currentHours > 12 ) ? currentHours - 12 : currentHours;    

            currentHours = ( currentHours == 0 ) ? 12 : currentHours;    

            var currentTimeString = currentHours + ":" + currentMinutes + ":" + currentSeconds + " " + timeOfDay;

            document.getElementById("timer").innerHTML = currentTimeString;

        }, 1000);

    </script>
    <script>
        var dateObj = new Date();
        const months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
        const days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
        let dayName = days[dateObj.getDay()];
        let month = months[dateObj.getMonth()];
        var day = dateObj.getUTCDate();
        var year = dateObj.getUTCFullYear();

        newdate = dayName + ", "+ day + " " + month + " " + year;

        document.getElementById("date").innerHTML = newdate;
    </script>
    <script>
       document.addEventListener("DOMContentLoaded", function(){
  document.querySelectorAll('.sidebar .nav-link').forEach(function(element){
    
    element.addEventListener('click', function (e) {

      let nextEl = element.nextElementSibling;
      let parentEl  = element.parentElement;	

        if(nextEl) {
            e.preventDefault();	
            let mycollapse = new bootstrap.Collapse(nextEl);
            
            if(nextEl.classList.contains('show')){
              mycollapse.hide();
            } else {
                mycollapse.show();
                // find other submenus with class=show
                var opened_submenu = parentEl.parentElement.querySelector('.submenu.show');
                // if it exists, then close all of them
                if(opened_submenu){
                  new bootstrap.Collapse(opened_submenu);
                }
            }
        }
    }); // addEventListener
  }) // forEach
}); 
// DOMContentLoaded  end
    </script>

    <script>
        $(document).on('click','.bar-icon',function(){
            if ($(window).width() < 767) {
                $('.left-sidebar').toggle();
                $('.main-section').css('padding-left','0');
            }

           
        })
    </script>
</body>
</html>