<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sekolah extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		if (!$this->session->userdata('username') && $this->session->userdata('role') != 1) {
			redirect('auth');
		}
		$this->load->model('sekolah_model');
		$this->load->model('user_model');
	}

	public function index()
	{
		$data['title'] = 'Sekolah';
		$data['user'] = $this->user_model->getUserWithUsername($this->session->userdata('username'));
		$data['sekolah_list'] = $this->sekolah_model->getAllSekolah();

		$this->load->view('admin/sekolah/index', $data);		
	}

}

/* End of file Sekolah.php */
/* Location: ./application/controllers/admin/Sekolah.php */