<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MClientPeplink extends CI_Model {

	private $tbl = 'client_peplink_list';

    public function show($where='', $limit='', $offset='')
    {
        $this->db->select('*');
        $this->db->from($this->tbl);
        if(@$where && $where != null)
        {
            $this->db->where($where);
        }
        
        if (@$limit) {
            $this->db->limit(@$limit, @$offset);
        }
        return $this->db->get();
    }

    public function findBranch()
    {
        $this->db->select('dc');
        $this->db->from($this->tbl);
        $this->db->group_by('db');
        return $this->db->get();
    }

    public function insert($object)
    {
        $this->db->insert($this->tbl, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function update($where, $object)
    {
        $this->db->where($where);
        $this->db->update($this->tbl, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function delete($where)
    {
        $this->db->where($where);
        $this->db->delete($this->tbl);
        return(($this->db->affected_rows() > 0) ? true : false);
    }	

}

/* End of file MClientPeplink.php */
/* Location: ./application/models/MClientPeplink.php */