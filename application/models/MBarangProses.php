<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class MBarang extends CI_Model
{
    private $barang_proses = 'barang_proses';
    private $detail_barang_proses = 'detail_barang_proses';
    private $v_barang_proses = 'v_barang_proses';
    private $v_detail_barang_proses = 'v_detail_barang_proses';

    public function show_barang_proses($where='')
    {
        $this->db->select('*');
        $this->db->from($this->v_barang_proses);
        if(@$where && $where != null)
        {
            $this->db->where($where);
        }
        $this->db->order_by('id_barang_proses', 'asc');
        return $this->db->get();
    }

    public function show_detail_barang_proses($where='')
    {
        $this->db->select('*');
        $this->db->from($this->v_detail_barang_proses);
        if(@$where && $where != null)
        {
            $this->db->where($where);
        }
        $this->db->order_by('id_detail_barang_proses', 'asc');
        return $this->db->get();
    }

    public function insert_barang_proses($object)
    {
        $this->db->insert_barang_proses($this->barang_proses, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function insert_detail_barang_proses($object)
    {
        $this->db->insert_detail_barang_proses($this->detail_barang_proses, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function update_barang_proses($where, $object)
    {
        $this->db->where($where);
        $this->db->update_barang_proses($this->barang_proses, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function update_detail_barang_proses($where, $object)
    {
        $this->db->where($where);
        $this->db->update_detail_barang_proses($this->detail_barang_proses, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function delete_barang_proses($where)
    {
        $this->db->where($where);
        $this->db->delete_barang_proses($this->barang_proses);
        return(($this->tbl->affected_rows() > 0) ? true : false);
    }

    public function delete_detail_barang_proses($where)
    {
        $this->db->where($where);
        $this->db->delete_detail_barang_proses($this->detail_barang_proses);
        return(($this->tbl->affected_rows() > 0) ? true : false);
    }
}
?>