<?php 

class Model_kategori extends CI_Model{

	public function data_kostVIP(){

		return $this->db->get_where('tb_wedding', array('kategori' => 'kostvip'));
	}

	public function data_kost1(){

		return $this->db->get_where('tb_wedding', array('kategori' => 'kost1'));
	}

	public function data_kost2(){

		return $this->db->get_where('tb_wedding', array('kategori' => 'kost2'));
	}

	public function data_kost3(){

		return $this->db->get_where('tb_wedding', array('kategori' => 'kost3'));
	}

	public function data_kontak(){

		return $this->db->get_where('tb_wedding', array('kategori' => 'kontak'));
	}
}