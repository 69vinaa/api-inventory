<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use chriskacerguis\RestServer\RestController;

class KategoriProses extends RestController {

    const HTTP_OK = RestController::HTTP_OK;
    const HTTP_CREATED = RestController::HTTP_CREATED;
    const HTTP_BAD_REQUEST = RestController::HTTP_BAD_REQUEST;
    const HTTP_NOT_FOUND = RestController::HTTP_NOT_FOUND;

    public function __construct(){
        parent::__construct();
        $this->load->model('MKategoriProses', 'kategori_proses');
    }

    public function index_post($id_kategori_proses='')
    {
        $jsonArray = json_decode($this->input->raw_input_stream, true);
        $postReal = $this->form_validation->set_data($jsonArray);

        if(!$id_kategori_proses){
            $this->form_validation->set_rules('id_kategori_proses', 'ID Kategori Proses', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('kategori_proses', 'Kategori Proses', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('create_at', 'Create At', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('update_at', 'Update At', 'trim|required', [
                'required' => '%s Required'
            ]);
        }

        if($this->form_validation->run() == FALSE && !$id_kategori_proses){
            $this->response([
                'status' => FALSE,
                'title' => 'Invalid input reuired',
                'message' => validation_errors()
            ], RestController::HTTP_BAD_REQUEST);
        }else{
            if(@$id_ketegori_proses){
                if(@$id_kategori_proses && @$jsonArray['kategori_proses']){
                    $arr['kategori_proses'] = $jsonArray['kategori_proses'];
                }
                if(@$id_kategori_proses && @$jsonArray['create_at']){
                    $arr['create_at'] = $jsonArray['create_at'];
                }
                if(@$id_kategori_proses && @$jsonArray['update_at']){
                    $arr['update_at'] = $jsonArray['update_at'];
                }
            }else{
                $arr = [
                    'kategori' => $jsonArray['kategori'],
                    'create_at' => $jsonArray['create_at'],
                    'update_at' => $jsonArray['update_at']
                ];
            }
            if(!$id_kategori_proses){
                $arr['id_kategori_proses'] = $jsonArray['id_kategori_proses'];
                $arr['created_at'] = date('Y-m-d H:i:s');
                $ins = $this->kategori_proses->insert($arr);

                if($ins){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Created',
                        'message' => 'Kategori Proses was successful created!'
                    ], RestController::HTTP_CREATED);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Created',
                        'message' => 'Kategori Proses was error created!'
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else{
                $id_kategori_proses = ['id_kategori_proses' => $id_kategori_proses];
                $arr['update_at'] = date('Y-m-d H:i:s');
                $upd = $this->kategori_proses->update($id_kategori_proses, $arr);
                
                if($upd){
                    $check = array(
                        'id_kategori_proses' => $id_kategori_proses
                    );
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Update',
                        'message' => 'Kategori Proses ID : '.$id_kategori_proses['id_kategori_proses'],'was successful update!'
                    ], RestController::HTTP_OK);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Update',
                        'message' => 'Kategori Proses was error update!'
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }
        }
    }

    public function index_get()
    {
        if(@$this->input->get()){
            $val = $this->input->get('val');

            $data = $get->row();
        }else{
            $get = $this->kategori_proses->show();
            $data = $get->result();
        }
        if($get->num_rows() > 0){
            $this->response([
                'status' => TRUE,
                'title' => 'Success get Kategori Proses',
                'data' => $data
            ], RestController::HTTP_OK);
        }else{
            $this->response([
                'status' => FALSE,
                'title' => 'Kategori Proses not found',
                'data' => []
            ], RestController::HTTP_NOT_FOUND);
        }
    }

    public function index_delete($id_kategori_proses)
    {
        if(@$id_kategori_proses){
            $id_kategori_proses = ['id_kategori_proses' => $id_kategori_proses];
            $get = $this->kategori_proses->show($id_kategori_proses);
            $data = $get->row();
            if($get->num_rows() == 1){
                $del = $this->kategori_proses->delete($id_kategori_proses);
                if($del){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Success delete one Kategori Proses',
                        'message' => 'Kategori Proses : '.$id_kategori_proses['id_kategori_proses'].'was deleted!'
                    ], RestController::HTTP_OK);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => "Kategori Proses can't deleted",
                        'message' => "Can't deleted Kategori Proses"
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else{
                $this->response([
                    'status' => FALSE,
                    'title' => 'Kategori Proses not found',
                    'message' => "ID Kategori Proses can't found!"
                ], RestController::HTTP_NOT_FOUND);
            }
        }else{
            $this->response([
                'status' => FALSE,
                'title' => 'ID Kategori Proses was required',
                'message' => 'ID Kategori Proses must be required'
            ], RestController::HTTP_BAD_REQUEST);
        }
    }
}
?>