<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH.'libraries/restserver/src/RestController.php');
require(APPPATH.'libraries/restserver/src/Format.php');
use chriskacerguis\RestServer\RestController;

class RequestBarang extends RestController
{
    const HTTP_OK = RestController::HTTP_OK;
    const HTTP_CREATED = RestController::HTTP_CREATED;
    const HTTP_BAD_REQUEST = RestController::HTTP_BAD_REQUEST;
    const HTTP_NOT_FOUND = RestController::HTTP_NOT_FOUND;

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

        $this->load->model('MRequestBarang', 'request_barang');
        $this->load->model('MDetailRequestBarang', 'detail_request_barang');
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
                'mesaage' => $e->getMessage()
            ], RestController::HTTP_BAD_REQUEST);
        }
    }

    public function _key_exists($key)
    {
        return $this->rest->db
        ->where(config_item('rest_key_column'), $key)
        ->count_all_results(config_item('rest_keys_table')) > 0;
    }

    public function index_post($kode_request='')
    {
        $jsonArray = json_decode($this->input->raw_input_stream, true);
        $postReal = $this->form_validation->set_data($jsonArray);

        if (!$kode_request) {
            $this->form_validation->set_rules('kode', 'Kode Request', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('user', 'ID User', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('nama', 'Nama Penerima', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('almt', 'Alamat Penerima', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('notelp', 'No Telp', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('item[][]', 'Item', 'trim|required', [
                'required' => '%s Required'
            ]);
        }

        if ($this->form_validation->run() == FALSE && !$kode_request) {
            $this->response([
                'status' => FALSE,
                'title' => 'Invalid input required',
                'message' => validation_errors()
            ], RestController::HTTP_BAD_REQUEST);
        }else {
            if (@$kode_request) {
                if (@$kode_request && @$jsonArray['kode']) {
                    $arr['kode_request'] = $jsonArray['kode'];
                }
                if (@$kode_request && @$jsonArray['user']) {
                    $arr['id_user'] = $jsonArray['user'];
                }
                if (@$kode_request && @$jsonArray['nama']) {
                    $arr['penerima'] = $jsonArray['nama'];
                }
                if (@$kode_request && @$jsonArray['almt']) {
                    $arr['alamat'] = $jsonArray['almt'];
                }
                if (@$kode_request && @$jsonArray['notelp']) {
                    $arr['no_telp'] = $jsonArray['notelp'];
                }
            }else {
                $arr = [
                    'kode_request' => $jsonArray['kode'],
                    'id_user' => $jsonArray['user'],
                    'penerima' => $jsonArray['nama'],
                    'alamat' => $jsonArray['almt'],
                    'no_telp' => $jsonArray['notelp']
                ];
            }
            if (!$kode_request) {
                $arr['tgl'] = date('Y-m-d H:i:s');
                $arr['create_at'] = date('Y-m-d H:i:s');

                $ins = $this->request_barang->insert($arr);

                if ($ins) {

                    $kode = ['kode_request' => $arr['kode_request']];
                    $get = $this->request_barang->show($kode)->row();
                    $this->detailrequest($get->id_request, $jsonArray['item']);
                    $this->approved($get->id_request);

                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Created',
                        'message' => 'Request was successful created!'
                    ], RestController::HTTP_CREATED);
                }else {
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Created',
                        'message' => 'Request was error created!'
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else {
                $kode = ['kode_request' => $kode_request];
                $row = $this->request_barang->show($kode)->row_array();
                $id = ['id_request' => $row['id_request']];

                $arr['kode_request'] = str_replace(' ', '-', strtolower($jsonArray['kode']));
                $arr['update_at'] = date('Y-m-d H:i:s');
                $upd = $this->request_barang->update($id, $arr);
                if ($upd) {
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Update',
                        'message' => 'Request was successful update!'
                    ], RestController::HTTP_OK);
                }else {
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Update',
                        'message' => 'Request was error update!'
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }
        }
    }

    public function index_get($kode_request='')
    {
        if (@$kode_request) {
            $get = $this->request_barang->show(['kode_request' => $kode_request]);
            $data = $get->row_array();
            $detail = $this->detail_request_barang->show(['id_request' => $data['id_request']])->result_array();
            $data['request'] = $detail;
            $approved = $this->approved->show(['id_request' => $data['id_request']])->result_array();
            $data['approved'] = $approved;
        }else {
            $get = $this->request_barang->show();
            $request_barang = $get->result_array();
            $data = [];
            foreach ($request_barang as $rbrg) {
                $detail = $this->detail_request_barang->show(['id_request' => $rbrg['id_request']])->result_array();
                $rbrg['request_barang'] = $detail;
                $data[] = $rbrg;
            }
        }
        if ($get->num_rows() > 0) {
            $this->response([
                'status' => TRUE,
                'title' => 'Success get Request',
                'data' => $data
            ], RestController::HTTP_OK);
        }else {
            $this->response([
                'status' => FALSE,
                'title' => 'Request not found',
                'data' => []
            ], RestController::HTTP_NOT_FOUND);
        }
    }

    public function index_delete($kode_request)
    {
        if (@$kode_request) {
            $kode = ['kode_request' => $kode_request];
            $get = $this->request_barang->show($kode);

            if ($get->num_rows() == 1) {
                $data = $get->row_array();
                $id = ['id_request' => $data['id_request']];
                $del = $this->request_barang->delete($id);

                if ($del) {
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Success delete one Request',
                        'message' => 'Request was deleted!'
                    ], RestController::HTTP_OK);
                }else {
                    $this->response([
                        'status' => FALSE,
                        'title' => "Request can't deleted",
                        'message' => "Can't deleted Request"
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }else {
                $this->response([
                    'status' => FALSE,
                    'title' => 'Request not found',
                    'message' => "ID Request can't found!"
                ], RestController::HTTP_NOT_FOUND);
            }
        }else {
            $this->response([
                'status' => FALSE,
                'title' => 'ID Request was required',
                'message' => 'ID Request must be required'
            ], RestController::HTTP_BAD_REQUEST);
        }
    }

    public function detail_post($id_detail_request='')
    {
        $jsonArray = json_decode($this->input->raw_input_stream, true);
        $postReal = $this->form_validation->set_data($jsonArray);

        if (!$id_detail_request) {
            $this->form_validation->set_rules('kode', 'Kode Request', 'trim|required', [
                'required' => '%s Required'
            ]);
            $this->form_validation->set_rules('item[][]', 'Item', 'trim|required', [
                'required' => '%s Required'
            ]);
        }

        if ($this->form_validation->run() == FALSE && !$id_detail_request) {
            $this->response([
                'status' => FALSE,
                'title' => 'Invalid input required',
                'message' => validation_errors()
            ], RestController::HTTP_BAD_REQUEST);
        }else {
            if (@$id_detail_request) {
                if (@$id_detail_request && @$jsonArray['request']) {
                    $arr['id_request'] = $jsonArray['request'];
                }
                if (@$id_detail_request && @$jsonArray['barang']) {
                    $arr['id_barang'] = $jsonArray['barang'];
                }
                if (@$id_detail_request && @$jsonArray['jml']) {
                    $arr['jml_barang'] = $jsonArray['jml'];
                }
                if (@$id_detail_request && @$jsonArray['ket']) {
                    $arr['keterangan'] = $jsonArray['ket'];
                }
            }
            if (!$id_detail_request) {
                $iddr = ['kode_request' => $jsonArray['kode']];
                $get = $this->request_barang->show($iddr)->row();
                $ins = $this->detailrequest($get->id_request, $jsonArray['item']);

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
                $id = ['id_detail_request' => $id_detail_request];
                $arr['update_at'] = date('Y-m-d H:i:s');
                $upd = $this->detail_request_barang->update($id, $arr);

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

    public function detail_get($id_detail_request='')
    {
        if (@$id_detail_request) {
            $get = $this->detail_request_barang->show(['id_detail_request' => $id_detail_request]);
            $data = $get->row_array();
        }else {
            $get = $this->detail_request_barang->show();
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

    public function detail_delete($id_detail_request)
    {
        if (@$id_detail_request) {
            $iddr = ['id_detail_request' => $id_detail_request];
            $get = $this->detail_request_barang->show($iddr);

            if ($get->num_rows() == 1) {
                $data = $get->row_array();
                $id = ['id_detail_request' => $data['id_detail_request']];
                $del = $this->detail_request_barang->delete($id);
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

    private function detailrequest($id_request, $items)
    {
        if (@$items) {
            foreach ($items as $item) {
                $arr = [
                    'id_request' => $id_request,
                    'id_barang' => $item['barang'],
                    'jml_barang' => $item['jml'],
                    'keterangan' => $item['ket']
                ];

                $arr['create_at'] = date('Y-m-d H:i:s');
                $this->detail_request_barang->insert($arr);
            }
            return true;
        }else {
            return false;
        }
    }

    public function approved($id_request, $type = 15)
    {
        $get = $this->approved_by->show(['doc_approved' => $type]);
        if ($get->num_rows() > 0) {
            $rows = $get->result_array();
            foreach ($rows as $row) {
                $arr = [
                    'id_request' => $id_request,
                    'id_user' => $row['approved_by'],
                    'title' => $row['check_name'],
                    'ordered' => $row['ordered']
                ];

                $arr['create_at'] = date('Y-m-d H:i:s');
                $this->approved->insert($arr);
            }
            return true;
        }else {
            return false;
        }
    }

    public function kodeMax_get($kode_request='')
    {
        $getMax = $this->request_barang->showMax();
        $data = $getMax->row();
        if ($data) {
            $this->response([
                'status' => TRUE,
                'title' => 'Success get Max Kode Request',
                'data' => $data
            ], RestController::HTTP_OK);
        }
    }
}
?>