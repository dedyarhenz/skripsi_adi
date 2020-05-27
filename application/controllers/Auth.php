<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
	}

	public function index()
	{
		$this->form_validation->set_rules('username', 'Username', 'trim|required');
		$this->form_validation->set_rules('password', 'Password', 'trim|required');

		if ($this->form_validation->run() == false) {
			$data['title'] = 'Login';		
			$this->load->view('auth/login', $data);			
		} else {
			$username = htmlspecialchars($this->input->post('username', true));
			$password = $this->input->post('password', true);

			$user = $this->db->get_where('user', ['username' => $username])->row_array();
			if ($user) {
				if (password_verify($password, $user['password'])) {
					$data = [
						'username'	=> $user['username'],
						'role'		=> $user['role'],
					];
					$this->session->set_userdata($data);
					if ($user['role'] == 1) {
						redirect('/admin/dashboard');
					} else {
						// redirect('user');
					}
					
				} else {
					$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Password salah</div>');	
					redirect('auth');
				}
				
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Akun tidak terdaftar</div>');	
				redirect('auth');
			}
			
		}
	}

	public function register()
	{	
		$this->form_validation->set_rules('nama', 'Nama', 'trim|required');
		$this->form_validation->set_rules('username', 'Username', 'required|is_unique[user.username]');
		$this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[6]|matches[password2]', [
			'matches'		=> 'Password not match',
			'min_length'	=> 'Password min 6 char'
		]);
		$this->form_validation->set_rules('password2', 'Password', 'required|trim|matches[password1]');

		if ($this->form_validation->run() == false) {
			$data['title'] = 'Register';		
			$this->load->view('auth/register', $data);						
		} else {
			$data = [
				'nama'			=> htmlspecialchars($this->input->post('nama', true)),
				'username'		=> htmlspecialchars($this->input->post('username', true)),
				'password'		=> password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
				'foto'			=> 'default.jpg',
				'role'			=> 2,
			];
			
			$this->db->insert('user', $data);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Berhasil mendaftar. Silahkan login</div>');
			redirect('auth');
		}	
	}

	public function logout()
	{
		$this->session->unset_userdata('username');
		$this->session->unset_userdata('role');
		$this->session->unset_userdata('nama');

		$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Berhasil Logout</div>');
		redirect('auth');
	}

}

/* End of file Auth.php */
/* Location: ./application/controllers/Auth.php */