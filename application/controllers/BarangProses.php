<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH.'libraries/restserver/src/RestController.php');
require(APPPATH.'libraries/restserver/src/Format.php');
use chriskacerguis\RestServer\RestController;

class BarangProses extends RestController
{
    const HTTP_OK = RestController::HTTP_OK;
    const HTTP_CREATED = RestController::HTTP_CREATED;
    const HTTP_BAD_REQUEST = RestController::HTTP_BAD_REQUEST;
    const HTTP_NOT_FOUND = RestController::HTTP_NOT_FOUND;

    private $result = false;
    public $key = '';
    public $tokenkey = '';

    public function __construct()
    {
        parent::__construct();

        if (!$this->_key_exists($this->input->request_headers()['token'])) {
            $this->response([
                'status' => FALSE,
                'message' => 'Invalid API Key'
            ], RestController::HTTP_BAD_REQUEST);
        }else {
            $this->key = $this->input->request_headers()['token'];
        }

        $this->load->model('MBarangProses', 'barang_proses');
        $this->load->model('MDetailBarangProses', 'detail_barang_proses');
        $this->load->model('MPenerima', 'penerima');
        $this->load->model('MApproved', 'approved');
        $this->load->model('MApprovedBy', 'approved_by');
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

        if (!$slug) {
            $this->form_validation->set_rules('kategori', 'ID Kategori Proses', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('no', 'No Proses', 'trim|required', [
                'required' => '$s Required'
            ]);
            $this->form_validation->set_rules('user', 'ID User', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('ket', 'Keterangan', 'trim|required', [
                'require' => '%s Required'
            ]);
            $this->form_validation->set_rules('item[][]', 'Item', 'trim|required', [
                'required' => '%s Required'
            ]);

            if (@$jsonArray['kategori'] == 1) {  
                $this->form_validation->set_rules('perusahaan', 'ID Perusahaan', 'trim|required', [
                    'require' => '%s Required'
                ]);
                $this->form_validation->set_rules('nama', 'Nama Penerima', 'trim|required', [
                    'require' => '%s Required'
                ]);
                $this->form_validation->set_rules('alamat', 'Alamat Penerima', 'trim|required', [
                    'require' => '%s Required'
                ]);
                $this->form_validation->set_rules('notelp', 'No Telp', 'trim|required', [
                    'require' => '%s Required'
                ]);
            }
        }

        if ($this->form_validation->run() == FALSE && !$slug) {
            $this->response([
                'status' => FALSE,
                'title' => 'Invalid input required',
                'message' => validation_errors()
            ], RestController::HTTP_BAD_REQUEST);
        }else {
            if (@$slug) {
                if (@$slug && @$jsonArray['kategori']) {
                    $arr['id_kategori_proses'] = $jsonArray['kategori'];
                }
                if (@$slug && @$jsonArray['no']) {
                    $arr['no_proses'] = $jsonArray['no'];
                }
                if (@$slug && @$jsonArray['user']) {
                    $arr['id_user'] = $jsonArray['user'];
                }
                if (@$slug && @$jsonArray['ket']) {
                    $arr['keterangan'] = $jsonArray['ket'];
                }
            }else {
                    $arr = [
                        'slug' => str_replace(' ', '-', strtolower($jsonArray ['no'])),
                        'id_kategori_proses' => $jsonArray['kategori'],
                        'no_proses' => $jsonArray['no'],
                        'id_user' => $jsonArray['user'],
                        'keterangan' => $jsonArray['ket']
                    ];
            }
            if (!$slug) {
                $arr['tgl_proses_barang'] = date('Y-m-d H:i:s');
                $arr['create_at'] = date('Y-m-d H:i:s');
                $ins = $this->barang_proses->insert($arr);

                if ($ins) {
                    $idslug = ['slug' => $arr['slug']];
                    $get = $this->barang_proses->show($idslug)->row();
                    $this->detailbarang($get->id_barang_proses, $jsonArray['item']);
                    $this->approved($get->id_barang_proses);
                    
                    if (@$jsonArray['kategori'] == 1) {
                        $arr = [
                            'id_barang_proses' => $get->id_barang_proses,
                            'id_perusahaan' => $jsonArray['perusahaan'],
                            'nama_penerima' => $jsonArray['nama'],
                            'alamat_penerima' => $jsonArray['alamat'],
                            'no_telp' => $jsonArray['notelp']
                        ];
                        $arr['create_at'] = date('Y-m-d H:i:s');
                        $this->penerima->insert($arr);
                    }

                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Created',
                        'message' => 'Barang Proses was successful created!'
                    ], RestController::HTTP_BAD_REQUEST);
                }else {
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Created',
                        'message' => 'Barang Proses was error created!'
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else {
                $idslug = ['slug' => $slug];
                $row = $this->barang_proses->show($idslug)->row_array();
                $id = ['id_barang_proses' => $row['id_barang_proses']];

                $arr['slug'] = str_replace(' ', '-', strtolower($jsonArray['no']));
                $arr['update_at'] = date('Y-m-d H:i:s');
                $upd = $this->barang_proses->update($id, $arr);

                if ($upd) {
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Update',
                        'message' => 'Barang Proses : '.$jsonArray['no'].' was successful update!'
                    ], RestController::HTTP_OK);
                }else {
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Update',
                        'message' => 'Barang Proses was error update!'
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }
        }
    }

    public function index_get($slug='')
    {
        if (@$slug) {
            $get = $this->barang_proses->show(['slug' => $slug]);
            $data = $get->row_array();
            $detail = $this->detail_barang_proses->show(['id_barang_proses' => $data['id_barang_proses']])->result_array();
            $data['barang_proses'] = $detail;
            $approved = $this->approved->show(['id_barang_proses' => $data['id_barang_proses']])->result_array();
            $data['approved'] = $approved;
        }else {
            $get = $this->barang_proses->show();
            $barang_proses = $get->result_array();

            $data = [];
            foreach ($barang_proses as $brgp) {
                $detail = $this->detail_barang_proses->show(['id_barang_proses' => $brgp['id_barang_proses']])->result_array();
                $brgp['barang_proses'] = $detail;
                $data[] = $brgp;
            }
        }
        if ($get->num_rows() > 0) {
            $this->response([
                'status' => TRUE,
                'title' => 'Success get Barang Proses',
                'data' => $data
            ], RestController::HTTP_OK);
        }else{
            $this->response([
                'status' => FALSE,
                'title' => 'Barang Proses not found',
                'data' => []
            ], RestController::HTTP_NOT_FOUND);
        }
    }

    public function index_delete($slug)
    {
        if (@$slug) {
            $idslug = ['slug' => $slug];
            $get = $this->barang_proses->show($idslug);

            if ($get->num_rows() == 1) {
                $data = $get->row_array();
                $id = ['id_barang_proses' => $data['id_barang_proses']];
                $del = $this->barang_proses->delete($id);
                if ($del) {
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Success delete one Barang Proses',
                        'message' => 'Barang Proses : '.$data['no_proses'].' was deleted!'
                    ], RestController::HTTP_OK);
                }else {
                    $this->response([
                        'status' => FALSE,
                        'title' => "Barang Proses can't deleted",
                        'message' => "Can't deleted Barang Proses"
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else {
                $this->response([
                    'status' => FALSE,
                    'title' => 'Barang not found',
                    'message' => "ID Barang Proses can't found!"
                ], RestController::HTTP_NOT_FOUND);
            }
        }else {
            $this->response([
                'status' => FALSE,
                'title' => 'ID Barang Proses was required',
                'message' => 'ID Barang Proses must be required'
            ], RestController::HTTP_BAD_REQUEST);
        }
    }

    public function detail_post($id_detail_barang_proses='')
    {
        $jsonArray = json_decode($this->input->raw_input_stream, true);
        $postReal = $this->form_validation->set_data($jsonArray);

        if (!$id_detail_barang_proses) {
            $this->form_validation->set_rules('slug', 'Slug', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('item[][]', 'Item', 'trim|required', [
                'required' => '%s Required'
            ]);
        }

        if ($this->form_validation->run() == FALSE && !$id_detail_barang_proses) {
            $this->response([
                'status' => FALSE,
                'title' => 'Invalid input required',
                'message' => validation_errors()
            ], RestController::HTTP_BAD_REQUEST);
        }else {
            if (@$id_detail_barang_proses) {
                if (@$id_detail_barang_proses && @$jsonArray['barang_proses']) {
                    $arr['id_barang_proses'] = $jsonArray['barang_proses'];
                }
                if (@$id_detail_barang_proses && @$jsonArray['detail_barang']) {
                    $arr['id_detail_barang'] = $jsonArray['detail_barang'];
                }
                if (@$id_detail_barang_proses && @$jsonArray['status']) {
                    $arr['id_status'] = $jsonArray['status'];
                }
                if (@$id_detail_barang_proses && @$jsonArray['jml']) {
                    $arr['jml_barang'] = $jsonArray['jml'];
                }
            }
            if (!$id_detail_barang_proses) {
                $iddbp = ['id_detail_barang_proses' => $id_detail_barang_proses];
                $get = $this->barang_proses->show($iddbp)->row();
                $ins = $this->detailbarang($get->id_barang_proses, $jsonArray['item']);
                
                if ($ins) {
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Created',
                        'message' => 'Detail Proses Barang was successful created!'
                    ], RestController::HTTP_CREATED);
                }else {
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Created',
                        'message' => 'Detail Proses Barang was error created!'
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else {
                $id = ['id_detail_barang_proses' => $id_detail_barang_proses];
                $arr['update_at'] = date('Y-m-d H:i:s');
                $upd = $this->detail_barang_proses->update($id, $arr);

                if ($upd) {
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Update',
                        'message' => 'Detail Barang Proses was successful update!'
                    ], RestController::HTTP_OK);
                }else {
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Update',
                        'message' => 'Detail Barang Proses was error update!'
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }
        }
    }

    public function detail_get($slug='')
    {
        if (@$slug) {
            $get = $this->detail_barang_proses->show(['slug' => $slug]);
            $data = $get->row_array();
        }else {
            $get = $this->detail_barang_proses->show();
            $data = $get->result();
        }
        if ($get->num_rows() > 0) {
            $this->response([
                'status' => TRUE,
                'title' => 'Success get Detail Barang Proses',
                'data' => $data
            ], RestController::HTTP_OK);
        }else {
            $this->response([
                'status' => FALSE,
                'title' => 'Detail Proses Barang not found',
                'data' => []
            ], RestController::HTTP_NOT_FOUND);
        }
    }

    public function detail_delete($id_detail_barang_proses)
    {
        if (@$id_detail_barang_proses) {
            $iddbp = ['id_detail_barang_proses' => $id_detail_barang_proses];
            $get = $this->detail_barang_proses->show($iddbp);

            if ($get->num_rows() == 1) {
                $data = $get->row_array();
                $id = ['id_detail_barang_proses' => $data['id_detail_barang_proses']];
                $del = $this->detail_barang_proses->delete($id);
                if ($del) {
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Success delete one Detail Barang Proses',
                        'message' => 'Detail Barang Proses was deleted!'
                    ], RestController::HTTP_OK);
                }else {
                    $this->response([
                        'status' => FALSE,
                        'title' => "Detail Barang Proses can't deleted",
                        'message' => "Can't deleted Detail Barang Proses"
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else {
                $this->response([
                    'status' => FALSE,
                    'title' => 'Detail barang not found',
                    'message' => "ID Detail Barang Proses can't found!"
                ], RestController::HTTP_NOT_FOUND);
            }
        }else {
            $this->response([
                'status' => FALSE,
                'title' => 'ID Detail Barang Proses was required',
                'message' => 'ID Detail Barang Proses must be required'
            ], RestController::HTTP_BAD_REQUEST);
        }
    }

    private function detailbarang($id_barang_proses, $items)
    {
        if (@$items) {
            foreach ($items as $item) {
                $arr = [
                    'id_barang_proses' => $id_barang_proses,
                    'id_detail_barang' => $item['detail_barang'],
                    'id_status' => $item['status'],
                    'jml_barang' => $item['jml']
                ];

                $arr['create_at'] = date('Y-m-d H:i:s');
                $this->detail_barang_proses->insert($arr);
            }
            return true;
        }else {
            return false;
        }
    }

    public function approved($id_barang_proses, $type = 14)
    {
        $get = $this->approved_by->show(['doc_approved' => $type]);
        if ($get->num_rows() > 0) {
            $rows = $get->result_array();
            foreach ($rows as $row) {
                $arr = [
                    'id_barang_proses' => $id_barang_proses,
                    'id_user' => $row['approved_by'],
                    'title' => $row['check_name'],
                    'ordered' => $row['ordered'],
                ];

                $arr['create_at'] = date('Y-m-d H:i:s');
                $this->approved->insert($arr);
            }
            return true;
        }else {
            return false;
        }
    }

    public function noMax_get($no_proses='')
    {
        $getMax = $this->barang_proses->showMax();
        $data = $getMax->row();
        if ($data) {
            $this->response([
                'status' => TRUE,
                'title' => 'Success get Max No Proses',
                'data' => $data
            ], RestController::HTTP_OK);
        }
    }
}

?>