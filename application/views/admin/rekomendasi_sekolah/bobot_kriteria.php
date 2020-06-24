<?php 
	$this->load->view('templates/header');
	$this->load->view('templates/sidebar');
	$this->load->view('templates/topbar');
 ?>
<!-- Begin Page Content -->


<div class="container-fluid">
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
	<div class="row">
		<div class="col-lg-12">
              <!-- Basic Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Masukkan Bobot Kriteria</h6>
                </div>
                <div class="card-body">
					<form>
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
					          						<select class="form-control" disabled="disabled">
						          						<option>1</option>
						          					</select>
					          					<?php else: ?>					          					
						          					<select class="form-control">
						          						<option><?= $index ?></option>
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
</div>



<?php 
	$this->load->view('templates/footer');
 ?>

 <script>
 	$(document).ready(function() {
 		$('table.display').DataTable();
	} );
 </script>