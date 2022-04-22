<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Cart extends CI_Controller
{

   public function __construct() {
      parent::__construct();
      $access = $this->session->userdata('marchant_id');
       if($access == '' ){
          redirect("user-login");
      }
      $this->load->model('Model_table', "mt", TRUE);
     
  }

 public function index(){
     $user_id = $this->session->userdata('marchant_id');
     $data['cart'] = $this->db->query("
        select
        s.SaleMaster_IDNo,
        s.SaleDetails_SlNo,
        s.Product_IDNo,
        s.SaleDetails_TotalQuantity,
        s.Purchase_Rate,
        p.Product_SellingPrice,
        s.AddBy,p.Product_Name,
        p.Product_Code,
        p.ProductCategory_ID,
        pc.ProductCategory_Name
        from tbl_saledetails as s
        left join tbl_product as p on s.Product_IDNo = p.Product_SlNo
        left join tbl_productcategory as pc on p.ProductCategory_ID = pc.ProductCategory_SlNo
        where s.status = 'p'
        and s.SaleMaster_IDNo = '0'
        and  s.AddBy= '$user_id'
        ",

        $this->session->userdata('marchant_id'))->result();

        $data['product_sum'] = $this->db->query("
        
        select sum(SaleDetails_TotalAmount) as SaleDetails_TotalAmount
        from tbl_saledetails as s
        where s.status = 'p'
        and s.SaleMaster_IDNo = '0'
        and s.AddBy= '$user_id'
        ")->row();

        echo json_encode($data);


 }


    public function cartRemove($id){
        $cart = $this->db->query("
            select s.SaleDetails_SlNo,
            pi.image,
            pi.SaleDetails_SlNo as imageSl
            from tbl_saledetails as s
            left join tbl_product_images as pi on s.SaleDetails_SlNo = pi.SaleDetails_SlNo
            where pi.SaleDetails_SlNo = $id
        ")->row();

        $product = $this->db->query("
        select pi.SaleDetails_SlNo,
        pi.image
        from tbl_product_images as pi
        where pi.SaleDetails_SlNo = $id
        ")->result();
         
        foreach($product as $p){
            $path = ltrim($p->image, '/');
            if (file_exists($path)) {
               unlink($path);
           }
        }
        

        $data = [
            'status' => 'd',
        ];
        $this->db->where('SaleDetails_SlNo', $id);
        $this->db->update('tbl_saledetails', $data);
      
    }
    

}
