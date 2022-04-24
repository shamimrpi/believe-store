<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Order extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $access = $this->session->userdata('marchant_id');
        if ($access == '') {
            redirect("user-login");
        }
        $this->load->model("Model_myclass", "mmc", TRUE);
        $this->load->model('Model_table', "mt", TRUE);
        $this->load->model('Model_table', "m_invoice", TRUE);
    }


    public function order()
    {
        $martchant_id = $this->session->userdata('marchant_id');
        $marchant_data = $this->db->query("select * from tbl_marchant_wholesaler where id = $martchant_id ")->row();
        // print_r($marchant_data);
        // exit;
        $customer_id = $marchant_data->customer_id;
        $customer = $this->db->query("select * from tbl_customer where Customer_SlNo = $customer_id  ")->row();
        $data['customer'] = $customer;
        $data['invoice'] = $this->m_invoice->marchantInvoice();
        
        $data['title'] = "Dashboard";
        // print_r($data);
        // exit;
        $data['martchant_content'] = $this->load->view('Marchant/order/index', $data, true);
        $this->load->view('Marchant/marchant_master', $data);
    }

    public function store()
    {

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
            "Marchant_id"                     => $this->session->userdata("marchant_id"),
            'AddTime'                        => date("Y-m-d H:i:s"),
            'SaleMaster_branchid'            => 0,
            'payment_type'                   => 'advance',
            'SaleMaster_Advance'             => $purchase->advnace,
            'Status '                        => 'p'
        );

        $this->db->insert('tbl_salesmaster', $sales);

        $salesId = $this->db->insert_id();


        foreach ($carts as $key => $cart) {
            $exist = $this->db->query("select * from tbl_saledetails where SaleMaster_IDNo = $salesId and Product_IDNo =$cart->product_serialNo  ")->row();
            if ($exist != NULL) {
                $saleDetails = array(
                    'SaleMaster_IDNo' => $salesId,
                    'Product_IDNo' => $exist->product_serialNo,
                    'SaleDetails_TotalQuantity' => $exist->quantity,
                    'Purchase_Rate' => $exist->purchase_price,
                    'SaleDetails_Rate' => $exist->selling_price,
                    'SaleDetails_TotalAmount' => $exist->purchase_price,
                    'Status' => 'a',
                    'AddBy' => $this->session->userdata("FullName"),
                    'AddTime' => date('Y-m-d H:i:s'),
                );
                $this->db->where('SaleMaster_IDNo', $salesId);
                $this->db->update('tbl_saledetails', $exist);
            } else {
               
                $saleDetails = [
                    'SaleMaster_IDNo' => $salesId,
                    'SalseCustomer_IDNo' =>$customerId,
                    'Product_IDNo' => $cart->product_serialNo,
                    'SaleDetails_TotalQuantity' => '1',
                    'Purchase_Rate' => $cart->purchase_price,
                    'SaleDetails_Rate' => $cart->selling_price,
                    'SaleDetails_TotalAmount' => $total,
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
                    and branch_id = ? ",
                     [$cart->quantity, $cart->product_serialNo, $this->session->userdata('BRANCHid')]);

                if (!empty($_FILES)) {
                    if (isset($_FILES[$key]) || array_key_exists($key, $_FILES)) {
                        $image = $invoice . ')' . $cart->Product_Name;
                        $dataInfo = array();
                        $count = count($_FILES[$key]['tmp_name']);
                        $dataInfo = array();
                        $this->load->library('upload');
                        $config['upload_path'] = './uploads/productImage/';
                        $config['allowed_types'] = 'gif|jpg|png|jpeg';
                        $config['max_size'] = '10000';
                        $config['image_width'] = '4000';
                        $config['image_height'] = '4000';
                        $config['file_name'] = $image;
                        $this->upload->initialize($config);

                        for ($i = 0; $i < $count; $i++) {
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
    }

    public function orderUpdate(){
      
                $carts = json_decode($this->input->post('new_cart'));
                $customer = json_decode($this->input->post('customer'));
                $purchase = json_decode($this->input->post('purchase'));
                $total = json_decode($this->input->post('total'));
                $remove_id = json_decode($this->input->post('remove_id'));
                


                $sales = array(
                'SaleMaster_TotalSaleAmount'     => $purchase->total,
                'SaleMaster_SubTotalAmount'      => $purchase->subTotal,
                'SaleMaster_Description'         => $purchase->note,
                'AddTime'                        => date("Y-m-d H:i:s"),
                'SaleMaster_branchid'            => 0,
                "UpdateBy" => $this->session->userdata("FullName"),
                'UpdateTime' => date("Y-m-d H:i:s"),
                'payment_type'                   => 'advance',
                "Marchant_id"                     => $this->session->userdata("marchant_id"),
                "SaleMaster_TotalSaleAmount"                     => $total,
            );
           
            $this->db->where('SaleMaster_SlNo', $purchase->salesId);
            $this->db->update('tbl_salesmaster', $sales);

            foreach($remove_id as $delete_id){
                $this->db->query("delete from tbl_saledetails where SaleDetails_SlNo = ?", $delete_id); 
                $images = $this->db->query("select * from tbl_product_images where SaleDetails_SlNo =$delete_id ")->row();
                $data_image = $images->image;
                if($data_image){
                    @unlink('/uploads/productImage/'.$data_image);
                    $this->db->query("delete from tbl_product_images where SaleDetails_SlNo = ?", $delete_id); 
                }
                $this->db->query("
                    update tbl_currentinventory 
                    set sales_quantity = sales_quantity - ? 
                    where product_id = ?
                    
                ", [-1, $images->Product_IDNo ]);
            }
            
           
            foreach($carts as $key=> $cartProduct){
               
               
                    $saleDetails = array(
                        'SaleMaster_IDNo' => $purchase->salesId,
                        'Product_IDNo' => $cartProduct->product_serialNo,
                        'SaleDetails_TotalQuantity' => $cartProduct->quantity,
                        'Purchase_Rate' => $cartProduct->purchase_price,
                        'SaleDetails_Rate' => $cartProduct->selling_price,
                        'SaleDetails_TotalAmount' => $cartProduct->purchase_price,
                        'Status' => 'a',
                        'AddBy' => $this->session->userdata("FullName"),
                        'AddTime' => date('Y-m-d H:i:s'),
                    );
    
                    $this->db->insert('tbl_saledetails', $saleDetails);
                    $SaleDetails_SlNo = $this->db->insert_id();
                    
                    
                    $this->db->query("
                        update tbl_currentinventory 
                        set sales_quantity = sales_quantity + ? 
                        where product_id = ?
                        
                    ", [$cartProduct->quantity, $cartProduct->product_serialNo]);
    
                    if (!empty($_FILES)) {
                        if (isset($_FILES[$key]) || array_key_exists($key, $_FILES)){
                           
                           $dataInfo = array();
                           $count = count($_FILES[$key]['tmp_name']);
                           $image_name =  $purchase->invoiceNo .')'.$cartProduct->Product_Name;
                           $dataInfo = array();
                                  $this->load->library('upload');
                                  $config['upload_path'] = './uploads/productImage/';
                                  $config['allowed_types'] = 'gif|jpg|png|jpeg';
                                  $config['max_size'] = '10000';
                                  $config['image_width']= '4000';
                                  $config['image_height']= '4000';
                                //   $config['overwrite']= true;
                                  $config['file_name']= $image_name;
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
                             if(isset($dataInfo)){
                                foreach ($dataInfo as $image) {
                                   
                                    $this->db->insert('tbl_product_images', [
                                        'image' =>  $image['file_name'],
                                        'SaleDetails_SlNo' => $SaleDetails_SlNo
                                    ]);
                             }
                           
                              
                                
                            }
                        }
                     
                       
                      
                }

              
               
              


            }
    
            $res = ['success'=>true, 'message'=>'Sales Updated', 'salesId'=>$purchase->salesId];


        echo json_encode($res);
    }

    public function pendingOrder()
    {

        $data['title'] = "Hold order";
        $data['martchant_content'] = $this->load->view('Marchant/order/pending', $data, true);
        $this->load->view('Marchant/marchant_master', $data);
    }

    public function getPendingOrder()
    {
        $id = $this->session->userdata('marchant_id');
        $data =  $this->db->query("select * from tbl_salesmaster where Status = 'p' and Marchant_id = $id ")->result();

        echo json_encode($data);
    }

    public function ProcessingOrder()
    {
        $data['title'] = "Order Processing";
        $data['martchant_content'] = $this->load->view('Marchant/order/process', $data, true);
        $this->load->view('Marchant/marchant_master', $data);
    }

    public function getProcessingOrder()
    {
        $id = $this->session->userdata('marchant_id');
        $data =  $this->db->query("select * from tbl_salesmaster where Status = 'pro' and Marchant_id = $id ")->result();
        echo json_encode($data);
    }

    public function completeOrder()
    {
        $data['title'] = "Order Processing";
        $data['martchant_content'] = $this->load->view('Marchant/order/complete', $data, true);
        $this->load->view('Marchant/marchant_master', $data);
    }

    public function getCompleteOrder()
    {
        $id = $this->session->userdata('marchant_id');
        $data =  $this->db->query("select * from tbl_salesmaster where Status = 'com' and Marchant_id = $id ")->result();
        echo json_encode($data);
    }

    public function cancelOrder()
    {
        $data['title'] = "Order Cancel";
        $data['martchant_content'] = $this->load->view('Marchant/order/cancel', $data, true);
        $this->load->view('Marchant/marchant_master', $data);
    }

    public function getCancelOrder()
    {
        $id = $this->session->userdata('marchant_id');
        $data =  $this->db->query("select * from tbl_salesmaster where Status = 'can' and Marchant_id = $id ")->result();
        echo json_encode($data);
    }
    public function getOrderDetails($id)
    {
        $marchant_id = $this->session->userdata('marchant_id');
        $data['order_details'] =  $this->db->query("
            select sd.SaleMaster_IDNo,p.Product_Name as P_name,sd.* from tbl_saledetails as sd
            left join tbl_product as p on p.Product_SlNo = Product_IDNo
            where   sd.SaleMaster_IDNo = $id
        ")->result();
        $data['title'] = "Order Details";
        $data['martchant_content'] = $this->load->view('Marchant/order/details', $data, true);
        $this->load->view('Marchant/marchant_master', $data);
    }


    public function orderEdit($productOrService, $salesId)
    {

        $martchant_id = $this->session->userdata('marchant_id');

        $marchant_data = $this->db->query("select * from tbl_marchant_wholesaler where id = $martchant_id ")->row();
        $customer_id = $marchant_data->customer_id;
        $customer = $this->db->query("select * from tbl_customer where Customer_SlNo = $customer_id ")->row();
        $data['customer'] = $customer;

        $data['title'] = "Sales update";
        $sales = $this->db->query("select * from tbl_salesmaster where SaleMaster_SlNo = ?", $salesId)->row();
        $data['isService'] = $productOrService == 'product' ? 'false' : 'true';
        $data['salesId'] = $salesId;
        $data['invoice'] = $sales->SaleMaster_InvoiceNo;
        $data['martchant_content'] = $this->load->view('Marchant/order/edit', $data, TRUE);
        $this->load->view('Marchant/marchant_master', $data);
    }

    public function getSales($id)
    {

       
        $saleDetails = $this->db->query("
        select  sd.*,
                    p.Product_Code,
                    p.Product_Name,
                    sd.SaleDetails_SlNo
                from tbl_saledetails sd
                join tbl_product p on p.Product_SlNo = sd.Product_IDNo
                where sd.SaleMaster_IDNo = ?
            ", $id)->result();


           
        $res['saleDetails'] = $saleDetails;
      
       


        $sales = $this->db->query("
        select 
        concat(sm.SaleMaster_InvoiceNo, ' - ', c.Customer_Name) as invoice_text,
        sm.*,
        c.Customer_Code,
        c.Customer_Name,
        c.Customer_Mobile,
        c.Customer_Address,
        c.Customer_Type,
        sm.SalseCustomer_IDNo,
        br.Brunch_name
        from tbl_salesmaster sm
        left join tbl_customer c on c.Customer_SlNo = sm.SalseCustomer_IDNo
        left join tbl_brunch br on br.brunch_id = sm.SaleMaster_branchid
     
        where  sm.Status = 'p' and sm.SaleMaster_SlNo = $id
        order by sm.SaleMaster_SlNo desc
        ")->result();

        $res['sales'] = $sales;

        echo json_encode($res);
    }
}
