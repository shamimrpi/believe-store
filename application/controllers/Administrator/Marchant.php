<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Marchant extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->brunch = $this->session->userdata('BRANCHid');
        $access = $this->session->userdata('userId');
         if($access == '' ){
            redirect("Login");
        }
        $this->load->model("Model_myclass", "mmc", TRUE);
        $this->load->model('Model_table', "mt", TRUE);
		$this->load->model('Billing_model');
    }

    public function addMarchant(){
        $data['title'] = 'Create Marchant';
        $data['content'] = $this->load->view('Administrator/add_marchant', $data, TRUE);
        $this->load->view('Administrator/index', $data);
    }

    public function getMarchantWholeseller(){
        $data = $this->db->query("
        select
        mw.id,
        mw.name,
        mw.mobile,
        mw.page_name,
        mw.status,
        mw.nid,
        mw.address,
        mw.owner_image,
        mw.nid_image
        from tbl_marchant_wholesaler as mw where mw.status = 'a' ORDER BY id DESC
        ")->result();
        echo json_encode($data);
    }

    public function MarchantStore(){
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
                'status'        => 'a'
    
            );
            $this->db->where('id',$form->id);
            $this->db->update('tbl_marchant_wholesaler', $data);
            echo json_encode('update');
        }else{
            $customer = array(
                'Customer_Code'  => $this->mt->generateCustomerCode(),
                'Customer_Name'  => $form->name,
                'Customer_Type'  => $form->type,
                'Customer_Mobile' => $form->mobile,
    
            );
            $this->db->insert('tbl_customer', $customer);
            $customerId = $this->db->insert_id();
            if (isset($_FILES)) {
                $this->load->library('upload');
                $config['upload_path'] = './uploads/wholeseller/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg';
                $config['max_size'] = '1000';
                $config['image_width'] = '1000';
                $config['image_height'] = '1000';
                $this->upload->initialize($config);
    
                $_FILES['image']['name']     = $_FILES['id_image']['name'];
                $_FILES['image']['type']     = $_FILES['id_image']['type'];
                $_FILES['image']['tmp_name'] = $_FILES['id_image']['tmp_name'];
                $_FILES['image']['error']     = $_FILES['id_image']['error'];
                $_FILES['image']['size']     = $_FILES['id_image']['size'];
    
                $this->load->library('upload', $config);
                $this->upload->do_upload('image');
                $voter_image = $this->upload->data();
    
                $_FILES['file']['name']     = $_FILES['owner_image']['name'];
                $_FILES['file']['type']     = $_FILES['owner_image']['type'];
                $_FILES['file']['tmp_name'] = $_FILES['owner_image']['tmp_name'];
                $_FILES['file']['error']     = $_FILES['owner_image']['error'];
                $_FILES['file']['size']     = $_FILES['owner_image']['size'];
    
    
                $this->load->library('upload', $config);
                $this->upload->do_upload('file');
                $owner_image = $this->upload->data();
            }
    
            $data = array(
                'name'          => $form->name,
                'customer_type' => $form->type,
                'mobile'        => $form->mobile,
                'username'      => $form->mobile,
                'page_name'     => $form->page_name,
                'nid'           => $form->voter_id,
                'password'      => md5(123456),
                'address'       => $form->address,
                'nid_image'     => $voter_image['file_name'],
                'owner_image'   => $owner_image['file_name'],
                'customer_id'   => $customerId,
                'status'        => 'a'
    
            );
            $this->db->insert('tbl_marchant_wholesaler', $data);
            echo json_encode('save');
        }
             
    }


    public function marchantDelete($id){
            $data =array(
                'status'  => 'd'
            );
            $this->db->where('id',$id);
            $this->db->update('tbl_marchant_wholesaler', $data);
    }

    public function approvePage(){
        $data['title'] = 'Marchant List';
        $data['content'] = $this->load->view('Administrator/marchant_list', $data, TRUE);
        $this->load->view('Administrator/index', $data);
    }

    public function getAllMarchant(){
        $data = $this->db->query("
        select
        mw.id,
        mw.name,
        mw.mobile,
        mw.page_name,
        mw.status,
        mw.nid,
        mw.address,
        mw.owner_image,
        mw.nid_image
        from tbl_marchant_wholesaler as mw ORDER BY id DESC
        ")->result();
        echo json_encode($data);
    }
    public function approve($id){
        $marchant = $this->db->query("select mw.status from tbl_marchant_wholesaler as mw where id = $id")->row();
        $status = $marchant->status;
        if($status == 'a'){
            $status = 'd';
        }
        else{
            $status = 'a';
        }
        $data =array(
            'status'  => $status
        );
        $this->db->where('id',$id);
        $this->db->update('tbl_marchant_wholesaler', $data);
    }
}