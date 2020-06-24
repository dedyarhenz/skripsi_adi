<?php
defined('BASEPATH') OR exit('No direct script access allowed');
// Import library
use Phpml\Clustering\KMeans;

class Rekomendasi_sekolah extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
		$this->load->model('User_model');
		$this->load->model('Sekolah_model');
		$this->load->model('Kriteria_model');
		$this->load->model('Rekomendasi_sekolah_model');
	}

	public function index()
	{
		$data['title'] = 'Rekomendasi Sekolah';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data['sekolah'] = $this->Sekolah_model->getAllSekolah();

		$this->load->view('admin/rekomendasi_sekolah/index', $data);		
	}


	public function createCluster()
	{
		$user = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data_jarak = $this->input->post('data_jarak', true);
		$data_samples = array();
		foreach ($data_jarak as $key) {
			$jarakToKm = round($key['jarak'] / 1000, 2);
			$data_samples[$key['id_sekolah']] = [$jarakToKm];
		}

		$kmeans = new KMeans(3);
		// delete cluster lama
		$this->Rekomendasi_sekolah_model->deleteClusterUser($user['id_user']);

		// create cluster baru
		$result_cluster = $kmeans->cluster($data_samples);		
		foreach ($result_cluster as $key => $cluster) {
			// save data cluster
			$data = [
				"nama_cluster"		=> "cluster " . ($key + 1),
				"id_user"			=> $user['id_user'],
			];
			$id_cluster = $this->Rekomendasi_sekolah_model->createCluster($data);
			// save data detail cluster
			foreach ($cluster as $id_sekolah => $jarak) {
				$data = [
					"id_cluster"	 => $id_cluster,
					"id_sekolah"	 => $id_sekolah,
					"jarak_sekolah"	 => $jarak[0],
				];
				$this->Rekomendasi_sekolah_model->createDetailCluster($data);
			}
		}
		echo json_encode(["message" => "Data Berhasil di simpan"]);
	}

	public function createBobotKriteria()
	{
		$data['title'] = 'Rekomendasi Sekolah';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data['kriteria'] = $this->Kriteria_model->getAllKriteria();
		$data['cluster'] = $this->Rekomendasi_sekolah_model->getClusterUser($data['user']['id_user']);
		$data['cluster_detail'] = $this->Rekomendasi_sekolah_model->getDetailClusterUser($data['user']['id_user']);

		$this->load->view('admin/rekomendasi_sekolah/bobot_kriteria', $data);
	}

// 	public function coretan()
// 	{
// 		$data['title'] = 'Rekomendasi Sekolah';
// 		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
// 		$data_sekolah = $this->Sekolah_model->getAllSekolah();

// 		$sekolah_lokasi = array();
// 		foreach ($data_sekolah as $key) {
// 			$sekolah_lokasi[$key['nama_sekolah']] = [$key['latitude'],$key['longtitude']];
// 		}


// 		$latitudeFrom = $this->input->post('lokasi1lat', true);
// 		$longitudeFrom = $this->input->post('lokasi1lang', true);

// 		$latitudeTo = $this->input->post('lokasi2lat', true);
// 		$longitudeTo = $this->input->post('lokasi2lang', true);

// 		//Calculate distance from latitude and longitude
// 		$theta = $longitudeFrom - $longitudeTo;
// 		$dist = sin(deg2rad($latitudeFrom)) * sin(deg2rad($latitudeTo)) +  cos(deg2rad($latitudeFrom)) * cos(deg2rad($latitudeTo)) * cos(deg2rad($theta));
// 		$dist = acos($dist);
// 		$dist = rad2deg($dist);
// 		$miles = $dist * 60 * 1.1515;

// 		$distance = ($miles * 1.609344).' km';

// 		// var_dump($distance);
// 		// die();
// 		// echo '<pre>';
// 		// 		var_dump($sekolah_lokasi);
// 		// 		die();
// 		// echo '</pre>';

// 		$samples = [[8], [7], [2], [8], [1], [9]];
// 		$samples = [ 'Label1' => [1], 'Label2' => [8], 'Label3' => [2], 'Label4' => [1], 'Label4' => [7], 'Label5' => [3]];
// 		$kmeans = new KMeans(3);
// 		$data['cluster'] = $kmeans->cluster($sekolah_lokasi);

// // echo '<pre>';
// // var_dump($data['cluster']);
// // die();
// // echo '</pre>';
// 		$this->load->view('admin/rekomendasi_sekolah/cluster', $data);
// 	}

}


/* End of file rekomendasi_sekolah.php */
/* Location: ./application/config/rekomendasi_sekolah.php */