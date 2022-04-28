<?php
defined('BASEPATH') OR exit ('No direct script acccess allowed');

class MDetailBarangProses extends CI_Model
{
    private $detail_barang_proses = 'inv_detail_barang_proses';
    private $v_detail_barang_proses = 'v_detail_barang_proses';

    public function show($where='')
    {
        $this->db->select('*');
        $this->db->from($this->v_detail_barang_proses);
        if (@$where && $where != null) {
            $this->db->where($where);
        }
        $this->db->order_by('id_detail_barang_proses', 'asc');
        return $this->db->get();
    }

    public function insert($object)
    {
        $this->db->insert($this->detail_barang_proses, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function update($where, $object)
    {
        $this->db->where($where);
        $this->db->update($this->detail_barang_proses, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function delete($where)
    {
        $this->db->where($where);
        $this->db->delete($this->detail_barang_proses);
        return(($this->db->affested_rows() > 0) ? true : false);
    }

    public function newStok($where)
    {
        $this->db->select_sum('jml_barang');
        $this->db->where($where);
        return $this->db->get($this->v_detail_barang_proses);
    }
}
?>