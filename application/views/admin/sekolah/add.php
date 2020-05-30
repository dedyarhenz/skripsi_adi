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
			      <h6 class="m-0 font-weight-bold text-primary">Form Tambah Sekolah</h6>
			    </div>
			    <div class="card-body">
					<form action="<?= base_url('admin/sekolah/create') ?>" method="post">
						<div class="col-lg-10 offset-lg-1">
							<div class="row">
								<div class="col-lg">
									<div class="form-group">
									    <label for="nama_sekolah">Nama Sekolah</label>
									    <input type="text" class="form-control" id="nama_sekolah" name="nama_sekolah" placeholder="Masukkan Nama Sekolah" value="<?= set_value('nama_sekolah') ?>">
									    <?= form_error('nama_sekolah', '<small class="text-danger">', '</small>') ?>
								 	</div>
								</div>
								<div class="col-lg">
									 <div class="form-group">
									    <label for="nama_kepala_sekolah">Nama Kepala Sekolah</label>
									    <input type="text" class="form-control" id="nama_kepala_sekolah" name="nama_kepala_sekolah" placeholder="Masukkan Nama Kepala Sekolah" value="<?= set_value('nama_kepala_sekolah') ?>">
									    <?= form_error('nama_kepala_sekolah', '<small class="text-danger">', '</small>') ?>
								  	</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg">
									<div class="form-group">
									    <label for="alamat_sekolah">Alamat Sekolah</label>
									    <input type="text" class="form-control" id="alamat_sekolah" name="alamat_sekolah" placeholder="Masukkan Alamat Sekolah" value="<?= set_value('alamat_sekolah') ?>">
									    <?= form_error('alamat_sekolah', '<small class="text-danger">', '</small>') ?>
								  	</div>	
								</div>
								<div class="col">
									<div class="form-group">
									    <label for="nomor_telepon">Nomor Telepon</label>
									    <input type="text" class="form-control" id="nomor_telepon" name="nomor_telepon" placeholder="Masukkan Nomor Telepon" value="<?= set_value('nomor_telepon') ?>">
									    <?= form_error('nomor_telepon', '<small class="text-danger">', '</small>') ?>
								  	</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div class="form-group">
									    <label for="latitude">Latitude</label>
									    <input type="text" class="form-control" id="latitude" name="latitude" placeholder="Masukkan Latitude" value="<?= set_value('latitude') ?>">
									    <?= form_error('latitude', '<small class="text-danger">', '</small>') ?>
								  	</div>		
								</div>
								<div class="col">
									<div class="form-group">
									    <label for="longtitude">Longtitude</label>
									    <input type="text" class="form-control" id="longtitude" name="longtitude" placeholder="Masukkan Longtitude" value="<?= set_value('longtitude') ?>">
									    <?= form_error('longtitude', '<small class="text-danger">', '</small>') ?>
								  	</div>		
								</div>
							</div>

						  	<hr>
						 	<div class="form-group text-right">
						 		<label></label>
								<button class="btn btn-success">Simpan</button>
								<a href="<?= base_url('admin/sekolah'); ?>" class="btn btn-secondary">Batal</a>
							</div>
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
