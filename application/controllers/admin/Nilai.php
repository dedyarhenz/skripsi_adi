<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Nilai extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		if (!$this->session->userdata('username') && $this->session->userdata('id_role') != 1) {
			redirect('auth');
		}
		$this->load->library('form_validation');
		$this->load->model('Sekolah_model');
		$this->load->model('Kriteria_model');
		$this->load->model('User_model');
		$this->load->model('Nilai_model');
	}

	public function index()
	{
		$data['title'] = 'Data Nilai';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data['sekolah_list'] = $this->Sekolah_model->getAllSekolah();

		$this->load->view('admin/nilai/index', $data);		
	}

	public function list($id)
	{
		$data['title'] = 'Data Nilai';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data['sekolah_data'] = $this->Sekolah_model->getSekolah($id);
		$data['nilai_list'] = $this->Nilai_model->getNilaiSekolah($id);
		$data['cek_nilai'] = count($this->Kriteria_model->getKriteriaDoesntHave($id));

		$this->load->view('admin/nilai/list', $data);
	}

	public function create($id_sekolah)
	{
		$data['title'] = 'Data Nilai';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data['sekolah_data'] = $this->Sekolah_model->getSekolah($id_sekolah);
		$data['kriteria_list'] = $this->Kriteria_model->getKriteriaDoesntHave($id_sekolah);

		$this->form_validation->set_rules('id_kriteria', 'Kriteria', 'trim|required|numeric');
		$this->form_validation->set_rules('nilai', 'Nilai', 'trim|required|numeric');

		if ($this->form_validation->run() == false) {						
			$this->load->view('admin/nilai/add', $data);
		} else {
			$data = [
				'id_sekolah'	=> html_escape($id_sekolah),
				'id_kriteria'	=> $this->input->post('id_kriteria', true),
				'nilai'			=> $this->input->post('nilai', true),
			];
			
			$this->Nilai_model->create($data);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil di Simpan</div>');
			redirect('admin/nilai/list/'.$id_sekolah);
		}

	}

	public function update($id, $id_sekolah)
	{
		$data['title'] = 'Data Nilai';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data['sekolah_data'] = $this->Sekolah_model->getSekolah($id_sekolah);
		$data['nilai_data'] = $this->Nilai_model->getNilai($id);						

		$this->form_validation->set_rules('nilai', 'Nilai', 'trim|required|numeric');

		if ($this->form_validation->run() == false) {						
			$this->load->view('admin/nilai/edit', $data);
		} else {
			$data = [
				'nilai'			=> $this->input->post('nilai', true),
			];
			$this->Nilai_model->update($id, $data);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil di Update</div>');
			redirect('admin/nilai/list/'.$id_sekolah);
		}

	}

	public function delete($id)
	{
		$data = $this->Nilai_model->getNilai($id);
		if (empty($data)) {
			$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Data tidak Ada</div>');
			redirect('admin/nilai');
		}

		$this->Nilai_model->delete($id);
		$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil di Hapus</div>');
		redirect('admin/nilai/list');
	}

}

/* End of file Nilai.php */
/* Location: ./application/controllers/admin/Nilai.php */