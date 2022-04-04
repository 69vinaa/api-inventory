<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require(APPPATH.'libraries/restserver/src/RestController.php');
require(APPPATH.'libraries/restserver/src/Format.php');
use chriskacerguis\RestServer\RestController;

class Client extends RestController {

	public function __construct(){
		parent::__construct();

		if (!$this->_key_exists($this->input->request_headers()['token'])) {
			$this->response([
				'status' => FALSE,
				'message' => 'Invalid API key'
			], RestCOntroller::HTTP_BAD_REQUEST);
		}else {
			$this->key = $this->input->request_headers()['token'];
		}

		$this->load->model('MClientPeplink', 'client');
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

	public function index_get($slug='')
	{
		$filter = [];
		if ($this->input->get('dc')) {
			$filter['dc'] = $this->input->get('dc');
		}

		if(@$slug){
			$filter['slug'] = $slug;
			$get = $this->client->show($filter);
			$data = $get->row_array();
		}else{
			$get = $this->client->show($filter);
			$data = $get->result_array();
		}


		if($get->num_rows() > 0){
			$this->response([
				'status' => TRUE,
				'title' => 'Success Get Client',
				'data' => $data
			], RestController::HTTP_OK);
		}else{
			$this->response([
				'status' => FALSE,
				'title' => 'Client not found',
				'data' => []
			], RestController::HTTP_NOT_FOUND);
		}
	}

	private function _pre_regex($val)
	{
		$newstr = preg_replace('/[^a-zA-Z0-9\']/', '-', $val);
		return $newstr = str_replace("'", '', $newstr);
	}

	public function index_post($slug='')
	{
		$data = json_decode($this->input->raw_input_stream, true);
		$postReal = $this->form_validation->set_data($data);

		$this->form_validation->set_rules('ip', 'IP Address', 'trim|required');
		$this->form_validation->set_rules('uname', 'Username Account', 'trim|required');
		$this->form_validation->set_rules('pass', 'Password Account', 'trim|required');
		$this->form_validation->set_rules('nm_toko', 'Nama Toko', 'trim|required');
		$this->form_validation->set_rules('dc', 'Distribution Center', 'trim|required');
		$this->form_validation->set_rules('clientId', 'Client ID', 'trim|required');
		$this->form_validation->set_rules('clientSecret', 'Secure Code', 'trim|required');
		$this->form_validation->set_rules('accessToken', 'Access Token', 'trim|required');

		if ($this->form_validation->run() == FALSE) {
			$this->response([
				'status' => FALSE,
				'title' => 'Invalid input reuqired',
				'message' => validation_errors()
			], RestController::HTTP_BAD_REQUEST);
		} else {
			$toko = htmlentities(htmlspecialchars($data['nm_toko']));
			$arr = [
				'ip' => $data['ip'],
				'username' => htmlentities(htmlspecialchars($data['uname'])),
				'password' => htmlentities(htmlspecialchars($data['pass'])),
				'nama_toko' => $toko,
				'slug' => $this->_pre_regex(str_replace(' ', '', strtolower($toko))),
				'dc' => $data['dc'],
				'clientId' => $data['clientId'],
				'clientSecret' => $data['clientSecret'],
				'accessToken' => $data['accessToken']
			];

			if (@$slug) {
				$arr['updated_at'] = date('Y-m-d H:i:s');
				$i = ['slug' => $slug];
				$action = $this->client->update($i,$arr);
			}else{
				$arr['created_at'] = date('Y-m-d H:i:s');
				$action = $this->client->insert($arr);
			}

			if($action){
				$this->response([
					'status' => TRUE,
					'title' => 'Successful Processed',
					'message' => 'Client was successful processed!'
				], RestController::HTTP_CREATED);
			}else{
				$this->response([
					'status' => FALSE,
					'title' => 'Error Processed',
					'message' => 'Client was error processed!'
				], RestController::HTTP_BAD_REQUEST);
			}
		}
	}

}

/* End of file Client.php */
/* Location: ./application/controllers/Client.php */