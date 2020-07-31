<?php 
	$this->load->view('templates/header');
	$this->load->view('templates/sidebar');
	$this->load->view('templates/topbar');
 ?>
<!-- Begin Page Content -->

<div class="container-fluid">
	<!-- map lokasi -->
	<div id="cardMap" class="card shadow mb-4 card-map">
		<!-- Card Header - Accordion -->
		<a href="#cardMapCollapse" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="cardMapCollapse">
			<h6 class="m-0 font-weight-bold text-primary">Map Lokasi Sekolah</h6>
		</a>
		<!-- Card Content - Collapse -->
		<div class="collapse show" id="cardMapCollapse">
			<div class="card-body">
				<div id="map" style="height: 350px;">
			    </div>
			</div>
		</div>
	</div>
	<!-- end map lokasi -->

	<!-- data cluster -->
	<div class="card shadow mb-4">
		<!-- Card Header - Accordion -->
		<a href="#collapseCardExampleCluster" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExampleCluster">
			<h6 class="m-0 font-weight-bold text-primary">Data Cluster</h6>
		</a>
		<!-- Card Content - Collapse -->
		<div class="collapse show" id="collapseCardExampleCluster" style="">
			<div class="card-body">
				<!-- table cluster -->
					<?php foreach ($cluster as $key1):?>
						<div class="card shadow mb-4">

							<a href="#collapseCardExampleCluster<?= $key1['id_cluster'] ?>" class="d-block card-header py-3 card-cluster collapsed" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="collapseCardExampleCluster">
			                	<h6 class="m-0 font-weight-bold text-primary"><?= ucfirst($key1['nama_cluster']) ?></h6>
			                </a>
			                <div class="collapse hide" id="collapseCardExampleCluster<?= $key1['id_cluster'] ?>">
							    <div class="card-body">
							      <div class="table-responsive">
							        <table class="table table-bordered display" width="100%" cellspacing="0">
							          <thead>
							            <tr>
							            	<th>Id Sekolah</th>
								            <th>Nama Sekolah</th>
								            <th>Biaya</th>
								            <th>Jarak Km</th>
								            <th>Action</th>
							            </tr>
							          </thead>
							          <tbody>
							          	<?php foreach ($cluster_detail as $key2): ?>
							          		<?php if ($key1['id_cluster'] == $key2['id_cluster']): ?>
							          			<tr>
							          				<td><?= $key2['id_sekolah'] ?></td>
								          			<td><?= $key2['nama_sekolah'] ?></td>
								          			<td><?= $key2['nilai'] ?></td>
								          			<td><?= $key2['jarak_sekolah'] ?></td>
								          			<td>
								          				<button class="btn btn-info btn-sm btn-icon-split" onclick="findLokasiSekolah(<?= $key2['id_sekolah'];?>)">
										              		<span class="icon text-white-50">
										                      	<i class="fas fa-info-circle"></i>
										                    </span>
										                    <span class="text">Lokasi</span>
										              	</button>
								          			</td>
							          			</tr>
							          		<?php endif ?>
							          	<?php endforeach ?>
							          </tbody>
							        </table>
							      </div>
							    </div>
							</div>
						</div>
					<?php endforeach ?>
				<!-- end table cluster -->
			</div>
		</div>
	</div>
	<!-- end data cluster -->

	<!-- ranking -->
	<div class="card shadow mb-4">
		<!-- Card Header - Accordion -->
		<a href="#collapseCardExampleRanking" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExampleRanking">
			<h6 class="m-0 font-weight-bold text-primary">Hasil Ranking</h6>
		</a>
		<!-- Card Content - Collapse -->
		<div class="collapse show" id="collapseCardExampleRanking" style="">
			<div class="card-body">
				<?php foreach ($cluster as $key1):?>
					<div class="card shadow mb-4">

						<a href="#collapseCardExampleRanking<?= $key1['id_cluster'] ?>" class="d-block card-header py-3 card-cluster collapsed" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="collapseCardExampleRanking">
		                	<h6 class="m-0 font-weight-bold text-primary">Ranking Sekolah <?= ucfirst($key1['nama_cluster']) ?></h6>
		                </a>
		                <div class="collapse hide" id="collapseCardExampleRanking<?= $key1['id_cluster'] ?>">
						    <div class="card-body">
						      <div class="table-responsive">
						        <table class="table table-bordered display" width="100%" cellspacing="0">
						          <thead>
						            <tr>
						            	<th>Id Sekolah</th>
							            <th>Nama Sekolah</th>
							            <th>Hasil AHP</th>
							            <th>Ranking</th>
							            <th>Action</th>
						            </tr>
						          </thead>
						          <tbody>
						          	<?php foreach ($hasil_ahp as $key2): ?>
						          		<?php if ($key1['id_cluster'] == $key2['id_cluster']): ?>
						          			<tr>
						          				<td><?= $key2['id_sekolah'] ?></td>
							          			<td><?= $key2['nama_sekolah'] ?></td>
							          			<td><?= $key2['nilai_hasil'] ?></td>
							          			<td><?= $key2['ranking'] ?></td>
							          			<td>
							          				<button class="btn btn-info btn-sm btn-icon-split" onclick="findLokasiSekolah(<?= $key2['id_sekolah'];?>)">
									              		<span class="icon text-white-50">
									                      	<i class="fas fa-info-circle"></i>
									                    </span>
									                    <span class="text">Lokasi</span>
									              	</button>
							          			</td>
						          			</tr>
						          		<?php endif ?>
						          	<?php endforeach ?>
						          </tbody>
						        </table>
						      </div>
						    </div>
						</div>
					</div>
				<?php endforeach ?>
			</div>
		</div>
	</div>
	<!-- end ranking -->

</div>



<?php 
	$this->load->view('templates/footer');
 ?>

  <script>
 	$(document).ready(function() {
 		$('table.display').DataTable();
	} );

	var map = L.map('map').setView([-7.25656, 112.73166], 13);
	var base_url = window.location.origin + '/' + window.location.pathname.split ('/') [1] + '/';
	var datasekolah = <?php echo json_encode($cluster_detail) ?>;

	// add map
	L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
	}).addTo(map);

	// add marker
	var marker_sekolah = [];
	for(sekolah of datasekolah){
		marker_sekolah.push({
			id_sekolah: sekolah.id_sekolah,
			marker: L.marker([sekolah.latitude, sekolah.longtitude]).addTo(map).bindPopup(sekolah.nama_sekolah),
		});
	}

	function findLokasiSekolah(id_sekolah) {
		let lokasi_sekolah = marker_sekolah.find((sekolah)=>sekolah.id_sekolah == id_sekolah);
		// show cardmap
		$('#cardMapCollapse').collapse('show');
		// scroll to cardmap
		document.getElementById('cardMap').scrollIntoView({behavior: "smooth"});
		// setviewmap 
		map.flyTo(lokasi_sekolah.marker.getLatLng(), 13, {
			animate: true,
			duration: 0.9,
		});
		lokasi_sekolah.marker.openPopup();
	}
</script>