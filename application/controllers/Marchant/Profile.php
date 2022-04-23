<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Profile extends CI_Controller{
    public function __construct() {
        parent::__construct();
        $access = $this->session->userdata('marchant_id');
         if($access == '' ){
            redirect("user-login");
        }
        $this->load->model("Model_myclass", "mmc", TRUE);
		$this->load->model('Model_table', "mt", TRUE);
        $this->load->model('Model_table', "m_invoice", TRUE);
    }

    public function passwordChange(){
        $data['title'] = "Dashboard";
        $data['martchant_content'] = $this->load->view('Marchant/passwordChange',$data,true);
        $this->load->view('Marchant/marchant_master', $data);
    }

    public function passwordUpdate(){
        $data = json_decode($this->input->raw_input_stream);
        $password = $data->password;
        
        $updateData = array( 
            'password'      => md5($password) , 
        );
        
        $this->db->where('id',$this->session->userdata('marchant_id') );
        $this->db->update('tbl_marchant_wholesaler', $updateData);
        echo json_encode('save');
    }

    public function profile(){
        $data['title'] = "Profile";
        $data['martchant_content'] = $this->load->view('Marchant/profile',$data,true);
        $this->load->view('Marchant/marchant_master', $data);
    }
    public function getProfileData($id){
       $data= $this->db->query("SELECT * FROM `tbl_marchant_wholesaler` WHERE id = $id")->row();
        echo json_encode($data);
    }

    public function profileUpdate(){
        $form = json_decode($this->input->post('form'));
        if($form->id != ''){
            if (isset($_FILES)) {
                $this->load->library('upload');
                $config['upload_path'] = './uploads/wholeseller/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg';
                $config['max_size'] = '1000';
                $config['image_width'] = '1000';
                $config['image_height'] = '1000';
                $this->upload->initialize($config);
                
                $data = $this->db->query("select mw.nid_image,owner_image from tbl_marchant_wholesaler as mw where id = $form->id")->row();
                if(!empty($_FILES['owner_image'])){
                    $_FILES['file']['name']     = $_FILES['owner_image']['name'];
                    $_FILES['file']['type']     = $_FILES['owner_image']['type'];
                    $_FILES['file']['tmp_name'] = $_FILES['owner_image']['tmp_name'];
                    $_FILES['file']['error']     = $_FILES['owner_image']['error'];
                    $_FILES['file']['size']     = $_FILES['owner_image']['size'];
                    
                    $this->load->library('upload', $config);
                    $this->upload->do_upload('file');
                    $owner_image = $this->upload->data();
                    unlink('uploads/wholeseller/'.$data->owner_image);
                }else{
                    $owner_image['file_name'] = $data->owner_image;
                }
                if(!empty($_FILES['id_image'])){
                    $_FILES['image']['name']     = $_FILES['id_image']['name'];
                    $_FILES['image']['type']     = $_FILES['id_image']['type'];
                    $_FILES['image']['tmp_name'] = $_FILES['id_image']['tmp_name'];
                    $_FILES['image']['error']    = $_FILES['id_image']['error'];
                    $_FILES['image']['size']     = $_FILES['id_image']['size'];
    
                    $this->load->library('upload', $config);
                    $this->upload->do_upload('image');
                    $voter_image = $this->upload->data();
                    unlink('uploads/wholeseller/'.$data->owner_image);
                }else{
                    $voter_image['file_name'] = $data->nid_image;
                }
               
               
            }
    
            $data = array(
                'name'          => $form->name,
                'customer_type' => $form->type,
                'mobile'        => $form->mobile,
                'username'      => $form->mobile,
                'page_name'     => $form->page_name,
                'nid'           => $form->voter_id,
                'address'       => $form->address,
                'nid_image'     => $voter_image['file_name'],
                'owner_image'   => $owner_image['file_name'],
    
            );
            $this->db->where('id',$form->id);
            $this->db->update('tbl_marchant_wholesaler', $data);
            echo json_encode('update');
        
    }
}
    public function wholeseller(){
        $martchant_id = $this->session->userdata('marchant_id');
        $marchant_data = $this->db->query("select * from tbl_marchant_wholesaler where customer_type = 'wholeseller' and id = $martchant_id ")->row();
        $customer_id = $marchant_data->customer_id;
        $data = $this->db->query("select * from tbl_customer where Customer_SlNo = $customer_id  ")->row();
      
        echo json_encode($data);
        
        
    }
  
}