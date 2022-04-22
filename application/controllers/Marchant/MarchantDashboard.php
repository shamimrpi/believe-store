<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class MarchantDashboard extends CI_Controller
{

   public function __construct() {
      parent::__construct();
      $access = $this->session->userdata('marchant_id');
       if($access == '' ){
         redirect("user-login");
      }
      $this->load->model('Model_table', "m_invoice", TRUE);
     
  }

   // public function dashboard(){
   //      $data['invoice'] = $this->m_invoice->marchantInvoice();
   //      $data['title'] = "Dashboard";
   //      $data['martchant_content'] = $this->load->view('Marchant/dashboard/marchant_dashboard',$data,true);
   //      $this->load->view('Marchant/marchant_master', $data);
   // }
   
   public function profileUpdate(){
      

   }
    

}
