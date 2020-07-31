<?php
defined('BASEPATH') OR exit('No direct script access allowed');
// Import library
use Phpml\Clustering\KMeans;

class Rekomendasi_sekolah extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		is_logged_in();
		$this->load->library('form_validation');
		$this->load->model('User_model');
		$this->load->model('Sekolah_model');
		$this->load->model('Kriteria_model');
		$this->load->model('Rekomendasi_sekolah_model');
		$this->load->model('Nilai_model');
		$this->load->model('Hasil_ahp_model');
	}

	public function index()
	{
		$data['title'] = 'Rekomendasi Sekolah';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		// $data['sekolah'] = $this->Sekolah_model->getAllSekolah();
		$data['sekolah'] = $this->Sekolah_model->getAllSekolahBiaya();

		$this->load->view('admin/rekomendasi_sekolah/index', $data);		
	}


	public function createCluster()
	{
		$user = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data_jarak = $this->input->post('data_jarak', true);
		
		$data_samples = array();
		foreach ($data_jarak as $key) {
			$jarakToKm = round($key['jarak'] / 1000, 2);
			$biaya = intval($key['biaya']);
			$data_samples[$key['id_sekolah']] = [$jarakToKm, $biaya];
		}

		// $kmeans = new KMeans(3);
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
		echo json_encode(["message" => "Data Berhasil di simpan", "data" => $result_cluster]);
	}

	public function cluster_hasil_ahp()
	{
		$data['title'] = 'Rekomendasi Sekolah';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data['hasil_ahp'] = $this->Hasil_ahp_model->getHasilAhpUser($data['user']['id_user']);
		$data['cluster'] = $this->Rekomendasi_sekolah_model->getClusterUser($data['user']['id_user']);
		$data['cluster_detail'] = $this->Rekomendasi_sekolah_model->getDetailClusterUser($data['user']['id_user']);

		$this->load->view('admin/rekomendasi_sekolah/hasil_ahp', $data);
	}

	public function createBobotKriteria()
	{
		$data['title'] = 'Rekomendasi Sekolah';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data['kriteria'] = $this->Kriteria_model->getAllKriteria();
		$data['cluster'] = $this->Rekomendasi_sekolah_model->getClusterUser($data['user']['id_user']);
		$data['cluster_detail'] = $this->Rekomendasi_sekolah_model->getDetailClusterUser($data['user']['id_user']);

		foreach ($data['kriteria'] as $keyRow) {
			foreach ($data['kriteria'] as $keyCol) {
				$this->form_validation->set_rules($keyRow['id_kriteria'] . '_' . $keyCol['id_kriteria'], $keyRow['id_kriteria'] . '_' . $keyCol['id_kriteria'], 'trim|required');
			}
		}

		if ($this->form_validation->run() == false) {
			$this->load->view('admin/rekomendasi_sekolah/bobot_kriteria', $data);
		} else {


			// hitung ranking ahp setiap cluster
			foreach ($data['cluster'] as $key_cluster => $value_cluster) {
				// hapus hasil_ahp lama 
				$this->Hasil_ahp_model->deleteHasilAhpCluster($value_cluster['id_cluster']);

				// hitung ahp dan simpan
				$data_cluster = $this->Rekomendasi_sekolah_model->getPerDetailClusterUser($data['user']['id_user'], $value_cluster['id_cluster']);
				$hasil = $this->_hitungAhp($data_cluster);
				foreach ($hasil as $key => $value) {

					/* gunakan ini jika format column di database beda*/
					// $data_map = [
					// 	"id_cluster"	=> $value['id_cluster'],
					// 	"id_sekolah"	=> $value['id_sekolah'],
					// 	"nilai_hasil"	=> $value['hasil'],
					// 	"ranking"		=> $value['ranking'],
					// ];
					// $this->Hasil_ahp_model->create($data_map);


					$this->Hasil_ahp_model->create($value);
				}
			}

			redirect('admin/Rekomendasi_sekolah/cluster_hasil_ahp');

		}

	}

	private function _hitungAhp($data_cluster){
		// hitung data kriteria
		$data_bobot_kriteria = $this->_bobot();
		$jumlah_bobot_kriteria = $this->_jumlahBobot($data_bobot_kriteria);

		$data_normalisasi_kriteria = $this->_normalisasi($data_bobot_kriteria, $jumlah_bobot_kriteria);
		$jumlah_normalisasi_kriteria = $this->_jumlahNormalisasi($data_normalisasi_kriteria);

		$data_rata_eigen = $this->_rataEigen($data_normalisasi_kriteria);
		// end hitung data kriteria

		// hitung data alternatif
		$data_bobot_alternatif = $this->_bobotAlternatif($data_cluster);
		$jumlah_bobot_alternatif = $this->_jumlahBobotAlternatif($data_bobot_alternatif);

		$data_normalisasi_alternatif = $this->_normalisasiAlternatif($data_bobot_alternatif, $jumlah_bobot_alternatif);
		$jumlah_normalisasi_alternatif = $this->_jumlahNormalisasiAlternatif($data_normalisasi_alternatif);

		$data_eigen_alternatif_kriteria = $this->_eigenAlternatifKriteria($data_normalisasi_alternatif, $data_rata_eigen);
		$data_hasil = $this->_hasilAkhir($data_eigen_alternatif_kriteria);
		// end hitung data alternatif


		// echo '<pre>';
		// var_dump($data_hasil);
		// echo '</pre>';
		return $data_hasil;
	}

	private function _bobot()
	{
		// map bobot input to array
		$data['kriteria'] = $this->Kriteria_model->getAllKriteria();
		$data_input = $this->input->post(NULL, TRUE);
		$data_bobot = [];
		foreach ($data['kriteria'] as $key => $value) {
			$data_bobot[$key] = [
				"id_kriteria" 	=> $value['id_kriteria'],
				"perbandingan"	=> [],
			];

			foreach ($data_input as $key_input => $value_input) {
				$kriteria_id = explode("_", $key_input);
				if ($value['id_kriteria'] == $kriteria_id[0]) {
					array_push($data_bobot[$key]["perbandingan"], [
						"id_kriteria" 	=> $kriteria_id[1],
						"nilai"			=> $value_input,
					]);
				}
			}
		}

		return $data_bobot;
	}

	private function _jumlahBobot($data_bobot)
	{
		$jumlah_bobot = [];
		foreach ($data_bobot as $key1 => $value1) {
			$hasil = 0;
			foreach ($data_bobot as $key2 => $value2) {	
				$hasil += (double)$value2['perbandingan'][$key1]['nilai']; 
			}
			array_push($jumlah_bobot, [
				"id_kriteria" 	=> $value1['id_kriteria'],
				"jumlah_bobot"	=> $hasil,
			]);
		}
		return $jumlah_bobot;
	}

	private function _normalisasi($data_bobot, $jumlah_bobot)
	{
		$data_normalisasi = [];
		foreach ($data_bobot as $key => $value) {
			$data_normalisasi[$key] = [
				"id_kriteria" 	=> $value['id_kriteria'],
				"perbandingan"	=> [],
			];
			foreach ($value['perbandingan'] as $key2 => $perbandingan) {
				foreach ($jumlah_bobot as $key3 => $jml_bobot) {
					if ($jml_bobot['id_kriteria'] == $perbandingan['id_kriteria']) {
						array_push($data_normalisasi[$key]["perbandingan"], [
							"id_kriteria" 		=> $perbandingan['id_kriteria'],
							"nilai_normalisasi"	=> (double)$perbandingan['nilai']/(double)$jml_bobot['jumlah_bobot'],
						]);
					}
				}
			}
		}
		// echo '<pre>';
		// var_dump($data_normalisasi);
		// echo '</pre>';
		return $data_normalisasi;
	}

	private function _jumlahNormalisasi($data_normalisasi)
	{
		$jumlah_normalisasi = [];
		foreach ($data_normalisasi as $key1 => $value1) {
			$hasil = 0;
			foreach ($data_normalisasi as $key2 => $value2) {	
				$hasil += (double)$value2['perbandingan'][$key1]['nilai_normalisasi']; 
			}
			array_push($jumlah_normalisasi, [
				"id_kriteria" 			=> $value1['id_kriteria'],
				"jumlah_normalisasi"	=> $hasil,
			]);
		}
		// echo '<pre>';
		// var_dump($jumlah_normalisasi);
		// echo '</pre>';
		return $jumlah_normalisasi;
	}

	private function _rataEigen($data_eigen)
	{
		$rata_eigen = [];
		foreach ($data_eigen as $key1 => $value1) {
			$hasil = 0;
			foreach ($value1['perbandingan'] as $key2 => $value2) {	
				$hasil += (double)$value2['nilai_normalisasi']; 
				
			}
			array_push($rata_eigen, [
				"id_kriteria" 	=> $value1['id_kriteria'],
				"rata_eigen"	=> (double)$hasil/(double)count($data_eigen),
			]);
		}
		// echo '<pre>';
		// var_dump($rata_eigen);
		// echo '</pre>';
		return $rata_eigen;
	}

	private function _bobotAlternatif($data_cluster)
	{
		// map bobot database to array
		$data['sekolah'] = $data_cluster;
		$data['kriteria'] = $this->Kriteria_model->getAllKriteria();
		$data['nilai'] = $this->Nilai_model->getAllNilai();
		$total_biaya = $this->Nilai_model->getTotalBiaya();
		$nilai_proses = array();

		// // ubah biaya ke persentase (biaya nilai kecil memeiliki bobottinggi)
		// foreach ($data['nilai'] as $key => $value) {
		// 	if ($value['id_kriteria'] == 3) {
				
		// 		$biaya_ganti = $value;
		// 		$persen = ($total_biaya['nilai']-$value['nilai'])/$total_biaya['nilai']*100;
		// 		$biaya_ganti['nilai'] = $value['nilai']*-1;

		// 		array_push($nilai_proses, $biaya_ganti);	
		// 	}else{
		// 		array_push($nilai_proses, $value);	
		// 	}
		// }
		// $data['nilai'] = $nilai_proses;
		// // end


		$data_bobot = [];
		foreach ($data['sekolah'] as $key => $value) {
			$data_bobot[$key] = [
				"id_sekolah" 	=> $value['id_sekolah'],
				"id_cluster"	=> $value['id_cluster'],
				"nilai_sekolah"	=> [],
			];

			foreach ($data['kriteria'] as $key_kriteria => $value_kriteria) {
				// set default nilai
				array_push($data_bobot[$key]["nilai_sekolah"], [
					"id_kriteria" 	=> $value_kriteria['id_kriteria'],
					"nilai"			=> 0,
				]);
				foreach ($data['nilai'] as $key_nilai => $value_nilai) {
					// set nilai jika tersedia dari table nilai
					if ($value['id_sekolah'] == $value_nilai['id_sekolah'] && $value_nilai['id_kriteria'] == $value_kriteria['id_kriteria']) {
						$data_bobot[$key]['nilai_sekolah'][$key_kriteria]['nilai'] = $value_nilai['nilai'];
					}
				}
			}
		}
		// echo '<pre>';
		// var_dump($nilai_proses);
		// echo '</pre>';
		// die();

		return $data_bobot;
	}

	private function _jumlahBobotAlternatif($data_bobot)
	{
		$data['kriteria'] = $this->Kriteria_model->getAllKriteria();
		$jumlah_bobot = [];
		foreach ($data['kriteria'] as $key_kriteria => $value_kriteria) {
			$hasil = 0;
			foreach ($data_bobot as $key_bobot => $value_bobot) {	
				$hasil += (double)$value_bobot['nilai_sekolah'][$key_kriteria]['nilai']; 
			}
			array_push($jumlah_bobot, [
				"id_kriteria" 	=> $value_kriteria['id_kriteria'],
				"jumlah_bobot"	=> $hasil,
			]);
		}
		// echo '<pre>';
		// var_dump($jumlah_bobot);
		// echo '</pre>';
		return $jumlah_bobot;
	}

	private function _normalisasiAlternatif($data_bobot, $jumlah_bobot)
	{
		$data_normalisasi = [];
		foreach ($data_bobot as $key_bobot => $value_bobot) {
			$data_normalisasi[$key_bobot] = [
				"id_sekolah" 	=> $value_bobot['id_sekolah'],
				"id_cluster"	=> $value_bobot['id_cluster'],
				"nilai_sekolah"	=> [],
			];
			foreach ($value_bobot['nilai_sekolah'] as $key_nilai_sekolah => $value_nilai_sekolah) {
				foreach ($jumlah_bobot as $key_jml_bobot => $value_jml_bobot) {

					if ($value_jml_bobot['id_kriteria'] == $value_nilai_sekolah['id_kriteria']) {
						array_push($data_normalisasi[$key_bobot]["nilai_sekolah"], [
							"id_kriteria" 		=> $value_nilai_sekolah['id_kriteria'],
							"nilai_normalisasi"	=> (double)$value_jml_bobot['jumlah_bobot'] != 0 ? (double)$value_nilai_sekolah['nilai']/(double)$value_jml_bobot['jumlah_bobot'] : 0,
						]);
					}
				}
			}
		}
		// echo '<pre>';
		// var_dump($data_normalisasi);
		// echo '</pre>';
		return $data_normalisasi;
	}

	private function _jumlahNormalisasiAlternatif($data_normalisasi)
	{
		$data['kriteria'] = $this->Kriteria_model->getAllKriteria();
		$jumlah_normalisasi = [];
		foreach ($data['kriteria'] as $key_kriteria => $value_kriteria) {
			$hasil = 0;
			foreach ($data_normalisasi as $key_normalisasi => $value_normalisasi) {	
				$hasil += (double)$value_normalisasi['nilai_sekolah'][$key_kriteria]['nilai_normalisasi']; 
			}
			array_push($jumlah_normalisasi, [
				"id_kriteria" 			=> $value_kriteria['id_kriteria'],
				"jumlah_normalisasi"	=> $hasil,
			]);
		}
		// echo '<pre>';
		// var_dump($jumlah_normalisasi);
		// echo '</pre>';
		return $jumlah_normalisasi;
	}

	private function _eigenAlternatifKriteria($normalisasi_alternatif, $data_rata_eigen)
	{
		$data_alternatif_kriteria = [];
		foreach ($normalisasi_alternatif as $key_normalisasi_alternatif => $value_normalisasi_alternatif) {
			$data_alternatif_kriteria[$key_normalisasi_alternatif] = [
				"id_sekolah" 	=> $value_normalisasi_alternatif['id_sekolah'],
				"id_cluster"	=> $value_normalisasi_alternatif['id_cluster'],
				"nilai_sekolah"	=> [],
			];
			foreach ($value_normalisasi_alternatif['nilai_sekolah'] as $key_nilai_sekolah => $value_nilai_sekolah) {
				foreach ($data_rata_eigen as $key_rata_eigen => $value_rata_eigen) {

					if ($value_rata_eigen['id_kriteria'] == $value_nilai_sekolah['id_kriteria']) {
						array_push($data_alternatif_kriteria[$key_normalisasi_alternatif]["nilai_sekolah"], [
							"id_kriteria" 		=> $value_nilai_sekolah['id_kriteria'],
							"nilai_eigen"		=> (double)$value_nilai_sekolah['nilai_normalisasi']*(double)$value_rata_eigen['rata_eigen'],
						]);
					}
				}
			}
		}
		// echo '<pre>';
		// var_dump($data_alternatif_kriteria);
		// echo '</pre>';
		return $data_alternatif_kriteria;
	}

	private function _hasilAkhir($alternatif_kriteria)
	{
		$hasil_akhir = [];
		foreach ($alternatif_kriteria as $key1 => $value1) {
			$hasil = 0;
			foreach ($value1['nilai_sekolah'] as $key2 => $value2) {	
				$hasil += (double)$value2['nilai_eigen']; 
				
			}

			// cek jika sama sekali belum isi nilai tidak disimpan sebaliknya jika nilai full atau sebagian maka simpan
			if ($hasil != 0) {
				array_push($hasil_akhir, [
					"id_sekolah" 	=> $value1['id_sekolah'],
					"id_cluster"	=> $value1['id_cluster'],
					"nilai_hasil"	=> $hasil,
					"ranking"		=> 0,
				]);
			}
		}

		// sorting nilai kecil ke besar
		usort($hasil_akhir, function($a, $b){
			return $b['nilai_hasil'] <=> $a['nilai_hasil'];
		});

		// ranking sekolah
		$rank = 1;
		foreach ($hasil_akhir as $key => $value) {
			if ($value['nilai_hasil'] != 0) {
				$hasil_akhir[$key]['ranking'] = $rank++;
			}
		}
		// echo '<pre>';
		// var_dump($hasil_akhir);
		// echo '</pre>';
		return $hasil_akhir;
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