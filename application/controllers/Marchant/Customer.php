<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Customer extends CI_Controller
{

   public function __construct() {
      parent::__construct();
      $access = $this->session->userdata('marchant_id');
       if($access == '' ){
        redirect("user-login");
      }
     
  }

  public function getCustomers(){
    $data = json_decode($this->input->raw_input_stream);

    $customers = $this->db->query("
        select
            c.*,
            d.District_Name,
            concat_ws(' - ', c.Customer_Code, c.Customer_Name, c.owner_name, c.Customer_Mobile) as display_name
        from tbl_customer c
        left join tbl_district d on d.District_SlNo = c.area_ID
        where c.status = 'a'
        and c.Customer_Type != 'G'
        order by c.Customer_SlNo desc
    ", $this->session->userdata('marchant_id'))->result();
    echo json_encode($customers);
    }

    

}
