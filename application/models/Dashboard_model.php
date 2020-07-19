<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard_model extends CI_Model {

	public function totalUser()
	{
		return $this->db->count_all('user'); 
	}

	public function totalKriteria()
	{
		return $this->db->count_all('kriteria'); 
	}

	public function totalSekolah()
	{
		return $this->db->count_all('sekolah'); 
	}

	public function totalNilaiTerisi()
	{	
		$query = "SELECT COUNT(sekolah.id_sekolah) as terisi_lengkap FROM sekolah JOIN nilai ON sekolah.id_sekolah = nilai.id_sekolah GROUP BY sekolah.id_sekolah HAVING COUNT(nilai.id_nilai) = (SELECT COUNT(id_kriteria) FROM kriteria)";

		return $this->db->query($query)->row_array();
	}

}

/* End of file Dashboard_model.php */
/* Location: ./application/models/Dashboard_model.php */