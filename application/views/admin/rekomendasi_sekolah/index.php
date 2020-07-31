<?php 
	$this->load->view('templates/header');
	$this->load->view('templates/sidebar');
	$this->load->view('templates/topbar');
 ?>
<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="row">
		<div class="col-lg">
			<div class="card shadow mb-4">
			    <div class="card-header py-3">
			      <h6 class="m-0 font-weight-bold text-primary">Pilih Lokasi Anda</h6>
			    </div>
			    <div class="card-body">
			    	<div id="map" style="height: 350px;">
			    	</div>
			    	<Hr>
					<div class="col-lg">
					 	<div class="text-right">
						 	<button id="btncluster" class="btn btn-success">Lanjut</button>

						 	<div id="btnloading" class="spinner-border text-success" hidden="hidden">
							  <span class="sr-only">Loading...</span>
							</div>
						</div>
					</div>
				
			    </div>
			</div>
		</div>
	</div>
</div>

<?php 
	$this->load->view('templates/footer');
 ?>


<script type="text/javascript">
	
	var map = L.map('map').setView([-7.25656, 112.73166], 13);
	var base_url = window.location.origin + '/' + window.location.pathname.split ('/') [1] + '/';
	var datasekolah = <?php echo json_encode($sekolah) ?>;
	console.log(datasekolah);
	var data_jarak = [];

	// add map
	L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
	}).addTo(map);

	// add marker
	var user = L.marker([-7.25656, 112.73166], {draggable: 'true', autoPan: 'true'}).addTo(map);
	user.bindPopup('Drag ke lokasi anda <br>'+ user.getLatLng()).openPopup();
	
	// set drag marker
	user.on("drag", function(e) {
		// console.log(user.getLatLng().distanceTo(user2.getLatLng()));
		// console.log(user.getLatLng());
		user.bindPopup('Drag ke lokasi anda <br>'+ user.getLatLng()).openPopup();
	});


	// connver lokasi ke jarak
	for (sekolah of datasekolah){
		let jarak = map.distance([sekolah.latitude, sekolah.longtitude], user.getLatLng());
		data_jarak.push({id_sekolah: sekolah.id_sekolah, nama_sekolah: sekolah.nama_sekolah, jarak: jarak, biaya: sekolah.nilai});
	}

	console.log(data_jarak);


	$("#btncluster").click(function(){
		$('#btncluster').attr("hidden", "hidden");
		$('#btnloading').removeAttr("hidden");

	    $.post( base_url + 'admin/rekomendasi_sekolah/createCluster',
	    {
	    	data_jarak : data_jarak,
	    },
	    function(data,status){
	      	window.location.href = base_url + 'admin/rekomendasi_sekolah/createBobotKriteria';
	    	$('#btnloading').attr("hidden", "hidden");
			$('#btncluster').removeAttr("hidden");

		});
	});
	
</script>