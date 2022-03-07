<?php
defined('BASEPATH') OR exit('No direct script access allowed');
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

        if (!$this->_key_exists($this->input->nsapi_request_headers()['token'])) {
            $this->response([
                'status' => FALSE,
                'message' => 'Invalid API key'
            ], RestController::HTTP_BAD_REQUEST);
        }else{
            $this->key = $this->input->request_headers()['token'];
            $this->tokenkey = $this->input->request_headers()['tokenkey'];
            $this->_checkToken();
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

            if ($time->getTImestamp() > $payload->exp) {
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
        $issuedAt = new DateTImeImmutable();
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

    public function index_post_barang($id_barang='')
    {
        $jsonArray = json_decode ($this->input->raw_input_stream, true);
        $postReal = $this->form_validation->set_data($jsonArray);

        if(!$id_barang){
            $this->form_validation->set_rules('id_barang', 'ID Barang', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('slug', 'Slug', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('kode_barang', 'Kode Barang', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('nama_barang', 'Nama Barang', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('id_jenis', 'ID Jenis', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('id_satuan', 'ID Satuan', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('overall_stok', 'Overall Stok', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('create_at', 'Create At', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('update_at', 'Update At', 'trim|required', [
                'required' => '%s Required'
            ]);
        }

        if($this->form_validation->run() == FALSE && !$id_barang){
            $this->response([
                'status' => FALSE,
                'title' => 'Invalid input required',
                'message' => validation_errors()
            ], RestController::HTTP_BAD_REQUEST);
        }else{
            if(@$id_barang){
                if(@$id_barang && @$jsonArray ['kode_barang']){
                    $arr['kode_barang'] = $josnArray ['kode_barang'];
                }
                if(@$id_barang && @$jsonArray ['nama_barang']){
                    $arr['nama_barang'] = $josnArray ['nama_barang'];
                }
                if(@$id_barang && @$jsonArray ['id_jenis']){
                    $arr['id_jenis'] = $josnArray ['id_jenis'];
                }
                if(@$id_barang && @$jsonArray ['id_satuan']){
                    $arr['id_satuan'] = $josnArray ['id_satuan'];
                }
                if(@$id_barang && @$jsonArray ['overall_stok']){
                    $arr['overall_stok'] = $josnArray ['overall_stok'];
                }
                if(@$id_barang && @$jsonArray ['create_at']){
                    $arr['create_at'] = $josnArray ['create_at'];
                }
                if(@$id_barang && @$jsonArray ['update_at']){
                    $arr['update_at'] = $josnArray ['update_at'];
                }
            }else{
                $arr = [
                    'kode_barang' => $jsonArray ['kode_barang'],
                    'nama_barang' => $jsonArray ['nama_barang'],
                    'id_jenis' => $jsonArray ['id_jenis'],
                    'id_satuan' => $jsonArray ['id_satuan'],
                    'overall_stok' => $jsonArray ['overall_stok'],
                    'create_at' => $jsonArray ['create_at'],
                    'update_at' => $jsonArray ['update_at'],
                ];
            }
            if(!$id_barang){
                $arr['id_barang'] = $jsonArray ['id_barang'];
                $arr['created_at'] = date('Y-m-d H:i:s');

                $ins = $this->barang->insert($arr);
                if($ins){
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
                $id_barang = ['id_barang' => $id_barang];
                $arr['update_at'] = date('Y-m-d H:i:s');
                $upd = $this->barang->update($id_barang, $arr);
                if($upd){
                    $check = array(
                        'id_barang' => $id_barang
                    );
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Update',
                        'message' => 'Barang ID : '.$id_barang['id_barang'],'was successful update!'
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

    public function index_get_barang()
    {
        if(@$this->input->get()){
            $val = $this->input->get('val');

            $data = $get->row();
        }else{
            $get = $this->inv_barang->show();
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

	public function index_delete_barang($id_barang)
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



    public function index_post_detail_barang($id_detail_barang='')
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

    public function index_get_detail_barang()
    {
        if(@$this->input->get()){
            $val = $this->input->get('val');

            $data = $get->row();
        }else{
            $get = $this->inv_detail_barang->show();
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

	public function index_delete_detail_barang($id_detail_barang)
	{
        if(@$id_detail_barang){
            $id_detail_barang = ['id_detail_barang' => $id_detail_barang];
            $get = $this->inv_detail_barang->show($id_detail_barang);
            $data = $get->row();
            if($get->num_rows() == 1){
                $del = $this->inv_detail_barang->delete($id_detail_barang);
                if($del){
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Success delete one Detail Barang',
                        'message' => 'Detail Barang id_detail_barang : '.$id_detail_barang ['id_detail_barang'].'was deleted!'
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

}
?>