<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH.'libraries/restserver/src/RestController.php');
require(APPPATH.'libraries/restserver/src/Format.php');
use chriskacerguis\RestServer\RestController;

class Approved extends RestController
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

        $this->load->model('MApproved', 'approved');
        $this->load->model('MApprovedBy', 'approved_by');
        $this->load->model('MDetailBarang', 'detail_barang');
        $this->load->model('MDetailBarangProses', 'detail_barang_proses');
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

    public function index_post($id_approved_history='')
    {
        $jsonArray = json_decode($this->input->raw_input_stream, true);
        $postReal = $this->form_validation->set_data($jsonArray);

        
        
        $this->form_validation->set_rules('user', 'ID User', 'trim|required', [
            'Required' => '$s Required'
        ]);
        $this->form_validation->set_rules('id', 'ID Request/ID Barang Proses', 'trim|required', [
            'Required' => '$s Required'
        ]);
        $this->form_validation->set_rules('type', '0 (Request)/1 (Barang)', 'trim|required', [
            'Required' => '$s Required'
        ]);
        $this->form_validation->set_rules('status', 'Status Approved', 'trim|required', [
            'Required' => '$s Required'
        ]);
        $this->form_validation->set_rules('ket', 'Keterangan', 'trim|required', [
            'Required' => '$s Required'
        ]);
        

        if ($this->form_validation->run() == FALSE && !$id_approved_history) {
            $this->response([
                'status' => FALSE,
                'title' => 'Invalid input required',
                'message' => validation_errors()
            ], RestController::HTTP_BAD_REQUEST);
        }else {
            if (@$id_approved_history) {
                if (@$id_approved_history && @$jsonArray['status']) {
                    $arr['status_approved'] = $jsonArray['status'];
                }
                if (@$id_approved_history && @$jsonArray['ket']) {
                    $arr['keterangan'] = $jsonArray['ket'];
                }
            }

            if (@$id_approved_history) {
                
                $where = ['id_user' => $jsonArray['user']];
                if ($jsonArray['type'] == 0) {
                    $whereMax = ['id_request' => $jsonArray['id']];
                    $where['id_request'] = $jsonArray['id'];
                }else {
                    $whereMax = ['id_barang_proses' => $jsonArray['id']];
                    $where['id_barang_proses'] = $jsonArray['id'];
                }
                $id = ['id_approved_history' => $id_approved_history];
                $arr['time_approved'] = date('Y-m-d H:i:s');
                $arr['update_at'] = date('Y-m-d H:i:s');
                $upd = $this->approved->update($id, $arr);

                $get = $this->approved->show($where)->row();
                $getMax = $this->approved->showMax($whereMax)->row();
                if ($get->ordered == $getMax->ordered && $jsonArray['type'] != 0) {
                    $get = $this->detail_barang_proses->show(['id_barang_proses' => $where['id_barang_proses']]);
                    if ($get->num_rows() > 0) {
                        $rows = $get->result_array();
                        foreach ($rows as $row) {
                        //agar saat approved status barang langsung berubah
                        $this->detail_barang->update(['id_detail_barang' => $row['id_detail_barang']], ['id_status' => 1]);
                        $this->detail_barang_proses->update(['id_barang_proses' => $row['id_barang_proses']], ['id_status' => 1]);
                        }
                    }
                }

                if ($upd) {
                    $this->response([
                        'status' => TRUE,
                        'title' => 'Successful Update',
                        'message' => 'Approve was successful update!'
                    ], RestController::HTTP_OK);
                }else {
                    $this->response([
                        'status' => FALSE,
                        'title' => 'Error Update',
                        'message' => 'Detail Barang was error update!'
                    ], RestController::HTTP_BAD_REQUEST);
                }
            }
        }
    }

    public function index_get($id_approved_history='')
    {
        if (@$id_approved_history) {
            $get = $this->approved->show(['id_approved_history' => $id_approved_history]);
            $data = $get->row_array();
        }else {
            $get = $this->approved->show();
            $data = $get->result();
        }
        if ($get->num_rows() > 0) {
            $this->response([
                'status' => TRUE,
                'title' => 'Success get Approve',
                'data' => $data 
            ], RestController::HTTP_OK);
        }else {
            $this->response([
                'status' => FALSE,
                'title' => 'Approve not found',
                'data' => []
             ], RestController::HTTP_NOT_FOUND);
        }
    }
}

?>