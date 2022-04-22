<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class ProductController extends CI_Controller
{

    public function __construct() {
        parent::__construct();
        $access = $this->session->userdata('marchant_id');
         if($access == '' ){
            redirect("user-login");
        }
       
    }

    public function getCategories(){
        $categories = $this->db->query("select * from tbl_productcategory where status = 'a'")->result();
        echo json_encode($categories);
    }
    public function getProductCategory($id){
        $data =  $this->db->query("SELECT * FROM `tbl_product` WHERE ProductCategory_ID = '$id' ")->result();
        
          echo json_encode($data);
       
      }

   

}