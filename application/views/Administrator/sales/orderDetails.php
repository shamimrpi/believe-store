

<div id="pendingOrder" class="">
    <h5 class="text-center">Order Details</h5>
    <table class="w-100 table order-table">
        <tr class="text-center">
            <th>SL</th>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>image</th>
        </tr>
        <tr>
            <?php  
            foreach($order_details as $key=> $order){?>
                <tr class="text-center">
                    <td><?php echo $key+1; ?></td>
                    <td><?php echo $order->P_name; ?></td>
                    <td><?php echo $order->SaleDetails_TotalQuantity; ?></td>
                    <td><?php echo $order->Purchase_Rate; ?></td>
                    <td width="18%">
                        <?php   $images = $this->db->query("select pi.* from tbl_saledetails as sd join tbl_product_images as pi on pi.SaleDetails_SlNo = $order->SaleDetails_SlNo where sd.SaleDetails_SlNo = $order->SaleDetails_SlNo")->result();
                            foreach($images as $image){?>
                                <img src="<?php echo base_url('uploads/productImage/'. $image->image);?>" class="product-image mx-auto mx-1" />
                            <?php }
                        ?>
                   
                   </td>
                </tr>
           <?php }
            ?>
        </tr>
    </table>
</div>

<script src="<?php echo base_url(); ?>assets/js/vue/vue.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/vuejs-datatable.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/vue-select.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/moment.min.js"></script>
