<?php 
	
	class Model_barang extends CI_Model{
		public function tampil_data(){
			return $this->db->get('tb_wedding');
		}


		public function tambah_barang($data,$table){
			$this->db->insert($table,$data);
		}

		public function edit_wedding($where,$table){
			return $this->db->get_where($table,$where);
		}

		public function update_data($where,$data,$table){
			$this->db->where($where);
			$this->db->update($table,$data);
		}

		public function hapus_data($where, $table){

			$this->db->where($where);
			$this->db->delete($table);
		}

		public function find($id){

			$result = $this->db->where('id_wo', $id)
							   ->limit(1)
							   ->get('tb_wedding');


			if ($result->num_rows() > 0){

				return $result->row();
			}else{
				return array();
			}
		}

		public function detail_brg($id_wo){

			$result = $this->db->where('id_wo', $id_wo)->get('tb_wedding');
			if($result->num_rows() > 0){
				
				return $result -> result();

			}else{

				return false;
			}
		}

	}

 