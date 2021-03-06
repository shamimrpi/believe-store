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

   public function dashboard(){
      
      
        $data['title'] = "Dashboard";
        $data['martchant_content'] = $this->load->view('Marchant/dashboard/index',$data,true);
        $this->load->view('Marchant/marchant_master', $data);
   }
   public function getData(){
      $id = $this->session->userdata('marchant_id');
      $complete = $this->db->query("SELECT sm.Marchant_id,sm.Status 
      FROM  tbl_salesmaster as sm where sm.Status = 'com' and sm.Marchant_id = $id ")->num_rows();
      // $count = count($complete);
      // print($complete);
      $data['complete'] = $complete;
   }
   
  
    

}
