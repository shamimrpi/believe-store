<style>
	.single-box {
		width: 200px;
		height: 150px;
		background-color: #ddd;
		color: #000;
		background: #a8ff78;
		background: -webkit-linear-gradient(to right, #78ffd6, #a8ff78);
		background: linear-gradient(to right, #78ffd6, #a8ff78);
		margin: 20px;
		font-size: 30px;
		text-align: center;
	}
	.single-box a{
		text-decoration: none;
		color: #000;
	}
</style>
<div id="order">
	<div class="row justify-content-center mt-3">
		<div class="single-box">
			<a href="<?php echo base_url();?>complete-order">
			<p class="py-2">
				<?php
				$id = $this->session->userdata('marchant_id');
				echo $this->db->query("SELECT sm.Marchant_id,sm.Status 
				FROM  tbl_salesmaster as sm where sm.Status = 'com' and sm.Marchant_id = 12 ")->num_rows() ?>
			</p>
			<h5>Complete Order</h5>
			</a>
		</div>

		<div class="single-box">
		<a href="<?php echo base_url();?>hold-order">
			<p>
				<?php
				$id = $this->session->userdata('marchant_id');
				echo $this->db->query("SELECT sm.Marchant_id,sm.Status 
					FROM  tbl_salesmaster as sm where sm.Status = 'p' and sm.Marchant_id = 12 ")->num_rows() ?>
			</p>
			<h5>Hold Order</h5>
		</a>
		</div>

		<div class="single-box text-center">
		<a href="<?php echo base_url();?>process-order">
			<p>
				<?php

				$id = $this->session->userdata('marchant_id');
				echo $this->db->query("SELECT sm.Marchant_id,sm.Status 
      FROM  tbl_salesmaster as sm where sm.Status = 'pro' and sm.Marchant_id = $id ")->num_rows() ?></p>
			<h5>Process Order</h5>
		</a>
		</div>

		<div class="single-box">
		<a href="<?php echo base_url();?>cancel-order">
			<p>
				<?php
				$id = $this->session->userdata('marchant_id');
				echo $this->db->query("SELECT sm.Marchant_id,sm.Status 
      FROM  tbl_salesmaster as sm where sm.Status = 'can' and sm.Marchant_id = 12 ")->num_rows() ?>
			</p>
			<h5> Cancel Order</h5>
		</a>
		</div>

	</div>
</div>
</div>