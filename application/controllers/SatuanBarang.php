<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use chriskacerguis\RestServer\RestController;

class SatuanBarang extends RestController {

    const HTTP_OK = RestController::HTTP_OK;
    const HTTP_CREATED = RestController::HTTP_CREATED;
    const HTTP_BAD_REQUEST = RestController::HTTP_BAD_REQUEST;
    const HTTP_NOT_FOUND = RestController::HTTP_NOT_FOUND;

    public function __construct(){
        parent::__construct();
        $this->load->model('MSatuanBarang', 'satuan_barang');
    }

    public function index_post($id_sataun='')
    {
        $jsonArray = json_decode($this->input->raw_input_stream, true);
        $postReal = $this->form_validation->set_data($jsonArray);

        if(!$id_satuan){
            $this->form_validation->set_rules('id_satuan', 'ID Satuan', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('slug', 'Slug', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('satuan_barang', 'Satuan Barang', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('create_at', 'Create At', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('update_at', 'Update At', 'trim|required', [
                'required' => '%s Required'
            ]);
        }

        if($this->form_validation->run() == FALSE && !$id_satuan){
            $this->response([
                'status' => FALSE,
                'title' => 'Invalid input reuired',
                'message' => validation_errors()
            ], RestController::HTTP_BAD_REQUEST);
        }else{
            if(@$id_status){
                if(@$id_satuan && @$jsonArray['satuan_barang']){
                    $arr['satuan_barang'] = $jsonArray['satuan_barang'];
                }
                if(@$id_satuan && @$jsonArray['create_at']){
                    $arr['create_at'] = $jsonArray['create_at'];
                }
                if(@$id_satuan && @$jsonArray['update_at']){
                    $arr['update_at'] = $jsonArray['update_at'];
                }
            }else{
                $arr = [
                    'satuan_barang' => $jsonArray['satuan_barang'],
                    'create_at' => $jsonArray['create_at'],
                    'update_at' => $jsonArray['update_at']
                ];
            }
            if(!$id_satuan){
                $arr['id_satuan'] = $jsonArray['id_satuan'];
                $arr['created_at'] = date('Y-m-d H:i:s');

                $ins = $this->satuan_barang->insert($arr);
                if($ins){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Created',
                        'message' => 'Satuan Barang was successful created!'
                    ], RestController::HTTP_CREATED);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Created',
                        'message' => 'Satuan Barang was error created!'
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else{
                $id_satuan = ['id_satuan' => $id_satuan];
                $arr['update_at'] = date('Y-m-d H:i:s');
                $upd = $this->satuan_barang->update($id_satuan, $arr);
                if($upd){
                    $check = array(
                        'id_satuan' => $id_satuan
                    );
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Update',
                        'message' => 'Satuan Barang ID : '.$id_satuan['id_satuan'],'was successful update!'
                    ], RestController::HTTP_OK);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Update',
                        'message' => 'Satuan Barang was error update!'
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
                'title' => 'Success get Satuan Barang',
                'data' => $data
            ], RestController::HTTP_OK);
        }else{
            $this->response([
                'status' => FALSE,
                'title' => 'Satuan Barang not found',
                'data' => []
            ], RestController::HTTP_NOT_FOUND);
        }
    }

    public function index_delete($id_status)
    {
        if(@$id_satuan){
            $id_satuan = ['id_satuan' => $id_satuan];
            $get = $this->satuan_barang->show($id_satuan);
            $data = $get->row();
            if($get->num_rows() == 1){
                $del = $this->satuan_barang->delete($id_satuan);
                if($del){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Success delete one Satuan Barang',
                        'message' => 'Satuan Barang : '.$id_satuan['id_satuan'].'was deleted!'
                    ], RestController::HTTP_OK);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => "Satuan Barang can't deleted",
                        'message' => "Can't deleted Satuan Barang"
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else{
                $this->response([
                    'status' => FALSE,
                    'title' => 'Satuan Barang not found',
                    'message' => "ID Satuan Barang can't found!"
                ], RestController::HTTP_NOT_FOUND);
            }
        }else{
            $this->response([
                'status' => FALSE,
                'title' => 'ID Satuan Barang was required',
                'message' => 'ID Satuan Barang must be required'
            ], RestController::HTTP_BAD_REQUEST);
        }
    }
}
?>