<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use chriskacerguis\RestServer\RestController;

class JenisBarang extends RestController {

    const HTTP_OK = RestController::HTTP_OK;
    const HTTP_CREATED = RestController::HTTP_CREATED;
    const HTTP_BAD_REQUEST = RestController::HTTP_BAD_REQUEST;
    const HTTP_NOT_FOUND = RestController::HTTP_NOT_FOUND;

    public function __construct(){
        parent::__construct();
        $this->load->model('MJenisBarang', 'jenis_barang');
    }

    public function index_post($id_jenis='')
    {
        $jsonArray = json_decode($this->input->raw_input_stream, true);
        $postReal = $this->form_validation->set_data($jsonArray);

        if(!$id_jenis){
            $this->form_validation->set_rules('id_jenis', 'ID Jenis', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('slug', 'Slug', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('jenis_barang', 'Jenis Barang', 'trim|required', [
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

        if($this->form_validation->run() == FALSE && !$id_jenis){
            $this->response([
                'status' => FALSE,
                'title' => 'Invalid input reuired',
                'message' => validation_errors()
            ], RestController::HTTP_BAD_REQUEST);
        }else{
            if(@$id_jenis){
                if(@$id_jenis && @$jsonArray['jenis_barang']){
                    $arr['jenis_barang'] = $jsonArray['jenis_barang'];
                }
                if(@$id_jenis && @$jsonArray['keterangan']){
                    $arr['keterangan'] = $jsonArray['keterangan'];
                }
                if(@$id_jenis && @$jsonArray['create_at']){
                    $arr['create_at'] = $jsonArray['create_at'];
                }
                if(@$id_jenis && @$jsonArray['update_at']){
                    $arr['update_at'] = $jsonArray['update_at'];
                }
            }else{
                $arr = [
                    'jenis_barang' => $jsonArray['jenis_barang'],
                    'keterangan' => $jsonArray['keterangan'],
                    'create_at' => $jsonArray['create_at'],
                    'update_at' => $jsonArray['update_at']
                ];
            }
            if(!$id_jenis){
                $arr['id_jenis'] = $jsonArray['id_jenis'];
                $arr['created_at'] = date('Y-m-d H:i:s');

                $ins = $this->jenis_barang->insert($arr);
                if($ins){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Created',
                        'message' => 'Jenis Barang was successful created!'
                    ], RestController::HTTP_CREATED);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Created',
                        'message' => 'Jenis Barang was error created!'
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else{
                $id_jenis = ['id_jenis' => $id_jenis];
                $arr['update_at'] = date('Y-m-d H:i:s');
                $upd = $this->jenis_barang->update($id_jenis, $arr);
                if($upd){
                    $check = array(
                        'id_jenis' => $id_jenis
                    );
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Update',
                        'message' => 'Jenis Barang ID : '.$id_jenis['id_jenis'],'was successful update!'
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
            $get = $this->jenis_barang->show();
            $data = $get->result();
        }
        if($get->num_rows() > 0){
            $this->response([
                'status' => TRUE,
                'title' => 'Success get Jenis Barang',
                'data' => $data
            ], RestController::HTTP_OK);
        }else{
            $this->response([
                'status' => FALSE,
                'title' => 'Jenis Barang not found',
                'data' => []
            ], RestController::HTTP_NOT_FOUND);
        }
    }

    public function index_delete($id_jenis)
    {
        if(@$id_jenis){
            $id_jenis = ['id_jenis' => $id_jenis];
            $get = $this->jenis_barang->show($id_jenis);
            $data = $get->row();
            if($get->num_rows() == 1){
                $del = $this->jenis_barang->delete($id_jenis);
                if($del){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Success delete one Jenis Barang',
                        'message' => 'Jenis Barang : '.$id_jenis['id_jenis'].'was deleted!'
                    ], RestController::HTTP_OK);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => "Jenis Barang can't deleted",
                        'message' => "Can't deleted Jenis Barang"
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else{
                $this->response([
                    'status' => FALSE,
                    'title' => 'Jenis Barang not found',
                    'message' => "ID Jenis Barang can't found!"
                ], RestController::HTTP_NOT_FOUND);
            }
        }else{
            $this->response([
                'status' => FALSE,
                'title' => 'ID Jenis Barang was required',
                'message' => 'ID Jenis Barang must be required'
            ], RestController::HTTP_BAD_REQUEST);
        }
    }
}
?>