<?php 
	$this->load->view('templates/header');
	$this->load->view('templates/sidebar');
	$this->load->view('templates/topbar');
 ?>
<!-- Begin Page Content -->


<div class="container-fluid">
	<!-- table cluster -->
	<div class="row">
		<?php foreach ($cluster as $key1):?>
			<div class="col-md-6">
				<div class="card shadow mb-4">

					<a href="#collapseCardExample<?= $key1['id_cluster'] ?>" class="d-block card-header py-3 card-cluster collapsed" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="collapseCardExample">
	                	<h6 class="m-0 font-weight-bold text-primary"><?= ucfirst($key1['nama_cluster']) ?></h6>
	                </a>
	                <div class="collapse hide" id="collapseCardExample<?= $key1['id_cluster'] ?>">
					    <div class="card-body">
					      <div class="table-responsive">
					        <table class="table table-bordered display" width="100%" cellspacing="0">
					          <thead>
					            <tr>
					            	<th>Id Sekolah</th>
						            <th>Nama Sekolah</th>
						            <th>Jarak Km</th>
					            </tr>
					          </thead>
					          <tbody>
					          	<?php foreach ($cluster_detail as $key2): ?>
					          		<?php if ($key1['id_cluster'] == $key2['id_cluster']): ?>
					          			<tr>
					          				<td><?= $key2['id_sekolah'] ?></td>
						          			<td><?= $key2['nama_sekolah'] ?></td>
						          			<td><?= $key2['jarak_sekolah'] ?></td>
					          			</tr>
					          		<?php endif ?>
					          	<?php endforeach ?>
					          </tbody>
					        </table>
					      </div>
					    </div>
					</div>
				</div>
			</div>
		<?php endforeach ?>
	</div>
	<!-- end table cluster -->
	
	<?php
		if (validation_errors()) {
			echo '<div class="alert alert-danger" role="alert">Gagal simpan, Cek form bobot kriteria</div>';
		} 	 
	?>

	<!-- bobot kriteria -->
	<div class="row">
		<div class="col-lg-12">
              <!-- Basic Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Masukkan Bobot Kriteria</h6>
                </div>
                <div class="card-body">
					<form action="<?= base_url('admin/rekomendasi_sekolah/createBobotKriteria') ?>" method="post">
						<div class="table-responsive">
					        <table class="table table-bordered" width="100%" cellspacing="0">
					          <thead>
					            <tr>
					              <td>Nama Kriteria</td>
					              <?php foreach ($kriteria as $key): ?>
					              	<th><?= ucfirst($key['nama_kriteria']) ?></th>
					              <?php endforeach ?>
					            </tr>
					          </thead>
					          <tbody>
					          	<?php $dis = 1; ?>
					          	<?php foreach ($kriteria as $key): ?>
					          		<tr>
					          			<th scope="row"><?= ucfirst($key['nama_kriteria']) ?></th>
					          			<?php foreach ($kriteria as $index => $value): ?>
					          				<td>
					          					<?php if ($index + 1 <= $dis): ?>
					          						<input type="text" class="form-control" id="<?= $key['id_kriteria'] . '_' . $value['id_kriteria']?>" name="<?= $key['id_kriteria'] . '_' . $value['id_kriteria']?>" value="" >
					          					<?php else: ?>					          					
						          					<input class="form-control" id="<?= $key['id_kriteria'] . '_' . $value['id_kriteria']?>" name="<?= $key['id_kriteria'] . '_' . $value['id_kriteria']?>" >
						          						<!-- <option value="">pilih nilai perbandingan</option>
						          						<option value="1">1</option>
						          						<option value="2">2</option>
						          						<option value="3">3</option>
						          						<option value="4">4</option>
						          						<option value="5">5</option>
						          						<option value="6">6</option>
						          						<option value="7">7</option>
						          						<option value="8">8</option>
						          						<option value="9">9</option> -->
						          					</select>
					          					<?php endif ?>
					          				</td>
					          			<?php endforeach ?>
					          		</tr>
					          		<?php $dis++ ?>
					          	<?php endforeach ?>
					          </tbody>
					        </table>
					    </div>
					    <div class="text-right">
						 	<a href="<?= base_url('admin/rekomendasi_sekolah') ?>" id="" class="btn btn-secondary">Kembali</a>
						 	<button class="btn btn-success">Hitung</button>
						</div>
					</form>
                </div>
              </div>

        </div>
	</div>
	<!-- end bobot kriteria -->
</div>



<?php 
	$this->load->view('templates/footer');
 ?>

 <script>
 	$(document).ready(function() {
 		$('table.display').DataTable();
	} );

	let kriteria = <?php echo json_encode($kriteria) ?>;


	for (itemRow of kriteria){
		for (itemCol of kriteria){
			let idSelect = '#' + itemRow.id_kriteria + '_' + itemCol.id_kriteria;
			let data = '#' + itemCol.id_kriteria + '_' + itemRow.id_kriteria;
			
			$(idSelect).change(function() {
				if ($(this).val() == '') {
					$(data).val('');
				}else{
					$(data).val(1/$(this).val());	
				}
			})

			if (itemRow.id_kriteria == itemCol.id_kriteria) {
				$(idSelect).val(1);
			}
		}	
	}
 </script>