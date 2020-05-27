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

}

/* End of file Dashboard_model.php */
/* Location: ./application/models/Dashboard_model.php */