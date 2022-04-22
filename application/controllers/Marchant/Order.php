<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Order extends CI_Controller
{

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
 

    public function order(){
        $data['invoice'] = $this->m_invoice->marchantInvoice();
        $data['title'] = "Dashboard";
        $data['martchant_content'] = $this->load->view('Marchant/order/index',$data,true);
        $this->load->view('Marchant/marchant_master', $data);
   }

    public function store(){

              $carts = json_decode($this->input->post('cart'));
              $customer = json_decode($this->input->post('customer'));
              $purchase = json_decode($this->input->post('purchase'));
              $total = json_decode($this->input->post('total'));
              
           
  
            $invoice = $purchase->invoiceNo ?? '';
            $invoiceCount = $this->db->query("select * from tbl_salesmaster where SaleMaster_InvoiceNo = ?", $invoice)->num_rows();
            if ($invoiceCount != 0) {
                $invoice = $this->mt->generateSalesInvoice2();
            }

            $customerId = $customer->Customer_SlNo;
          
            
          $sales = array(
            'SaleMaster_InvoiceNo'           => $invoice,
            'SalseCustomer_IDNo'             => $customerId,
            'SaleMaster_TotalSaleAmount'     => $total,
            'SaleMaster_DueAmount'           => $purchase->due,
            'SaleMaster_Description'         => $purchase->note,
            'Status'                         => 'a',
            "AddBy"                          => $this->session->userdata("marchant_id"),
            'AddTime'                        => date("Y-m-d H:i:s"),
            'SaleMaster_branchid'            => 0,
            'payment_type'                   => 'advance',
            'SaleMaster_Advance'             => $purchase->advnace,
            'Status '                        =>'p'
        );
       
        $this->db->insert('tbl_salesmaster', $sales);

        $salesId = $this->db->insert_id();


              foreach($carts as $key=>$cart){
               
                $saleDetails = [
                        'SaleMaster_IDNo' => $salesId,
                        'SalseCustomer_IDNo' => $customerId,
                        'Product_IDNo' => $cart->product_serialNo,
                        'SaleDetails_TotalQuantity' => '1',
                        'Purchase_Rate' => $cart->purchase_price,
                        'SaleDetails_TotalAmount' =>$total,
                        'Status' => 'p',
                        'AddBy' => $this->session->userdata("marchant_id"),
                        'AddTime' => date('Y-m-d H:i:s'),
                        'SaleDetails_BranchId' => '0',
                    ];
                    $this->db->insert('tbl_saledetails', $saleDetails);
                    $SaleDetails_SlNo = $this->db->insert_id();

                   
                          //update stock
                $this->db->query("
                update tbl_currentinventory 
                set sales_quantity = sales_quantity + ? 
                where product_id = ?
                and branch_id = ?
            ", [$cart->quantity, $cart->product_serialNo, $this->session->userdata('BRANCHid')]);
            
                if (!empty($_FILES)) {
                    if (isset($_FILES[$key]) || array_key_exists($key, $_FILES)){
                        $image = $invoice.')'.$cart->Product_Name;
                        $dataInfo = array();
                       $count = count($_FILES[$key]['tmp_name']);
                       $dataInfo = array();
                              $this->load->library('upload');
                              $config['upload_path'] = './uploads/productImage/';
                              $config['allowed_types'] = 'gif|jpg|png|jpeg';
                              $config['max_size'] = '10000';
                              $config['image_width']= '4000';
                              $config['image_height']= '4000';
                              $config['file_name']= $image;
                              $this->upload->initialize($config);
                        
                       for($i = 0; $i < $count; $i++){ 
                           $_FILES['image']['name']     = $_FILES[$key]['name'][$i]; 
                           $_FILES['image']['type']     = $_FILES[$key]['type'][$i]; 
                           $_FILES['image']['tmp_name'] = $_FILES[$key]['tmp_name'][$i]; 
                           $_FILES['image']['error']     = $_FILES[$key]['error'][$i]; 
                           $_FILES['image']['size']     = $_FILES[$key]['size'][$i]; 
                           
                           $this->load->library('upload', $config);
                           $this->upload->do_upload('image');
                           $dataInfo[] = $this->upload->data();

                           
                         }
                         foreach ($dataInfo as $image) {
                            $this->db->insert('tbl_product_images', [
                                'image' => $image['file_name'],
                                'SaleDetails_SlNo' => $SaleDetails_SlNo
                            ]);
                          
                            
                        }
                    }
                   
                  
                 }

           
        }
    }

    public function pendingOrder(){

        $data['title'] = "Hold order";
        $data['martchant_content'] = $this->load->view('Marchant/order/pending',$data,true);
        $this->load->view('Marchant/marchant_master', $data);
    }

    public function getPendingOrder(){
        $id = $this->session->userdata('marchant_id');
        $data=  $this->db->query("select * from tbl_salesmaster where Status = 'p' and AddBy = $id ")->result();
       
       echo json_encode($data);
    }

    public function ProcessingOrder(){
        $data['title'] = "Order Processing";
        $data['martchant_content'] = $this->load->view('Marchant/order/process',$data,true);
        $this->load->view('Marchant/marchant_master', $data);
    }

    public function getProcessingOrder(){
        $id = $this->session->userdata('marchant_id');
        $data=  $this->db->query("select * from tbl_salesmaster where Status = 'pro' and AddBy = $id ")->result();
        echo json_encode($data);
    }

    public function completeOrder(){
        $data['title'] = "Order Processing";
        $data['martchant_content'] = $this->load->view('Marchant/order/complete',$data,true);
        $this->load->view('Marchant/marchant_master', $data);
    }

    public function getCompleteOrder(){
        $id = $this->session->userdata('marchant_id');
        $data=  $this->db->query("select * from tbl_salesmaster where Status = 'com' and AddBy = $id ")->result();
        echo json_encode($data);
    }

    public function cancelOrder(){
        $data['title'] = "Order Cancel";
        $data['martchant_content'] = $this->load->view('Marchant/order/cancel',$data,true);
        $this->load->view('Marchant/marchant_master', $data);
    }

    public function getCancelOrder(){
        $id = $this->session->userdata('marchant_id');
        $data=  $this->db->query("select * from tbl_salesmaster where Status = 'can' and AddBy = $id ")->result();
        echo json_encode($data);
    }
    public function getOrderDetails($id){
        $marchant_id = $this->session->userdata('marchant_id');
            $data['order_details']=  $this->db->query("
            select sd.SaleMaster_IDNo,p.Product_Name as P_name,sd.* from tbl_saledetails as sd
            left join tbl_product as p on p.Product_SlNo = Product_IDNo
            where   sd.SaleMaster_IDNo = $id
        ")->result();
        $data['title'] = "Order Details";
        $data['martchant_content'] = $this->load->view('Marchant/order/details',$data,true);
        $this->load->view('Marchant/marchant_master', $data);
    }
            

   

}