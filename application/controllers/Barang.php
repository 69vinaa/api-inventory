<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH.'libraries/restserver/src/RestController.php');
require(APPPATH.'libraries/restserver/src/Format.php');
use chriskacerguis\RestServer\RestController;

class Barang extends RestController {

    const HTTP_OK = RestController::HTTP_OK;
    const HTTP_CREATED = RestController::HTTP_CREATED;
    const HTTP_BAD_REQUEST = RestController::HTTP_BAD_REQUEST;
    const HTTP_NOT_FOUND = RestController::HTTP_NOT_FOUND;

    private $result = false;
    public $key = '';
    public $tokenkey = '';

    public function __construct(){
        parent::__construct();

        if (!$this->_key_exists($this->input->request_headers()['token'])) {
            $this->response([
                'status' => FALSE,
                'message' => 'Invalid API key'
            ], RestController::HTTP_BAD_REQUEST);
        }else{
            $this->key = $this->input->request_headers()['token'];
            // $this->_checkToken();
        }

        $this->load->model('MBarang', 'barang');
        $this->load->model('MDetailBarang', 'detail_barang');
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

    public function _generate_token($payload)
    {
        $issuedAt = new DateTimeImmutable();
        $expire = $issuedAt->modify('+1 month')->getTimestamp();
        $forToken = [
            'iat' => $issuedAt->getTimestamp(),
            'iss' => '',
            'nbf' => $issuedAt->getTimestamp(),
            'exp' => $expire
        ];

        $data = [
            'jwt' => JWT::encode(array_merge($payload, $forToken), $payload['key'], 'HS256'),
            'expire' => $expire
        ];
        return $data;
    }

    private function _regenerate_get($payload)
    {
        if (@$this->_key_exists($this->key) && @$this->tokenkey) {
            $this->_checkToken();

            $check = array(
                'id_barang' => $payload['id'],
                'secretkey' => $payload['key']
            );

            $data = $this->barang->showfield($check);
            if ($data->num_rows() == 1) {
                $row = $data->row();
                $newpayload = [
                    'id' => $row->id_barang,
                    'nama' => $row->nama_barang,
                    'key' => $row->secretkey
                ];
                $jwt = $this->_generate_token($newpayload);
                $arr = [
                    'token' => $jwt['jwt'],
                    'update_at' => date('Y-m-d H:i:s'),
                    'expire_at' => date('Y-m-d H:i:s', $jwt['expire'])
                ];
                $id = ['id_karyawan' => $row->id_karyawan];
                $this->token->update($id, $arr);

                $newpayload['token'] = $jwt['jwt'];
                $newpayload['expire'] = $jwt['expire'];

                return $newpayload;
            }
        }else {
            $this->response([
                'status' => FALSE,
                'message' => 'Token Key Invalid'
            ], RestController::HTTP_BAD_REQUEST);
        }
    }

    private function _generate_key()
    {
        do {
            $salt = base_convert(bin2hex($this->security->get_random_bytes(64)), 16, 36);

            if ($salt === FALSE) {
                $salt = hash('sha256', time() . mt_rand());
            }

            $new_key = substr($salt, 0, config_ite,('rest_key_length'));
        } while ($this->_key_exists($new_key));

        return $new_key;
    }

    private function _get_key($key)
    {
        return $this->rest->db
        ->where(config_item('rest_key_column'), $key)
        ->get(config_item('rest_keys_table'))
        ->row();
    }

    private function _key_exists($key)
    {
    return $this->rest->db
    ->where(config_item('rest_key_column'), $key)
    ->count_all_results(config_item('rest_keys_table')) > 0;
    }

    private function _insert_key($key, $data)
    {
        $data[config_item('rest_key_column')] = $key;
        $data['create_at'] = date('Y-m-d H:i:s');

        return $this->rest->db
        ->set($data)
        ->insert(config_item('rest_key_table'));
    }

    private function _update_key($key, $data)
    {
        return $this->rest_db
        ->where(config_item('rest_key_column'), $key)
        ->update(config_item('rest_keys_table'), $data);
    }

    private function _delete_key($key)
    {
        return $this->rest->db
        ->where(config_item('rest_key_column'), $key)
        ->delete(config_item('rest_keys_table'));
    }

    public function index_post($slug='')
    {
        $jsonArray = json_decode ($this->input->raw_input_stream, true);
        $postReal = $this->form_validation->set_data($jsonArray);

        if(!$slug){
            $this->form_validation->set_rules('kode', 'Kode Barang', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('nama', 'Nama Barang', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('jenis', 'ID Jenis', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('satuan', 'ID Satuan', 'trim|required', [
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
            if(@$slug){ //untuk update
                if(@$slug && @$jsonArray ['kode']){
                    $arr['kode_barang'] = $jsonArray ['kode'];
                }
                if(@$slug && @$jsonArray ['nama']){
                    $arr['nama_barang'] = $jsonArray ['nama'];
                }
                if(@$slug && @$jsonArray ['jenis']){
                    $arr['id_jenis'] = $jsonArray ['jenis'];
                }
                if(@$slug && @$jsonArray ['satuan']){
                    $arr['id_satuan'] = $jsonArray ['satuan'];
                }
            }else{ //untuk insert
                $arr = [
                    'slug' => str_replace(' ', '-', strtolower($jsonArray ['nama'])),
                    'kode_barang' => $jsonArray ['kode'],
                    'nama_barang' => $jsonArray ['nama'],
                    'id_jenis' => $jsonArray ['jenis'],
                    'id_satuan' => $jsonArray ['satuan']
                ];
            }
            $this->checkNamaBarang($arr['slug']);
            if(!$slug){
                $arr['create_at'] = date('Y-m-d H:i:s');
                $ins = $this->barang->insert($arr);
            
                if($ins){
                    //untuk manggil detailbarang
                    if (@$jsonArray['item']) {
                        $idslug = ['slug' => $arr ['slug']];
                        $get = $this->barang->show($idslug)->row();
                        $this->detailbarang($get->id_barang, $jsonArray['item']);
                    }
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Created',
                        'message' => 'Barang was successful created!'
                    ], RestController::HTTP_CREATED);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Created',
                        'message' => 'Barang was error created!'
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else{
                $idslug = ['slug' => $slug];
                $row = $this->barang->show($idslug)->row_array();
                $id = ['id_barang' => $row['id_barang']];

                $arr['slug'] = str_replace(' ', '-', strtolower($jsonArray ['nama']));
                $arr['update_at'] = date('Y-m-d H:i:s');
                $upd = $this->barang->update($id, $arr);      

                if($upd){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Update',
                        'message' => 'Barang : '.$jsonArray['nama'].' was successful update!'
                    ], RestController::HTTP_OK);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Update',
                        'message' => 'Barang was error update!'
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }
        }
    }

    public function index_get($slug='')
    {
        if(@$slug){
            $get = $this->barang->show(['slug' => $slug]);
            $data = $get->row_array();
            $detail = $this->detail_barang->show(['id_barang' => $data['id_barang']])->result_array();
            $data['barang'] = $detail;
        }else{
            $get = $this->barang->show(); //nama model(alias)->nama function yg di model
            $barang = $get->result_array();
            $data = [];
            foreach ($barang as $brg) {
                $detail = $this->detail_barang->show(['id_barang' => $brg['id_barang']])->result_array();
                $brg['barang'] = $detail;
                $brg['overall_stok'] = $this->detail_barang->sumStok(['id_barang' => $brg['id_barang']])->row()->stok;
                $data[] = $brg;
            }
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

        if (@$this->barang['overall_stok'] <= 5) {
            $data = $this->barang['overall_stok']->fetch_assoc();
            if ($data) {
                $this->response([
                    'status' => TRUE,
                    'message' => 'Stok barang' .$jsonArray['nama']. 'kurang dari 5'
                ], RestController::HTTP_OK);
            }
        }
        // $slug = $koneksi->query("SELECT * FROM inv_barang WHERE overall_stok <= '5'");
        // $data = $slug->fetch_assoc();
        // if ($data) {
        //     $this->response([
        //         'status' => TRUE,
        //         'message' => 'Stok barang' .$jsonArray['nama']. 'kurang dari 5'
        //     ], RestController::HTTP_OK);
        // }
    }

	public function index_delete($slug)
	{
        if(@$slug){
            $idslug = ['slug' => $slug];
            $get = $this->barang->show($idslug);
            
            if($get->num_rows() == 1){
                $data = $get->row_array();
                $id = ['id_barang' => $data['id_barang']];
                $del = $this->barang->delete($id);
                if($del){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Success delete one Barang',
                        'message' => 'Barang : '.$data ['nama_barang'].' was deleted!'
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

    public function detail_post($serial='')
    {
        $jsonArray = json_decode($this->input->raw_input_stream, true);
        $postReal = $this->form_validation->set_data($jsonArray);

        if(!$serial){
            $this->form_validation->set_rules('slug', 'Slug', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('item[][]', 'Item', 'trim|required', [
                'required' => '%s Required'
            ]);
        }

        if($this->form_validation->run() == FALSE && !$serial){
            $this->response([
                'status' => FALSE,
                'title' => 'Invalid input required',
                'message' => validation_errors()
            ], RestController::HTTP_BAD_REQUEST);
        }else{
            if(@$serial){
                if(@$serial && @$jsonArray ['barang']){
                    $arr['id_barang'] = $josnArray ['barang'];
                }
                if(@$serial && @$jsonArray ['sn']){
                    $arr['serial_number'] = $jsonArray ['sn'];
                }
                if(@$serial && @$jsonArray ['stok']){
                    $arr['stok'] = $jsonArray ['stok'];
                }
                if(@$serial && @$jsonArray ['status']){
                    $arr['id_status'] = $josnArray ['status'];
                }
                if(@$serial && @$jsonArray ['type']){
                    $arr['id_type'] = $josnArray ['type'];
                }
                if(@$serial && @$jsonArray ['ket']){
                    $arr['keterangan'] = $josnArray ['ket'];
                }
            }
            if(!$serial){
                $idslug = ['slug' => $jsonArray ['slug']];
                $get = $this->barang->show($idslug)->row();
                $ins = $this->detailbarang($get->id_barang, $jsonArray['item']);

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
                $id = ['serial_number' => $serial];
                $arr['update_at'] = date('Y-m-d H:i:s');
                $upd = $this->detail_barang->update($id, $arr);

                if($upd){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Update',
                        'message' => 'Detail Barang was successful update!'
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

    public function detail_get($serial_number='')
    {
        if(@$serial){
            $get = $this->detail_barang->show(['serial_number' => $serial]);
            $data = $get->row_array();
        }else{
            $get = $this->detail_barang->show();
            $data = $get->result();
        }
        if($get->num_rows() > 0){
            $this->response([
                'status' => TRUE,
                'title' => 'Success get Detail Barang',
                'data' => $data
            ], RestController::HTTP_OK);
        }else{
            $this->response([
                'status' => FALSE,
                'title' => 'Detail Barang not found',
                'data' => []
            ], RestController::HTTP_NOT_FOUND);
        }
    }

	public function detail_delete($serial_number)
	{
        if(@$serial_number){
            $idsn = ['serial_number' => $serial_number];
            $get = $this->detail_barang->show($idsn);
            
            if($get->num_rows() == 1){
                $data = $get->row_array();
                $id = ['id_detail_barang' => $data['id_detail_barang']];
                $del = $this->detail_barang->delete($id);
                if($del){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Success delete one Detail Barang',
                        'message' => 'Detail Barang SN : '.$data ['serial_number'].' was deleted!'
                    ], RestController::HTTP_OK);
                }else{
                    $this->response([
                        'status' => FALSE,
                        'title' => "Detail Barang can't deleted",
                        'message' => "Can't deleted Detail Barang"
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else{
                $this->response([
                    'status' => FALSE,
                    'title' => 'Detail Barang not found',
                    'message' => "ID Detail Barang can't found!"
                ], RestController::HTTP_NOT_FOUND);
            }
        }else{
            $this->response([
                'status' => FALSE,
                'title' => 'ID Detail Barang was required',
                'message' => 'ID Detail Barang must be required'
            ], RestController::HTTP_BAD_REQUEST);
        }
	}

    private function detailbarang($id_barang, $items)
    {
        if (@$items) {
            foreach ($items as $item) {
                $arr = [
                    'id_barang' => $id_barang,
                    'serial_number' => $item['sn'],
                    'stok' => $item['stok'],
                    'id_status' => $item['status'],
                    'id_type' => $item['type'],
                    'keterangan' => $item['ket']
                ];
                $arr['create_at'] = date('Y-m-d H:i:s');
                $this->detail_barang->insert($arr);
            }
            return true;
        }else {
            return false;
        }
    }

    private function checkNamaBarang($slug)
    {
        $idslug = ['slug' => $slug];
        $get = $this->barang->show($idslug);
        if ($get->num_rows() == 1) {
            $this->response([
                'status' => TRUE,
                'message' => 'Barang sudah tersedia'
            ], RestController::HTTP_BAD_REQUEST);
        }
    }

    public function kodeMax_get($kode_barang='')
    {
        $getMax = $this->barang->showMax();
        $data = $getMax->row();
        if ($data) {
            $this->response([
                'status' => TRUE,
                'title' => 'Success get Max Kode Barang',
                'data' => $data
            ], RestController::HTTP_OK);
        }
    }
}
?>