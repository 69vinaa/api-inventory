<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use chriskacerguis\RestServer\RestController;

class BarangProses extends RestController {
    
    const HTTP_OK = RestController::HTTP_OK;
    const HTTP_CREATED = RestController::HTTP_CREATED;
    const HTTP_BAD_REQUEST = RestController::HTTP_BAD_REQUEST;
    const HTTP_NOT_FOUND = RestController::HTTP_NOT_FOUND;

    public function __construct(){
        parent::__construct();
        $this->load->model('MBarangProses', 'barang_proses');
    }

    public function index_post($id_barang_proses='')
    {
        $jsonArray = json_decode($this->input->raw_input_stream, true);
        $postReal = $this->form_validation->set_data($jsonArray);

        if(!$id_barang_proses){
            $this->form_validation->set_rules('id_barang_proses', 'ID Barang Proses', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('slug', 'Slug', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('id_kategori_proses', 'ID Kategori Proses', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('no_proses', 'No Proses', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('tgl_proses_barang', 'Tanggal Proses Barang', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('id_user', 'ID User', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('keterangan', 'Keterangan', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('create_at', 'Create At', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('update_at', 'Update At', 'trim|required', [
                'required' => '%s Required'
            ]);
        }

        if(@$arr['penerima'] && $ket == '01'){
            
        }
    }
}

?>