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
	                	<h6 class="m-0 font-weight-bold text-primary">Hasil Rangking <?= ucfirst($key1['nama_cluster']) ?> Ahp</h6>
	                </a>
	                <div class="collapse hide" id="collapseCardExample<?= $key1['id_cluster'] ?>">
					    <div class="card-body">
					      <div class="table-responsive">
					        <table class="table table-bordered display" width="100%" cellspacing="0">
					          <thead>
					            <tr>
					            	<th>Id Sekolah</th>
						            <th>Nama Sekolah</th>
						            <th>Hasil AHP</th>
					            </tr>
					          </thead>
					          <tbody>
					          	<?php foreach ($hasil_ahp as $key2): ?>
					          		<?php if ($key1['id_cluster'] == $key2['id_cluster']): ?>
					          			<tr>
					          				<td><?= $key2['id_sekolah'] ?></td>
						          			<td><?= $key2['nama_sekolah'] ?></td>
						          			<td><?= $key2['nilai_hasil'] ?></td>
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

</div>



<?php 
	$this->load->view('templates/footer');
 ?>

  <script>
 	$(document).ready(function() {
 		$('table.display').DataTable();
	} );
</script>