<?php 
	$this->load->view('templates/header');
	$this->load->view('templates/sidebar');
	$this->load->view('templates/topbar');
 ?>
<!-- Begin Page Content -->
<div class="container-fluid">
	<?= $this->session->flashdata('message'); ?>

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

  	<!-- table sekolah -->
	<div class="card shadow mb-4">
	    <div class="card-header py-3">
    		<div class="d-sm-flex align-items-center justify-content-between">
    			<h6 class="m-0 font-weight-bold text-primary">Data Sekolah</h6>
				<a class="btn btn-info btn-sm btn-icon-split" href="<?php echo base_url('admin/sekolah/create') ?>">
              		<span class="icon text-white-50">
                      	<i class="fas fa-plus"></i>
                    </span>
                    <span class="text">Tambah</span>
              	</a>
			</div>
	    </div>
	    <div class="card-body">
	      <div class="table-responsive">
	        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	          <thead>
	            <tr>
	              <th>Sekolah</th>
	              <th>Kepala Sekolah</th>
	              <th>Alamat</th>
	              <th>No telepon</th>
	              <th>Action</th>
	            </tr>
	          </thead>
	          <tbody>
	          	<?php foreach ($sekolah_list as $key) { ?>
		            <tr>
		              <td><?php echo $key['nama_sekolah']; ?></td>
		              <td><?php echo $key['nama_kepala_sekolah']; ?></td>
		              <td><?php echo $key['alamat_sekolah']; ?></td>
		              <td><?php echo $key['no_telepon']; ?></td>
		              <td>
		              	<a class="btn btn-warning btn-sm btn-icon-split" href="<?php echo base_url('admin/sekolah/update/'.$key['id_sekolah']) ?>">
		              		<span class="icon text-white-50">
		                      	<i class="fas fa-pencil-alt"></i>
		                    </span>
		                    <span class="text">Ubah</span>
		              	</a>
		              	<a class="btn btn-danger btn-sm btn-icon-split btn-hapus" href="<?php echo base_url('admin/sekolah/delete/'.$key['id_sekolah']) ?>">
		              		<span class="icon text-white-50">
		                      	<i class="fas fa-trash"></i>
		                    </span>
		                    <span class="text">Hapus</span>
		              	</a>
		              	<button class="btn btn-info btn-sm btn-icon-split" onclick="findLokasiSekolah(<?= $key['id_sekolah'];?>)">
		              		<span class="icon text-white-50">
		                      	<i class="fas fa-info-circle"></i>
		                    </span>
		                    <span class="text">Lokasi</span>
		              	</button>
		              </td>
		            </tr>
	        	<?php } ?>
	          </tbody>
	        </table>
	      </div>
	    </div>
	</div>

</div>
<!-- /.container-fluid -->

<?php 
	$this->load->view('templates/footer');
 ?>


<script type="text/javascript">
	
	var map = L.map('map').setView([-7.25656, 112.73166], 13);
	var base_url = window.location.origin + '/' + window.location.pathname.split ('/') [1] + '/';
	var datasekolah = <?php echo json_encode($sekolah_list) ?>;

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