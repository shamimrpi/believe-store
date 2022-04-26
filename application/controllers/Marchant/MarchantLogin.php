<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class MarchantLogin extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model("model_myclass", "mmc", TRUE);
        $this->load->model('model_table', "mt", TRUE);
        $this->load->helper('JWT');
        $this->load->helper('my_helper');
        $this->load->library('session');
    }

    public function login()
    {

        $this->load->view('Marchant/login');
    }
    public function generateCustomerCode()
    {
        $customerCode = "C00001";

        $lastCustomer = $this->db->query("select * from tbl_customer order by Customer_SlNo desc limit 1");
        if ($lastCustomer->num_rows() != 0) {
            $newCustomerId = $lastCustomer->row()->Customer_SlNo + 1;
            $zeros = array('0', '00', '000', '0000');
            $customerCode = 'C' . (strlen($newCustomerId) > count($zeros) ? $newCustomerId : $zeros[count($zeros) - strlen($newCustomerId)] . $newCustomerId);
        }

        return $customerCode;
    }

    public function loginCheck()
    {
        $mobile = $this->input->post('mobile');
        $pass = md5($this->input->post('password'));
        $query = $this->db->query("SELECT
        m.id,
        m.name,
        m.mobile,
        m.email,
        m.username, 
        m.page_name,
        m.address,
        m.nid,
        m.nid_image,
        m.customer_type,
        m.owner_image,
        m.status AS m_status
        FROM tbl_marchant_wholesaler AS m
        where m.status = 'a' 
        and m.mobile = ? 
        AND m.password = ?", [$mobile, $pass]);

        $data = $query->row();


        if (isset($data)) {
            if ($data->m_status == 'a') {
                $s_data['marchant_id'] = $data->id;
                $s_data['marchant_name'] = $data->name;
                $s_data['marchant_username'] = $data->username;
                $s_data['marchant_address'] = $data->address;
                $s_data['marchant_mobile'] = $data->mobile;
                $s_data['marchant_page_name'] = $data->page_name;
                $s_data['marchant_nid'] = $data->nid;
                $s_data['owner_image'] =  $data->owner_image;
                $s_data['nid_image'] =  $data->nid_image;
                $s_data['customer_type'] =  $data->customer_type;
                $s_data['customer_id'] =  $data->customer_id;
                $this->session->set_userdata($s_data);
                redirect("dashboard");
            } else {
                $data['message'] = "Sorry your are deactivated";
                $this->load->view('Marchant/login', $data);
            }
        } else {
            $data['message'] = "Invalid User name or Password";
            $this->load->view('Marchant/login', $data);
        }
    }

    public function logout()
    {
        $this->session->unset_userdata('marchant_id');
        $this->session->unset_userdata('marchant_name');
        $this->session->unset_userdata('marchant_username');
        $this->session->unset_userdata('customer_type');
        $this->session->unset_userdata('customer_id');
        redirect("user-login");
    }

    public function registraion()
    {
        $data['message'] = "Invalid User name or Password";
        $this->load->view('Marchant/registration', $data);
    }

    public function registraionStore()
    {
        $inputs = json_decode($this->input->raw_input_stream);

        $customer = array(
            'Customer_Code'  => $this->mt->generateCustomerCode(),
            'Customer_Name'  => $inputs->name,
            'Customer_Type'  => 'marchant',
            'Customer_Mobile' => $inputs->mobile,

        );
        $this->db->insert('tbl_customer', $customer);
        $customerId = $this->db->insert_id();

        $data = array(
            'name'          => $inputs->name,
            'customer_type' => 'marchant',
            'mobile'        => $inputs->mobile,
            'username'      => $inputs->mobile,
            'password'      => md5($inputs->password),
            'address'       => $inputs->address,
            'page_name'     => $inputs->page_name,
            'customer_id'   => $customerId,

        );
        $this->db->insert('tbl_marchant_wholesaler', $data);
        echo json_encode('save');
    }
    public function wholeRegistraion()
    {
        $this->load->view('Marchant/whole_registration');
    }
    public function wholeRegistraionStore()
    {

        $form = json_decode($this->input->post('form'));
       
        $customer = array(
            'Customer_Code'  => $this->mt->generateCustomerCode(),
            'Customer_Name'  => $form->name,
            'Customer_Type'  => 'wholeseller',
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

            $_FILES['file']['name']     = $_FILES['owner_iamge']['name'];
            $_FILES['file']['type']     = $_FILES['owner_iamge']['type'];
            $_FILES['file']['tmp_name'] = $_FILES['owner_iamge']['tmp_name'];
            $_FILES['file']['error']     = $_FILES['owner_iamge']['error'];
            $_FILES['file']['size']     = $_FILES['owner_iamge']['size'];


            $this->load->library('upload', $config);
            $this->upload->do_upload('file');
            $owner_image = $this->upload->data();
        }

        $data = array(
            'name'          => $form->name,
            'customer_type' => 'wholeseller',
            'mobile'        => $form->mobile,
            'username'      => $form->mobile,
            'nid'           => $form->voter_id,
            'password'      => md5($form->password),
            'address'       => $form->address,
            'nid_image'     => $voter_image['file_name'],
            'owner_image'   => $owner_image['file_name'],
            'customer_id'   => $customerId,

        );
        $this->db->insert('tbl_marchant_wholesaler', $data);
        echo json_encode('save');
    }

    public function numberCheck()
    {
        $inputs = json_decode($this->input->raw_input_stream);
        $number = $this->db->query("select m.mobile from tbl_marchant_wholesaler as m where m.mobile = $inputs->mobile ")->result();
        if ($number != NULL) {
            echo json_encode($inputs->mobile);
        } else {
            echo json_encode('no match');
        }
    }

    
}
