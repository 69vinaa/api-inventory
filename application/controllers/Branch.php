<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH.'libraries/restserver/src/RestController.php');
require(APPPATH.'libraries/restserver/src/Format.php');
use chriskacerguis\RestServer\RestController;
class Branch extends RestController {

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

	public function index_get($dc='')
	{
		if(@$dc){
			$filter['dc'] = $dc;
			$get = $this->client->show($filter);
			$data = $get->result_array();
		}else{
			$get = $this->client->findBranch();
			$branch = $get->result_array();
			$data = [];
			foreach ($branch as $dc) {
				$dc['client'] = $this->client->show(['dc' => $dc['dc']])->result_array();
				$data[] = $dc;
			}
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

}

/* End of file Branch.php */
/* Location: ./application/controllers/Branch.php */