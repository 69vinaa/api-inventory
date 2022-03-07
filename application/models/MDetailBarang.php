<?php
defined('BASEPATH') OR exit ('No direct script access allowed');

class MDetailBarang extends CI_Model
{
    private $detail_barang = 'detail_barang';
    private $v_detail_barang = 'v_detail_barang';

    public function show_detail_barang($where='')
    {
        $this->db->select('*');
        $this->db->from($this->v_detail_barang);
        if(@$where && $where != null)
        {
            $this->db->where($where);
        }
        $this->db->order_by('id_detail_barang', 'asc');
        return $this->db->get();
    }

    public function insert_detail_barang($object)
    {
        $this->db->insert_detail_barang($this->detail_barang, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function update_detail_barang($where, $object)
    {
        $this->db->where($where);
        $this->db->update_detail_barang($this->detail_barang, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function delete_detail_barang($where)
    {
        $this->db->where($where);
        $this->db->delete_detail_barang($this->detail_barang);
        return(($this->tbl->affected_rows() > 0) ? true : false);
    }
}
?>