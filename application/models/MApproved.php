<?php
defined('BASEPATH') OR exit ('No direct script access allowed');

class MApproved extends CI_Model
{
    private $tbl = 'inv_approved_history';
    private $view = 'v_approved_history';

    public function show($where='')
    {
        $this->db->select('*');
        $this->db->from($this->view);
        if (@$where && $where != null) {
            $this->db->where($where);
        }
        $this->db->order_by('id_approved_history', 'asc');
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

    public function showMax($where='')
    {
        $this->db->select_max('ordered');
        if (@$where && $where != null) {
            $this->db->where($where);
        }
        return $this->db->get($this->tbl);
    }

//biar statusnya jadi 1
    // public function updateStatus($approved_id)
    // {
    //     $this->db->set('status_approved', 1, FALSE);
    //     $where = array('id_approved_history' => $approved_id);
    //     $this->db->where($where);
    //     $this->db->update('inv_approved_history');
    // }
}
?>