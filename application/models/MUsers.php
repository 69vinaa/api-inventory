<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MUsers extends CI_Model {

	private $tbl = 'users';
	private $view = 'v_users';

	public function show($where='')
	{
		$this->db->select('*');
		$this->db->from($this->view);
		if (@$where) {
			$this->db->where($where);
		}
		$this->db->order_by('id_divisi', 'desc');
		$this->db->order_by('name', 'asc');
		return $this->db->get();
	}	

}

/* End of file MUsers.php */
/* Location: ./application/models/MUsers.php */