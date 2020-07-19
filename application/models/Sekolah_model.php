<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sekolah_model extends CI_Model {

	public function getAllSekolah()
	{
		return $this->db->get('sekolah')->result_array();
	}

	public function getAllSekolahCountNilai()
	{	
		$this->db->select('*, sekolah.id_sekolah as id_sekolah, COUNT(nilai.id_sekolah) as nilai_terisi');
		$this->db->from('sekolah');
		$this->db->join('nilai', 'nilai.id_sekolah = sekolah.id_sekolah', 'left');
		$this->db->group_by('sekolah.id_sekolah');
		return $this->db->get()->result_array();
	}

	public function getSekolah($id)
	{
		return $this->db->get_where('sekolah', ['id_sekolah' => $id])->row_array();
	}

	public function create($data)
	{
		$this->db->insert('sekolah', $data);
	}

	public function update($id, $data)
	{
		$this->db->where('id_sekolah', $id);
		$this->db->update('sekolah', $data);
	}

	public function delete($id)
	{
		$this->db->where('id_sekolah', $id);
		$this->db->delete('sekolah');
	}

}

/* End of file Sekolah_model.php */
/* Location: ./application/models/Sekolah_model.php */