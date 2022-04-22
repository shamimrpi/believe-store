<style>
    .pagination{
        float: right;
    }
    .pagination li{
        display: block;
        color: #000;
        background-color: #ddd;
        
        text-align: center;
        border: 1px solid #fff;
        text-decoration: none;
    }
    .pagination li.active{
        background-color: green;
        color:#fff !important
    }
    .pagination li a{
        display: block;
        color: #000;
        text-decoration: none;
        padding: 5px 10px;
    }
</style>

<div id="pendingOrder">
   
<div class="row">
			<div class="col-md-6 form-inline my-3 ">
				<div class="form-group p-3">
					<label for="filter" class="sr-only">Filter</label>
					<input type="text" class="form-control" v-model="filter" placeholder="Filter">
				</div>
			</div>
			<div class="col-md-12">
				<div class="table-responsive p-3">
					<datatable :columns="columns" :data="orders" :filter-by="filter" style="margin-bottom: 5px;">
						<template scope="{ row }">
							<tr class="text-center">
								<td>{{ row.SaleMaster_InvoiceNo }}</td>
								<td>{{ row.SaleMaster_TotalSaleAmount }}</td>
								<td>{{ row.payment_type }}</td>
								<td>{{ row.AddTime | dateOnly('DD-MM-YYYY') }}</td>
								<td v-if="row.Status == 'com'"> Completed </td>
								<td class="text-center"> 
									
                                <a :href="'/get-order-details/'+row.SaleMaster_SlNo"><i class="fa-solid fa-eye text-black"></i></a>
								</td>
							</tr>
						</template>
					</datatable>
					<datatable-pager v-model="page" type="abbreviated" :per-page="per_page" style="margin-bottom: 50px;"></datatable-pager>
				</div>
			</div>
		</div>
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
                orders:[],
                columns: [
                    { label: 'Invoice No.', field: 'SaleMaster_InvoiceNo', align: 'center' },
                    { label: 'Order Amount', field: 'SaleMaster_TotalSaleAmount', align: 'center' },
                    { label: 'Payment Type', field: 'payment_type', align: 'center' },
                    { label: 'Order Date', align: 'center', filterable: false },
                    { label: 'Status', align: 'center', filterable: false },
                    { label: 'Action', align: 'center', filterable: false }
                ],
                page: 1,
                per_page: 10,
                filter: '',
            }),
        
        created(){
           this.getPendingOrder();
        },
        methods: {
            getPendingOrder() {
				axios.get('/get-complete-order').then(res => {
					this.orders = res.data;
				})
			},
        }
    })
</script>