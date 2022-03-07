<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use chriskacerguis\RestServer\RestController;

class TypeBarang extends RestController {

    const HTTP_OK = RestController::HTTP_OK;
    const HTTP_CREATED = RestController::HTTP_CREATED;
    const HTTP_BAD_REQUEST = RestController::HTTP_BAD_REQUEST;
    const HTTP_NOT_FOUND = RestController::HTTP_NOT_FOUND;

    public function __construct(){
        parent::__construct();
        $this->load->model('MTypeBarang', 'type_barang');
    }

    public function index_post($id_type='')
    {
        $jsonArray = json_decode($this->input->raw_input_stream, true);
        $postReal = $this->form_validation->set_data($jsonArray);

        if(!$id_type){
            $this->form_validation->set_rules('id_type', 'ID Type', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('slug', 'Slug', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('type_barang', 'Type Barang', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('create_at', 'Create At', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('update_at', 'Update At', 'trim|required', [
                'required' => '%s Required'
            ]);
        }

        if($this->form_validation->run() == FALSE && !$id_type){
            $this->response([
                'status' => FALSE,
                'title' => 'Invalid input reuired',
                'message' => validation_errors()
            ], RestController::HTTP_BAD_REQUEST);
        }else{
            if(@$id_type){
                if(@$id_type && @$jsonArray['type_barang']){
                    $arr['type_barang'] = $jsonArray['type_barang'];
                }
                if(@$id_type && @$jsonArray['create_at']){
                    $arr['create_at'] = $jsonArray['create_at'];
                }
                if(@$id_type && @$jsonArray['update_at']){
                    $arr['update_at'] = $jsonArray['update_at'];
                }
            }else{
                $arr = [
                    'type_barang' => $jsonArray['type_barang'],
                    'create_at' => $jsonArray['create_at'],
                    'update_at' => $jsonArray['update_at']
                ];
            }
            if(!$id_type){
                $arr['id_type'] = $jsonArray['id_type'];
                $arr['created_at'] = date('Y-m-d H:i:s');

                $ins = $this->type_barang->insert($arr);
                if($ins){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Created',
                        'message' => 'Type Barang was successful created!'
                    ], RestController::HTTP_CREATED);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Created',
                        'message' => 'Type Barang was error created!'
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else{
                $id_type = ['id_type' => $id_type];
                $arr['update_at'] = date('Y-m-d H:i:s');
                $upd = $this->type_barang->update($id_type, $arr);
                if($upd){
                    $check = array(
                        'id_type' => $id_type
                    );
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Update',
                        'message' => 'Type Barang ID : '.$id_type['id_type'],'was successful update!'
                    ], RestController::HTTP_OK);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Update',
                        'message' => 'Type Barang was error update!'
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
            $get = $this->type_barang->show();
            $data = $get->result();
        }
        if($get->num_rows() > 0){
            $this->response([
                'status' => TRUE,
                'title' => 'Success get Type Barang',
                'data' => $data
            ], RestController::HTTP_OK);
        }else{
            $this->response([
                'status' => FALSE,
                'title' => 'Type Barang not found',
                'data' => []
            ], RestController::HTTP_NOT_FOUND);
        }
    }

    public function index_delete($id_jenis)
    {
        if(@$id_type){
            $id_type = ['id_type' => $id_type];
            $get = $this->type_barang->show($id_type);
            $data = $get->row();
            if($get->num_rows() == 1){
                $del = $this->type_barang->delete($id_type);
                if($del){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Success delete one Type Barang',
                        'message' => 'Type Barang : '.$id_type['id_type'].'was deleted!'
                    ], RestController::HTTP_OK);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => "Type Barang can't deleted",
                        'message' => "Can't deleted Type Barang"
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else{
                $this->response([
                    'status' => FALSE,
                    'title' => 'Type Barang not found',
                    'message' => "ID Type Barang can't found!"
                ], RestController::HTTP_NOT_FOUND);
            }
        }else{
            $this->response([
                'status' => FALSE,
                'title' => 'ID Type Barang was required',
                'message' => 'ID Type Barang must be required'
            ], RestController::HTTP_BAD_REQUEST);
        }
    }
}
?>