<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Product extends CI_Controller{
    public function __construct() {
        parent::__construct();
        $this->brunch = $this->session->userdata('BRANCHid');
        $access = $this->session->userdata('userId');
         if($access == '' ){
            redirect("user-login");
        }
        $this->load->model('Model_table', "mt", TRUE); 
    }
    public function getProductStock(){
        $inputs = json_decode($this->input->raw_input_stream);
        $stock = $this->mt->productStock($inputs->productId);
        echo $stock;
    }
}