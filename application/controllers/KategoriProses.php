<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH.'libraries/restserver/src/RestController.php');
require(APPPATH.'libraries/restserver/src/Format.php');
use chriskacerguis\RestServer\RestController;

class KategoriProses extends RestController {

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

        $this->load->model('MKategoriProses', 'kategori_proses');
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
            $this->form_validation->set_rules('kategori', 'Kategori Proses', 'trim|required', [
                'required' => '%s Required'
            ]);
        }

        if($this->form_validation->run() == FALSE && !$slug){
            $this->response([
                'status' => FALSE,
                'title' => 'Invalid input required',
                'message' => validation_errors()
            ], RestController::HTTP_BAD_REQUEST);
        }else{
            if(@$slug){
                if(@$slug && @$jsonArray['kategori']){
                    $arr['kategori_proses'] = $jsonArray['kategori'];
                }
            }else{
                $arr = [
                    'slug' => str_replace(' ', '-', strtolower($jsonArray ['kategori'])),
                    'kategori_proses' => $jsonArray['kategori']
                ];
            }
            if(!$slug){
                $arr['id_kategori_proses'] = $jsonArray['kategori'];
                $arr['create_at'] = date('Y-m-d H:i:s');
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
                $idslug = ['slug' => $slug];
                $row = $this->kategori_proses->show($idslug)->row_array();
                $id = ['id_kategori_proses' => $row['id_kategori_proses']];
                $arr['update_at'] = date('Y-m-d H:i:s');
                $arr['slug'] = str_replace(' ', '-', strtolower($jsonArray ['kategori']));
                $upd = $this->kategori_proses->update($id, $arr);
                
                if($upd){
                    $check = array(
                        'id_kategori_proses' => $id_kategori_proses
                    );
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Update',
                        'message' => 'Kategori Proses : '.$jsonArray['kategori'].' was successful update!'
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

    public function index_get($slug='')
    {
        if(@$slug){
            // $val = $this->input->get('val');
            $get = $this->kategori_proses_show(['slug' => $slug]);
            $data = $get->row_array();
        }else{
            $get = $this->kategori_proses->show();
            $data = $get->result_array();
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

    public function index_delete($slug)
    {
        if(@$slug){
            $idslug = ['slug' => $slug];
            $get = $this->kategori_proses->show($idslug);

            if($get->num_rows() == 1){
                $data = $get->row_array();
                $id = ['id_kategori_proses' => $data['id_kategori_proses']];
                $del = $this->kategori_proses->delete($id);
                if($del){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Success delete one Kategori Proses',
                        'message' => 'Kategori Proses : '.$data['kategori_proses'].' was deleted!'
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