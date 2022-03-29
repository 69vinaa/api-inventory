<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class MBarangProses extends CI_Model
{
    private $barang_proses = 'inv_barang_proses';
    private $v_barang_proses = 'v_barang_proses';

    public function show($where='')
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

    public function insert($object)
    {
        $this->db->insert($this->barang_proses, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function update($where, $object)
    {
        $this->db->where($where);
        $this->db->update($this->barang_proses, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function delete($where)
    {
        $this->db->where($where);
        $this->db->delete($this->barang_proses);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

}
?>