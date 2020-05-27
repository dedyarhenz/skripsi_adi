<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sekolah_model extends CI_Model {

	public function getAllSekolah()
	{
		return $this->db->get('sekolah')->result_array();
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