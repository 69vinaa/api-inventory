<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use chriskacerguis\RestServer\RestController;

class DetailBarang extends RestController {

    const HTTP_OK = RestController::HTTP_OK;
    const HTTP_CREATED = RestController::HTTP_CREATED;
    const HTTP_BAD_REQUEST = RestController::HTTP_BAD_REQUEST;
    const HTTP_NOT_FOUND = RestController::HTTP_NOT_FOUND;

    public function __construct(){
        parent::__construct();
        $this->load->model('MBarang', 'barang');
    }

    public function index_post($id_detail_barang='')
    {
        $jsonArray = json_decode ($this->input->raw_input_stream, true);
        $postReal = $this->form_validation->set_data($jsonArray);

        if(!$id_detail_barang){
            $this->form_validation->set_rules('id_detail_barang', 'ID Detail Barang', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('slug', 'Slug', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('id_barang', 'ID Barang', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('serial_number', 'Serial Number', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('stok', 'Stok', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('id_status', 'ID Status', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('id_type', 'ID Type', 'trim|required', [
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

        if($this->form_validation->run() == FALSE && !$id_detail_barang){
            $this->response([
                'status' => FALSE,
                'title' => 'Invalid input required',
                'message' => validation_errors()
            ], RestController::HTTP_BAD_REQUEST);
        }else{
            if(@$id_detail_barang){
                if(@$id_detail_barang && @$jsonArray ['id_barang']){
                    $arr['id_barang'] = $josnArray ['id_barang'];
                }
                if(@$id_detail_barang && @$jsonArray ['serial_number']){
                    $arr['serial_number'] = $josnArray ['serial_number'];
                }
                if(@$id_detail_barang && @$jsonArray ['stok']){
                    $arr['stok'] = $josnArray ['stok'];
                }
                if(@$id_detail_barang && @$jsonArray ['id_status']){
                    $arr['id_status'] = $josnArray ['id_status'];
                }
                if(@$id_detail_barang && @$jsonArray ['id_type']){
                    $arr['id_type'] = $josnArray ['id_type'];
                }
                if(@$id_detail_barang && @$jsonArray ['keterangan']){
                    $arr['keterangan'] = $josnArray ['keterangan'];
                }
                if(@$id_detail_barang && @$jsonArray ['create_at']){
                    $arr['create_at'] = $josnArray ['create_at'];
                }
                if(@$id_detail_barang && @$jsonArray ['update_at']){
                    $arr['update_at'] = $josnArray ['update_at'];
                }
            }else{
                $arr = [
                    'id_barang' => $jsonArray ['id_barang'],
                    'serial_number' => $jsonArray ['serial_number'],
                    'stok' => $jsonArray ['stok'],
                    'id_status' => $jsonArray ['id_status'],
                    'id_type' => $jsonArray ['id_type'],
                    'keterangan' => $jsonArray ['keterangan'],
                    'create_at' => $jsonArray ['create_at'],
                    'update_at' => $jsonArray ['update_at'],
                ];
            }
            if(!$id_detail_barang){
                $arr['id_detail_barang'] = $jsonArray ['id_detail_barang'];
                $arr['created_at'] = date('Y-m-d H:i:s');

                $ins = $this->detail_barang->insert($arr);
                if($ins){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Created',
                        'message' => 'Detail Barang was successful created!'
                    ], RestController::HTTP_CREATED);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Created',
                        'message' => 'Detail Barang was error created!'
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else{
                $id_detail_barang = ['id_detail_barang' => $id_detail_barang];
                $arr['update_at'] = date('Y-m-d H:i:s');
                $upd = $this->detail_barang->update($id_detail_barang, $arr);
                if($upd){
                    $check = array(
                        'id_detail_barang' => $id_detail_barang
                    );
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Update',
                        'message' => 'Detail Barang ID : '.$id_detail_barang['id_detail_barang'],'was successful update!'
                    ], RestController::HTTP_OK);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Update',
                        'message' => 'Detail Barang was error update!'
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
            $get = $this->barang->show();
            $data = $get->result();
        }
        if($get->num_rows() > 0){
            $this->response([
                'status' => TRUE,
                'title' => 'Success get Barang',
                'data' => $data
            ], RestController::HTTP_OK);
        }else{
            $this->response([
                'status' => FALSE,
                'title' => 'Barang not found',
                'data' => []
            ], RestController::HTTP_NOT_FOUND);
        }
    }

	public function index_delete($id_barang)
	{
        if(@$id_barang){
            $id_barang = ['id_barang' => $id_barang];
            $get = $this->barang->show($id_barang);
            $data = $get->row();
            if($get->num_rows() == 1){
                $del = $this->barang->delete($id_barang);
                if($del){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Success delete one Barang',
                        'message' => 'Barang id_barang : '.$id_barang ['id_barang'].'was deleted!'
                    ], RestController::HTTP_OK);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => "Barang can't deleted",
                        'message' => "Can't deleted Barang"
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else{
                $this->response([
                    'status' => FALSE,
                    'title' => 'Barang not found',
                    'message' => "ID Barang can't found!"
                ], RestController::HTTP_NOT_FOUND);
            }
        }else{
            $this->response([
                'status' => FALSE,
                'title' => 'ID Barang was required',
                'message' => 'ID Barang must be required'
            ], RestController::HTTP_BAD_REQUEST);
        }
	}
}
?>