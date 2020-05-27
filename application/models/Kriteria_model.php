<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Kriteria_model extends CI_Model {

	public function getAllKriteria()
	{
		return $this->db->get('kriteria')->result_array();
	}

	public function getKriteria($id)
	{
		return $this->db->get_where('kriteria', ['id_kriteria' => $id])->row_array();
	}

	public function create($data)
	{
		$this->db->insert('kriteria', $data);
	}

	public function update($id, $data)
	{
		$this->db->where('id_kriteria', $id);
		$this->db->update('kriteria', $data);
	}

	public function delete($id)
	{
		$this->db->where('id_kriteria', $id);
		$this->db->delete('kriteria');
	}

}

/* End of file Kriteria_model.php */
/* Location: ./application/models/Kriteria_model.php */