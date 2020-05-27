<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_model extends CI_Model {

	public function getUserWithUsername($username)
	{
		return $this->db->get_where('user', ['username' => $username])->row_array();
	}

	public function getAllUser()
	{
		return $this->db->get('user')->result_array();
	}

	public function getUser($id)
	{
		return $this->db->get_where('user', ['id_user' => $id])->row_array();
	}

	public function create($data)
	{
		$this->db->insert('user', $data);
	}

	public function update($id, $data)
	{
		$this->db->where('id_user', $id);
		$this->db->update('user', $data);
	}

	public function delete($id)
	{
		$this->db->where('id_user', $id);
		$this->db->delete('user');
	}

}

/* End of file User_model.php */
/* Location: ./application/models/User_model.php */