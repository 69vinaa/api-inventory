<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use chriskacerguis\RestServer\RestController;

class StatusBarang extends RestController {

    const HTTP_OK = RestController::HTTP_OK;
    const HTTP_CREATED = RestController::HTTP_CREATED;
    const HTTP_BAD_REQUEST = RestController::HTTP_BAD_REQUEST;
    const HTTP_NOT_FOUND = RestController::HTTP_NOT_FOUND;

    public function __construct(){
        parent::__construct();
        $this->load->model('MStatusBarang', 'status_barang');
    }

    public function index_post($id_status='')
    {
        $jsonArray = json_decode($this->input->raw_input_stream, true);
        $postReal = $this->form_validation->set_data($jsonArray);

        if(!$id_status){
            $this->form_validation->set_rules('id_status', 'ID Status', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('slug', 'Slug', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('status_barang', 'Status Barang', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('create_at', 'Create At', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('update_at', 'Update At', 'trim|required', [
                'required' => '%s Required'
            ]);
        }

        if($this->form_validation->run() == FALSE && !$id_status){
            $this->response([
                'status' => FALSE,
                'title' => 'Invalid input reuired',
                'message' => validation_errors()
            ], RestController::HTTP_BAD_REQUEST);
        }else{
            if(@$id_status){
                if(@$id_status && @$jsonArray['status_barang']){
                    $arr['status_barang'] = $jsonArray['status_barang'];
                }
                if(@$id_status && @$jsonArray['create_at']){
                    $arr['create_at'] = $jsonArray['create_at'];
                }
                if(@$id_status && @$jsonArray['update_at']){
                    $arr['update_at'] = $jsonArray['update_at'];
                }
            }else{
                $arr = [
                    'status_barang' => $jsonArray['status_barang'],
                    'create_at' => $jsonArray['create_at'],
                    'update_at' => $jsonArray['update_at']
                ];
            }
            if(!$id_status){
                $arr['id_status'] = $jsonArray['id_status'];
                $arr['created_at'] = date('Y-m-d H:i:s');

                $ins = $this->status_barang->insert($arr);
                if($ins){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Created',
                        'message' => 'Status Barang was successful created!'
                    ], RestController::HTTP_CREATED);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Created',
                        'message' => 'Status Barang was error created!'
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else{
                $id_status = ['id_status' => $id_status];
                $arr['update_at'] = date('Y-m-d H:i:s');
                $upd = $this->status_barang->update($id_status, $arr);
                if($upd){
                    $check = array(
                        'id_status' => $id_status
                    );
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Update',
                        'message' => 'Status Barang ID : '.$id_status['id_status'],'was successful update!'
                    ], RestController::HTTP_OK);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Update',
                        'message' => 'Status Barang was error update!'
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
            $get = $this->status_barang->show();
            $data = $get->result();
        }
        if($get->num_rows() > 0){
            $this->response([
                'status' => TRUE,
                'title' => 'Success get Status Barang',
                'data' => $data
            ], RestController::HTTP_OK);
        }else{
            $this->response([
                'status' => FALSE,
                'title' => 'Status Barang not found',
                'data' => []
            ], RestController::HTTP_NOT_FOUND);
        }
    }

    public function index_delete($id_status)
    {
        if(@$id_status){
            $id_status = ['id_status' => $id_status];
            $get = $this->status_barang->show($id_status);
            $data = $get->row();
            if($get->num_rows() == 1){
                $del = $this->status_barang->delete($id_status);
                if($del){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Success delete one Status Barang',
                        'message' => 'Status Barang : '.$id_status['id_status'].'was deleted!'
                    ], RestController::HTTP_OK);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => "Status Barang can't deleted",
                        'message' => "Can't deleted Status Barang"
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else{
                $this->response([
                    'status' => FALSE,
                    'title' => 'Status Barang not found',
                    'message' => "ID Status Barang can't found!"
                ], RestController::HTTP_NOT_FOUND);
            }
        }else{
            $this->response([
                'status' => FALSE,
                'title' => 'ID Status Barang was required',
                'message' => 'ID Status Barang must be required'
            ], RestController::HTTP_BAD_REQUEST);
        }
    }
}
?>