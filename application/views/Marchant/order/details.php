

<div id="pendingOrder" class="mt-3 p-3">
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
<script src="<?php echo base_url();?>assets/js/vue/vuejs-datatable.js"></script>
<script src="<?php echo base_url(); ?>assets/marchant/js/vue-select.js"></script>
<script src="<?php echo base_url();?>assets/js/moment.min.js"></script>

<script>
    new Vue({
        el: '#pendingOrder',
        data: () => ({
              
            }),
        
        created(){
           this.getPendingOrder();
        },
        methods: {
            getPendingOrder() {
				axios.get('/get-complete-order').then(res => {
					this.orders = res.data;
                    console.log(this.orders);
				})
			},
        }
    })
</script>