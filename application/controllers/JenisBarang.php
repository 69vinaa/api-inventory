<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH.'libraries/restserver/src/RestController.php');
require(APPPATH.'libraries/restserver/src/Format.php');
use chriskacerguis\RestServer\RestController;

class JenisBarang extends RestController {

    const HTTP_OK = RestController::HTTP_OK;
    const HTTP_CREATED = RestController::HTTP_CREATED;
    const HTTP_BAD_REQUEST = RestController::HTTP_BAD_REQUEST;
    const HTTP_NOT_FOUND = RestController::HTTP_NOT_FOUND;

    public function __construct(){
        parent::__construct();

        if (!$this->_key_exists($this->input->request_headers()['token'])) {
            $this->response([
                'status' => FALSE,
                'message' => 'Invalid API Key'
            ], RestController::HTTP_BAD_REQUEST);
        }else {
            $this->key = $this->input->request_headers()['token'];
        }

        $this->load->model('MJenisBarang', 'jenis_barang');
        $this->load->model('MToken', 'token');
    }

    private function _checkToken()
    {
        try {
            $payload = JWT::decode($this->tokenkey, $this->key, array('HS256'));
            $time = new DateTimeImmutable();

            if ($time->getTimestamp() > $payload->exp) {
                $this->response([
                    'status' => FALSE,
                    'message' => 'API Key Expired'
                ], RestController::HTTP_BAD_REQUEST);
            }
        } catch (Exception $e) {
            $this->response([
                'status' => FALSE,
                'message' => $e->getMessage()
            ], RestController::HTTP_BAD_REQUEST);
        }
    }

    private function _key_exists($key)
    {
        return $this->rest->db
        ->where(config_item('rest_key_column'), $key)
        ->count_all_results(config_item('rest_keys_table')) > 0;
    }

    public function index_post($slug='')
    {
        $jsonArray = json_decode($this->input->raw_input_stream, true);
        $postReal = $this->form_validation->set_data($jsonArray);

        if(!$slug){
            $this->form_validation->set_rules('jenis', 'Jenis Barang', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('ket', 'Keterangan', 'trim|required', [
                'required' => '%s Required'
            ]);
        }

        if($this->form_validation->run() == FALSE && !$slug){
            $this->response([
                'status' => FALSE,
                'title' => 'Invalid input reuired',
                'message' => validation_errors()
            ], RestController::HTTP_BAD_REQUEST);
        }else{
            if(@$slug){
                if(@$slug && @$jsonArray['jenis']){
                    $arr['jenis_barang'] = $jsonArray['jenis'];
                }
                if(@$slug && @$jsonArray['ket']){
                    $arr['keterangan'] = $jsonArray['ket'];
                }
            }else{
                $arr = [
                    'slug' => str_replace(' ', '-', strtolower($jsonArray ['jenis'])),
                    'jenis_barang' => $jsonArray['jenis'],
                    'keterangan' => $jsonArray['ket']
                ];
            }
            if(!$slug){
                $arr['create_at'] = date('Y-m-d H:i:s');

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
                $idslug = ['slug' => $slug];
                $row = $this->jenis_barang->show($idslug)->row_array();
                $id = ['id_jenis' => $row['id_jenis']];

                $arr['slug'] = str_replace(' ', '-', strtolower($jsonArray ['jenis']));
                $arr['update_at'] = date('Y-m-d H:i:s');
                $upd = $this->jenis_barang->update($id, $arr);

                if($upd){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Update',
                        'message' => 'Jenis Barang : '.$jsonArray['jenis'].' was successful update!'
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

    public function index_get($slug='')
    {
        if(@$slug){
            $get = $this->jenis_barang->show(['slug' => $slug]);
            $data = $get->row_array();
        }else{
            $get = $this->jenis_barang->show();
            $data = $get->result_array();
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

    public function index_delete($slug)
    {
        if(@$slug){
            $idslug = ['slug' => $slug];
            $get = $this->jenis_barang->show($idslug);

            if($get->num_rows() == 1){
                $data = $get->row_array();
                $id = ['id_jenis' => $data['id_jenis']];
                $del = $this->jenis_barang->delete($id);
                if($del){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Success delete one Jenis Barang',
                        'message' => 'Jenis Barang : '.$data['jenis_barang'].' was deleted!'
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