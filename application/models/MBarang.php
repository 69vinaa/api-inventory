<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class MBarang extends CI_Model
{
    private $barang = 'barang';
    private $v_barang = 'v_barang';   

    public function show_barang($where='')
    {
        $this->db->select('*');
        $this->db->from($this->v_barang);
        if(@$where && $where != null)
        {
            $this->db->where($where);
        }
        $this->db->order_by('id_barang', 'asc');
        return $this->db->get();
    }  

    public function insert_barang($object)
    {
        $this->db->insert_barang($this->barang, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function update_barang($where, $object)
    {
        $this->db->where($where);
        $this->db->update_barang($this->barang, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }   

    public function delete_barang($where)
    {
        $this->db->where($where);
        $this->db->delete_barang($this->inv_barang);
        return(($this->tbl->affected_rows() > 0) ? true : false);
    }
}
?>