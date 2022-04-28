<?php
defined('BASEPATH') OR exit ('No direct script access allowed');

class MDetailBarang extends CI_Model
{
    private $detail_barang = 'inv_detail_barang';
    private $v_detail_barang = 'v_detail_barang';

    public function show($where='')
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

    public function insert($object)
    {
        $this->db->insert($this->detail_barang, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function update($where, $object)
    {
        $this->db->where($where);
        $this->db->update($this->detail_barang, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function delete($where)
    {
        $this->db->where($where);
        $this->db->delete($this->detail_barang);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function sumStok($where)
    {
        $this->db->select_sum('stok');
        if(@$where && $where != null)
        {
            $this->db->where($where);
        }
        return $this->db->get($this->v_detail_barang); 
    }
}
?>