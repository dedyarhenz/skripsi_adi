<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		if (!$this->session->userdata('username') && $this->session->userdata('role') != 1) {
			redirect('auth');
		}
		$this->load->model('User_model');
		$this->load->library('form_validation');
	}

	public function index()
	{
		$data['title'] = 'User';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data['user_list'] = $this->User_model->getAllUser();

		$this->load->view('admin/user/index', $data);
	}

	public function create()
	{
		$data['title'] = 'User';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));

		$this->form_validation->set_rules('nama', 'Nama', 'trim|required');
		$this->form_validation->set_rules('username', 'Username', 'required|is_unique[user.username]');
		$this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[6]|matches[password2]', [
			'matches'		=> 'Password not match',
			'min_length'	=> 'Password min 6 char'
		]);
		$this->form_validation->set_rules('password2', 'Password', 'required|trim|matches[password1]');
		$this->form_validation->set_rules('role', 'Role', 'required|trim');

		if ($this->form_validation->run() == false) {						
			$this->load->view('admin/user/add', $data);
		} else {
			$upload_image = $_FILES['foto'];
			if ($upload_image) {
				$config['upload_path'] = './assets/img/profile/';
				$config['allowed_types'] = 'gif|jpg|png';
				$config['max_size']     = '2048';
				$this->load->library('upload', $config);

				if ($this->upload->do_upload('foto')) {
					$data = [
						'nama'			=> $this->input->post('nama', true),
						'username'		=> $this->input->post('username', true),
						'password'		=> password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
						'foto'			=> $this->upload->data('file_name'),
						'role'			=> $this->input->post('role', true),
					];
				} else {
					$error = $this->upload->display_errors();
					$this->session->set_flashdata('message', $error);
					redirect('admin/user/create');
				}
				
			}else{
				$data = [
					'nama'			=> $this->input->post('nama', true),
					'username'		=> $this->input->post('username', true),
					'password'		=> password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
					'foto'			=> 'default.jpg',
					'role'			=> $this->input->post('role', true),
				];
			}
			
			$this->User_model->create($data);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil di Simpan</div>');
			redirect('admin/user');
		}

	}

	public function update($id)
	{
		$data['title'] = 'User';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data['user_data'] = $this->User_model->getUser($id);						

		$this->form_validation->set_rules('nama', 'Nama', 'trim|required');
		$this->form_validation->set_rules('username', 'Username', 'required');
		$this->form_validation->set_rules('role', 'Role', 'required|trim');

		if ($this->form_validation->run() == false) {
			$this->load->view('admin/user/edit', $data);
		} else {
			$upload_image = $_FILES['foto'];
			if ($upload_image) {
				$config['upload_path'] = './assets/img/profile/';
				$config['allowed_types'] = 'gif|jpg|png';
				$config['max_size']     = '2048';
				$this->load->library('upload', $config);

				if ($this->upload->do_upload('foto')) {
					$old_image = $data['user_data']['foto'];
					if ($old_image != 'default.jpg') {
						unlink(FCPATH . 'assets/img/profile/' . $old_image);
					}

					$data = [
						'nama'			=> $this->input->post('nama', true),
						'username'		=> $this->input->post('username', true),
						'role'			=> $this->input->post('role', true),
						'foto'			=> $this->upload->data('file_name'),
					];
				} else {
					$error = $this->upload->display_errors();
					$this->session->set_flashdata('message', $error);
					redirect('admin/user/update/'.$id);
				}
				
			}else{
				$data = [
					'nama'			=> $this->input->post('nama', true),
					'username'		=> $this->input->post('username', true),
					'role'			=> $this->input->post('role', true),
				];
			}
			$this->User_model->update($id, $data);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil di Update</div>');
			redirect('admin/user');
		}

	}

	public function delete($id)
	{
		$data = $this->User_model->getUser($id);
		if (empty($data)) {
			$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Data tidak Ada</div>');
			redirect('admin/user');
		}

		$old_image = $data['foto'];
		if ($old_image != 'default.jpg') {
			unlink(FCPATH . 'assets/img/profile/' . $old_image);
		}
		$this->User_model->delete($id);
		$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil di Hapus</div>');
		redirect('admin/user');
	}

	

}

/* End of file User.php */
/* Location: ./application/controllers/admin/User.php */