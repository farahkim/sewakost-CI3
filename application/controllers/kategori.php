<?php  

	class Kategori extends CI_Controller{

		public function __construct(){
			parent::__construct();

			if ($this->session->userdata('role_id') != '2'){
				$this->session->set_flashdata('pesan','<div class="alert alert-danger alert-dismissible fade show" role="alert">
				  Anda Belum Login!
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				  <span aria-hidden="true">&times;</span>
				  </button>
				</div>');
				redirect('auth/login');
			}
		}

		public function kostvip(){

			$data['kostvip'] = $this->model_kategori->data_kostvip()->result();
			$this->load->view('templates/header');
			$this->load->view('templates/sidebar');
			$this->load->view('kostvip', $data);
			$this->load->view('templates/footer');

		}

		public function kost1(){

			$data['kost1'] = $this->model_kategori->data_kost1()->result();
			$this->load->view('templates/header');
			$this->load->view('templates/sidebar');
			$this->load->view('kost1', $data);
			$this->load->view('templates/footer');

		}

		public function kost2(){

			$data['kost2'] = $this->model_kategori->data_kost2()->result();
			$this->load->view('templates/header');
			$this->load->view('templates/sidebar');
			$this->load->view('kost2', $data);
			$this->load->view('templates/footer');

		}

		public function kost3(){

			$data['kost3'] = $this->model_kategori->data_kost3()->result();
			$this->load->view('templates/header');
			$this->load->view('templates/sidebar');
			$this->load->view('kost3', $data);
			$this->load->view('templates/footer');

		}

		public function kontak(){

			$data['kontak'] = $this->model_kategori->data_kontak()->result();
			$this->load->view('templates/header');
			$this->load->view('templates/sidebar');
			$this->load->view('kontak', $data);
			$this->load->view('templates/footer');

		}
	}