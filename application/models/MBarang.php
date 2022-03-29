<?php 
defined('BASEPATH') OR exit ('No direct script access allowed');

class MBarang extends CI_Model
{
    private $barang = 'inv_barang';
    private $v_barang = 'v_barang'; 

    public function show($where='')
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

    public function insert($object)
    {
        $this->db->insert($this->barang, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

    public function update($where, $object)
    {
        $this->db->where($where);
        $this->db->update($this->barang, $object);
        return(($this->db->affected_rows() > 0) ? true : false);
    }   

    public function delete($where)
    {
        $this->db->where($where);
        $this->db->delete($this->barang);
        return(($this->db->affected_rows() > 0) ? true : false);
    }

}
?>