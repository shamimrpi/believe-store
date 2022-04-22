<div id="order">
	<div class="row justify-content-center">
		<div class="col-md-8 ">
			<div class="form-area custom-card">
				<h5 class="heading"><i class="fa fa-user-plus"></i> Supplier & Product Information</h5>


				<div class="row">
					<div class="col-md-6">
						<div class="row">
						<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right"> Invoice No. </label>
								<div class="col-xs-8">
								<input type="text" v-model="purchase.invoiceNo" class="form-control" v-model="selectedCustomer.Customer_Name" readonly />
								</div>
							</div>
							<div class="form-group">
								<label for="name">Select Customer<span class="text-danger">*</span> </label>
								<v-select v-bind:options="customers" v-model="selectedCustomer" label="display_name"></v-select>
							</div>
							<div class="form-group" style="display:none;" v-bind:style="{display: selectedCustomer.Customer_Type == 'G' ? '' : 'none'}">
								<label class="col-xs-4 control-label no-padding-right"> Name </label>
								<div class="col-xs-8">
									<input type="text" id="customerName" placeholder="Customer Name" class="form-control" v-model="selectedCustomer.Customer_Name" v-bind:disabled="selectedCustomer.Customer_Type == 'G' ? false : true" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right"> Mobile No </label>
								<div class="col-xs-8">
									<input type="text" id="mobileNo" placeholder="Mobile No" class="form-control" v-model="selectedCustomer.Customer_Mobile" v-bind:disabled="selectedCustomer.Customer_Type == 'G' ? false : true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right">Customer Email </label>
								<div class="col-xs-8">
									<input type="text" id="mobileNo" placeholder="Customer Email" class="form-control" v-model="selectedCustomer.Customer_Email" v-bind:disabled="selectedCustomer.Customer_Type == 'G' ? false : true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right"> Address </label>
								<div class="col-xs-8">
									<textarea id="address" placeholder="Address" class="form-control" v-model="selectedCustomer.Customer_Address" v-bind:disabled="selectedCustomer.Customer_Type == 'G' ? false : true"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<form v-on:submit.prevent="addToCart" id="custom-form">
							<div class="row">
								<div class="form-group">
									<label for="name">Category<span class="text-danger">*</span> </label>
									<v-select v-bind:options="categories" v-model="selectCategory" label="ProductCategory_Name" v-on:input="changeCategory"></v-select>
								</div>
								<div class="form-group">
									<label for="name">Product<span class="text-danger">*</span> </label>
									<v-select v-bind:options="products" v-model="selectedProduct" label="Product_Name" v-on:input="productOnChange"></v-select>
								</div>
								<h5 v-if="productStock<0">{{productStockText}}</h5>
								<div class="form-group" v-if="productStock>0">
									<div class="stock-part">
										<h5>{{productStockText}}</h5>
										<p class="text-success">{{productStock}}</p>
									</div>
									
								</div>
								<div class="form-group">
									<label for="name">Purchase Price <span class="text-danger">*</span> </label>
									<input type="text" v-model="selectedProduct.Product_Purchase_Rate" autocomplete="off" class="form-control shadow-none " id="name" placeholder="Purchase Price" required>
								</div>

								<div class="form-group">
									<label for="name">Selling Price <span class="text-danger">*</span> </label>
									<input type="text" v-model="selectedProduct.Product_SellingPrice" class="form-control shadow-none " placeholder="Selling Price" required>
								</div>
								<div class="form-group">
									<label for="name">Muliple Image Upload </label>
									<input type="file" name="images" id="multi_image" ref="imageUpload" class="form-control form-control-sm" maxlength="10" multiple="multiple" @change="previewImage" required/>
								</div>

							</div>
							<div class="d-flex mt-3">
								<button type="submit" class="btn btn-success cart-btn ms-auto">Add Cart</button>
							</div>
						</form>
					</div>

				</div>


				<div class="row mt-3">
					<table class="w-100 cart-table" style="display:none;" v-bind:style="{display: cart.length > 0 ? '' : 'none'}">
						<tr class="table-heading">
							<th style="width:10%;color:#000;">Sl</th>
							<th style="width:15%;color:#000;">Product Code</th>
							<th style="width:20%;color:#000;">Product Name</th>
							<th style="width:7%;color:#000;">Qty</th>
							<th style="width:8%;color:#000;">Rate</th>
							<th style="width:10%;color:#000;">Action</th>
						</tr>
						<tr v-for="(product, sl) in cart">
							<td>{{ sl + 1}}</td>
							<td>{{ product.product_code }}</td>
							<td>{{ product.Product_Name }}</td>
							<td>{{ product.quantity }}</td>
							<td>{{ product.selling_price }}</td>
							<td><a href="#" v-on:click.prevent="removeFromCart(sl)"><i class="fa fa-trash text-danger"></i></a></td>
						</tr>
						</tr>
                        <tr>
							<td colspan="7"></td>
						</tr>

						<tr style="font-weight: bold;">
							<td colspan="4">Note</td>
							<td colspan="3">Sub Total</td>
						</tr>
                        <tr>
							<td colspan="4"><textarea style="width: 100%;font-size:13px;" placeholder="Note" v-model="purchase.note"></textarea></td>
							<td colspan="3" style="padding-top: 15px;font-size:18px;">{{total }}</td>
						</tr>


					</table>
				</div>
			</div>
		</div>
		<div class="col-md-4 ">
			<div class="form-area custom-card card">
				<h5 class="heading"><i class="fas fa-list me-1"></i>Amount Details</h5>
				<label for="name">Total </label>
				<input type="number" v-model="total" class="form-control" readonly>
				<label for="name">Advance </label>
				<input type="number" v-model="purchase.advnace"  class="form-control">
				<button class="btn btn-success mt-3 " v-on:click="savePurchase">Purchase</button>

			</div>
		</div>
	</div>
