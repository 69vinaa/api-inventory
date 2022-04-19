<?php
defined('BASEPATH') OR exit ('No direct script access allowed');

class MApprovedBy extends CI_Model
{
    private $tbl = 'approved_by';

    public function show($where='')
    {
        $this->db->select('*');
        $this->db->from($this->tbl);
        if (@$where && $where != null) {
            $this->db->where($where);
        }
        $this->db->order_by('id', 'asc');
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
        $this->db->update($this->$tbl, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }
}
?>