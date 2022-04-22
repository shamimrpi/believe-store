<style>
	.v-select {
		margin-bottom: 5px;
	}

	.v-select.open .dropdown-toggle {
		border-bottom: 1px solid #ccc;
	}

	.v-select .dropdown-toggle {
		padding: 0px;
		height: 25px;
	}

	.v-select input[type=search],
	.v-select input[type=search]:focus {
		margin: 0px;
	}

	.v-select .vs__selected-options {
		overflow: hidden;
		flex-wrap: nowrap;
	}

	.v-select .selected-tag {
		margin: 2px 0px;
		white-space: nowrap;
		position: absolute;
		left: 0px;
	}

	.v-select .vs__actions {
		margin-top: -5px;
	}

	.v-select .dropdown-menu {
		width: auto;
		overflow-y: auto;
	}

	#suppliers label {
		font-size: 13px;
	}

	#suppliers select {
		border-radius: 3px;
	}

	#suppliers .add-button {
		padding: 2.5px;
		width: 28px;
		background-color: #298db4;
		display: block;
		text-align: center;
		color: white;
	}

	#suppliers .add-button:hover {
		background-color: #41add6;
		color: white;
	}

	#suppliers input[type="file"] {
		display: none;
	}

	#suppliers .custom-file-upload {
		border: 1px solid #ccc;
		display: inline-block;
		padding: 5px 12px;
		cursor: pointer;
		margin-top: 5px;
		background-color: #298db4;
		border: none;
		color: white;
	}

	#suppliers .custom-file-upload:hover {
		background-color: #41add6;
	}

	#supplierImage {
		height: 100%;
	}
</style>
<div id="suppliers">

	<div class="row">
		<div class="col-sm-12 form-inline">
			<div class="form-group">
				<label for="filter" class="sr-only">Filter</label>
				<input type="text" class="form-control" v-model="filter" placeholder="Filter">
			</div>
		</div>
		<div class="col-md-12">
			<div class="table-responsive">
				<datatable :columns="columns" :data="orders" :filter-by="filter" style="margin-bottom: 5px;">
					<template scope="{ row }">
						<tr>
							<td>{{ row.SaleMaster_InvoiceNo }}</td>
							<td>{{ row.payment_type }}</td>
							<td>{{ row.advance }}</td>
							<td>{{ row.Customer_Code }}</td>
							<td>{{ row.Customer_Name }}</td>
							<td>{{ row.Customer_Mobile }}</td>
							<td>
								<?php if ($this->session->userdata('accountType') != 'u') { ?>
									<a href="#" class="ml-1" @click="update(row.SaleMaster_SlNo)" >
										<i class="fa fa-pencil"></i>
								</a>
									<a  href="#" class="m--1" @click="deleteOrder(row.SaleMaster_SlNo)">
										<i class="fa fa-trash text-danger"></i>
								</a>
								<?php } ?>
								<a :href="'/admin-order-details/'+row.SaleMaster_SlNo" ><i class="fa fa-eye"></i></a>
							
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
<script src="<?php echo base_url(); ?>assets/js/vue/vuejs-datatable.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/vue-select.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/moment.min.js"></script>

<script>
	Vue.component('v-select', VueSelect.VueSelect);
	new Vue({
		el: '#suppliers',
		data() {
			return {
				orders: [],
				order_details: [],

				columns: [{
						label: 'Invoice No',
						field: 'SaleMaster_InvoiceNo',
						align: 'center',
						filterable: false
					},
					{
						label: 'Payment_type',
						field: 'payment_type',
						align: 'center'
					},
					{
						label: 'Advance',
						field: 'SaleMaster_Advance',
						align: 'center',
						filterable: false
					},
					{
						label: 'Customer Code',
						field: 'Customer_Code',
						align: 'center',
						filterable: false
					},
					{
						label: 'Customer Name',
						field: 'Customer_Name',
						align: 'center',
						filterable: false
					},
					{
						label: 'Contact Number',
						field: 'Supplier_Mobile',
						align: 'center'
					},
					{
						label: 'Action',
						align: 'center',
						filterable: false
					}
				],
				page: 1,
				per_page: 10,
				filter: ''
			}
		},
		created() {
			this.getOrder();
		},
		methods: {
			getOrder() {
				axios.get('/admin-get-process-order').then(res => {
					this.orders = res.data;
					console.log(this.orders);
				})
			},
			update(id) {
				axios.post('/admin-process-order-update/' + id).then(res => {
					alert('order updated');
					return;
					this.getOrder();
				})
			},
			deleteOrder(id) {
				axios.post('/admin-hold-order-delete/' + id).then(res => {
					alert('order deleted');
					this.getOrder();
				})
			},
		
		}
	})
</script>