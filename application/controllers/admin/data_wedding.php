<?php 

	class Data_wedding extends CI_Controller{

		public function __construct(){
			parent::__construct();

			if ($this->session->userdata('role_id') != '1'){
				$this->session->set_flashdata('pesan','<div class="alert alert-danger alert-dismissible fade show" role="alert">
				  Anda Belum Login!
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				  <span aria-hidden="true">&times;</span>
				  </button>
				</div>');
				redirect('auth/login');
			}
		}


		
		public function index()
		{
			$data['barang'] = $this->model_barang->tampil_data()->result();
			$this->load->view('templates_admin/header');
			$this->load->view('templates_admin/sidebar');
			$this->load->view('admin/data_wedding', $data);
			$this->load->view('templates_admin/footer');
		}


		public function tambah_aksi()
		{

		$nama_wo 	= $this->input->post('nama_wo');
		$keterangan = $this->input->post('keterangan');
		$kategori 	= $this->input->post('kategori');
		$harga 		= $this->input->post('harga');
		$stok 		= $this->input->post('stok');
		$gambar  	= $_FILES['gambar']['name'];
		if ($gambar = ''){}else{
			$config ['upload_path'] = './uploads';
			$config ['allowed_types'] = 'jpg|jpeg|png|gif';

			$this->load->library('upload', $config);
			if(!$this->upload->do_upload('gambar'))
			{
				echo "Gambar Gagal diUpload!!!";
			}
			else
			{
				$gambar=$this->upload->data('file_name');
			}
			}

		$data = array (
			'nama_wo' => $nama_wo,
			'keterangan' => $keterangan,
			'kategori' => $kategori,
			'harga' => $harga,
			'stok' => $stok,
			'gambar' => $gambar
		);

		$this->model_barang->tambah_barang($data, 'tb_wedding');
		redirect('admin/data_wedding/index');
	}


	public function edit($id)
	{
		$where = array('id_wo' =>$id);
		$data['barang'] = $this->model_barang->edit_wedding($where, '
			tb_wedding')->result();
		$this->load->view('templates_admin/header');
		$this->load->view('templates_admin/sidebar');
		$this->load->view('admin/edit_wedding', $data);
		$this->load->view('templates_admin/footer');


	}

	public function update(){
		$id 	    =$this->input->post('id_wo');
		$nama_wo 	=$this->input->post('nama_wo');
		$keterangan	=$this->input->post('keterangan');
		$kategori	=$this->input->post('kategori');
		$harga	=$this->input->post('harga');
		$stok	 	=$this->input->post('stok');

		$data = array(

			'nama_wo' => $nama_wo,
			'keterangan' => $keterangan,
			'kategori' 	=> $kategori,
			'harga'		=> $harga,
			'stok' 		=> $stok
		);

		$where = array(

			'id_wo' => $id
		);

		$this->model_barang->update_data($where,$data,'tb_wedding');
		redirect('admin/data_wedding/index');
	}


	public function hapus($id){

		$where = array('id_wo' => $id);
		$this->model_barang->hapus_data($where, 'tb_wedding');
		redirect('admin/data_wedding/index');
	}

	
	public function detail($id_wo){

		$data['barang'] = $this->model_barang->detail_brg($id_wo);
		$this->load->view('templates_admin/header');
		$this->load->view('templates_admin/sidebar');
		$this->load->view('admin/detail_produk', $data);
		$this->load->view('templates_admin/footer');
	}
}