</div>

<script src="<?php echo base_url(); ?>assets/js/vue/vue.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url(); ?>assets/marchant/js/vue-select.js"></script>
<script src="<?php echo base_url(); ?>assets/js/moment.min.js"></script>

<script>
	Vue.component('v-select', VueSelect.VueSelect)

	new Vue({
		el: '#order',
		data: () => ({
			products: [],
			customers: [],
			categories: [],
			images: [],
			selectedFile: null,
			purchase: {
				Customer_Name: '',
				invoiceNo: '<?php echo $invoice; ?>',
				subTotal: 0.00,
				discount: 0.00,
				cost: 0.00,
				total: 0.00,
				advnace: 0.00,
				due: 0.00,
				note: '',
				Customer_SlNo: '',
			},
			selectCategory: {
				ProductCategory_SlNo: '',
				ProductCategory_Name: 'Select Category',
			},
			selectedProduct: {
				Product_SlNo: '',
				Product_Code: '',
				display_text: 'Select Product',
				Product_Name: '',
				Unit_Name: '',
				quantity: 1,
				Product_Purchase_Rate: '',
				category_name: '',
				Product_SellingPrice: 0.00,
				total: ''
			},
			selectedCustomer: {
				Customer_SlNo: '',
				Customer_Code: '',
				Customer_Name: '',
				display_name: 'Select Customer',
				Customer_Mobile: '',
				Customer_Address: '',
				Customer_Type: '',
				Customer_Email: ''
			},
			cart: [],
			total: '',
			purchaseOnProgress: false,
			productStockText:'',
			productStock:''

		}),
		created() {
			// this.getProduct();
			this.getCategories();
			this.getCustomers();
			// this.getCart();
		},
		methods: {
			getProduct() {
				axios.post('/get_products', {
					isService: 'false'
				}).then(res => {
					this.products = res.data;
					console.log(this.products);
				})
			},
			getCategories() {
				axios.get('/marchant-get_categories').then(res => {
					this.categories = res.data;
				})
			},

			changeCategory() {
				let id = this.selectCategory.ProductCategory_SlNo;
				axios.get('/marchant-get_product/' + id).then(res => {
					this.products = res.data;
				})
			},

			calculateTotal() {

				this.total = this.cart.reduce(function(sum, current) {
					return sum + parseFloat(current.selling_price)
					}, 0);
				

			},
			
			async getCustomers() {
				await axios.post('/marchant-get_customers').then(res => {
					this.customers = res.data;
					console.log(this.customers);
				
				})
			},
			async customerOnChange() {
				if (this.selectedCustomer.Customer_SlNo == '') {
					return;
				}
				if (event.type == 'readystatechange') {
					return;
				}


				this.calculateTotal();
			},
			async productOnChange(){
				if((this.selectedProduct.Product_SlNo != '' || this.selectedProduct.Product_SlNo != 0)){
					this.productStock = await axios.post('/marchant-get_product_stock', {productId: this.selectedProduct.Product_SlNo}).then(res => {
						return res.data;
					})

					this.productStockText = this.productStock > 0 ? "Available Stock" : "Stock Unavailable";
				}

				// this.$refs.quantity.focus();
			},
			productTotal() {
				this.selectedProduct.total = this.selectedProduct.selling_price;

			},
			previewImage() {
				// let selectedFiles =e.target.files;
				let files = $('#multi_image')[0].files;
				for (i = 0; i < files.length; i++) {
					if (event.target.files.length > 0) {
						this.selectedFile = event.target.files;

					} else {
						this.selectedFile = null;
					}
					console.log(this.selectedFile);
				}

			},

			addToCart() {
				if (this.productStock <0) {
					alert('Stock not available');
					return;
				}
				let cartInd = this.cart.findIndex(p => p.product_code == this.selectedProduct.Product_Code);
				if (cartInd > -1) {
					alert('Product exists in cart');
					return;
				}
				let product = {
					product_serialNo: this.selectedProduct.Product_SlNo,
					Product_Name: this.selectedProduct.Product_Name,
					product_code: this.selectedProduct.Product_Code,
					quantity: 1,
					selling_price: this.selectedProduct.Product_SellingPrice,
					purchase_price: this.selectedProduct.Product_Purchase_Rate,
					total: this.selectedProduct.total,
					image: this.selectedFile,
				}

				this.cart.push(product);
				this.calculateTotal();
				this.clearProduct();
				// $('#multi_image').val('');
				$('input([type=file]').val('');

			},
			clearProduct() {
				this.selectedProduct = {
					Product_SlNo: '',
					Product_Code: '',
					Product_Name: 'Select Product',
					Unit_Name: '',
					ProductCategory_Name: '',
					quantity: 1,
					Product_Purchase_Rate: '',
					Product_SellingPrice: 0.00,
					total: 0.00,
				}
				$('#multi_image').val('');
				// $('#custom-form').trigger('reset');

			},

			async savePurchase() {
				if (this.selectedCustomer.Customer_SlNo == '') {
					alert('Select Customer');
					return;
				}

				if (this.cart.length == '') {
					alert('Cart is empty');
					return;
				}


				let data = {
					purchase: this.purchase,
					cart: this.cart
				}

				if (this.selectedCustomer.Customer_Type == 'G') {
					data.customer = this.selectedCustomer;
				}


				let formData = new FormData();
				this.cart.forEach(function(pro, ind) {
					if (pro.hasOwnProperty('image')) {
						let files = pro.image;
						for (let i = 0; i < files.length; i++) {
							formData.append(ind+'[]', files[i]);
						}
						// formData.append(ind, pro.image);
					}
				});
				formData.append('customer', JSON.stringify(this.selectedCustomer));
				formData.append('cart', JSON.stringify(this.cart));
				formData.append('purchase', JSON.stringify(this.purchase));
				formData.append('total', JSON.stringify(this.total));


				let url = '/marchant-order';
				axios.post(url, formData).then(async res => {
					let r = res.data;
					alert('order submited successfully');
					// location.reload();

				})
			},

			async removeFromCart(ind) {
				// }
				this.cart.splice(ind, 1);
				this.calculateTotal();
			},




		}
	})
</script>