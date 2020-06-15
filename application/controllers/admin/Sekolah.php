<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sekolah extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		if (!$this->session->userdata('username') && $this->session->userdata('id_role') != 1) {
			redirect('auth');
		}
		$this->load->library('form_validation');
		$this->load->model('Sekolah_model');
		$this->load->model('User_model');
	}

	public function index()
	{
		$data['title'] = 'Data Sekolah';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data['sekolah_list'] = $this->Sekolah_model->getAllSekolah();

		$this->load->view('admin/sekolah/index', $data);		
	}

	public function create()
	{
		$data['title'] = 'Data Sekolah';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));

		$this->form_validation->set_rules('nama_sekolah', 'Nama Sekolah', 'trim|required');
		$this->form_validation->set_rules('nama_kepala_sekolah', 'Nama Kepala Sekolah', 'trim|required');
		$this->form_validation->set_rules('alamat_sekolah', 'Alamat Sekolah', 'trim|required');
		$this->form_validation->set_rules('nomor_telepon', 'Nomor Telepon', 'trim|required');
		$this->form_validation->set_rules('latitude', 'Latitude', 'trim|required|decimal');
		$this->form_validation->set_rules('longtitude', 'Longtitude', 'trim|required|decimal');

		if ($this->form_validation->run() == false) {						
			$this->load->view('admin/sekolah/add', $data);
		} else {
			$data = [
				'nama_sekolah'			=> $this->input->post('nama_sekolah', true),
				'nama_kepala_sekolah'	=> $this->input->post('nama_kepala_sekolah', true),
				'alamat_sekolah'		=> $this->input->post('alamat_sekolah', true),
				'no_telepon'			=> $this->input->post('nomor_telepon', true),
				'latitude'				=> $this->input->post('latitude', true),
				'longtitude'			=> $this->input->post('longtitude', true),
			];
			
			$this->Sekolah_model->create($data);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil di Simpan</div>');
			redirect('admin/sekolah');
		}

	}

	public function update($id)
	{
		$data['title'] = 'Data Sekolah';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data['sekolah_data'] = $this->Sekolah_model->getSekolah($id);						

		$this->form_validation->set_rules('nama_sekolah', 'Nama Sekolah', 'trim|required');
		$this->form_validation->set_rules('nama_kepala_sekolah', 'Nama Kepala Sekolah', 'trim|required');
		$this->form_validation->set_rules('alamat_sekolah', 'Alamat Sekolah', 'trim|required');
		$this->form_validation->set_rules('nomor_telepon', 'Nomor Telepon', 'trim|required');
		$this->form_validation->set_rules('latitude', 'Latitude', 'trim|required|decimal');
		$this->form_validation->set_rules('longtitude', 'Longtitude', 'trim|required|decimal');


		if ($this->form_validation->run() == false) {						
			$this->load->view('admin/sekolah/edit', $data);
		} else {
			$data = [
				'nama_sekolah'			=> $this->input->post('nama_sekolah', true),
				'nama_kepala_sekolah'	=> $this->input->post('nama_kepala_sekolah', true),
				'alamat_sekolah'		=> $this->input->post('alamat_sekolah', true),
				'no_telepon'			=> $this->input->post('nomor_telepon', true),
				'latitude'				=> $this->input->post('latitude', true),
				'longtitude'			=> $this->input->post('longtitude', true),
			];
			$this->Sekolah_model->update($id, $data);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil di Update</div>');
			redirect('admin/sekolah');
		}

	}

	public function delete($id)
	{
		$data = $this->Sekolah_model->getSekolah($id);
		if (empty($data)) {
			$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Data tidak Ada</div>');
			redirect('admin/sekolah');
		}

		$this->Sekolah_model->delete($id);
		$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil di Hapus</div>');
		redirect('admin/sekolah');
	}


}

/* End of file Sekolah.php */
/* Location: ./application/controllers/admin/Sekolah.php */