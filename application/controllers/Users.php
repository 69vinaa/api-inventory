<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require(APPPATH.'libraries/restserver/src/RestController.php');
require(APPPATH.'libraries/restserver/src/Format.php');
use chriskacerguis\RestServer\RestController;

class Users extends RestController {
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

		$this->load->model('MUsers', 'auth');
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


	public function index_post()
	{
		$data = json_decode ($this->input->raw_input_stream, true);
        $postReal = $this->form_validation->set_data($data);

		$this->form_validation->set_rules('uname', 'Username', 'trim|required');
		$this->form_validation->set_rules('pass', 'Password', 'trim|required|min_length[6]');

		if ($this->form_validation->run() == FALSE) {
			$this->response([
				'status' => FALSE,
				'title' => 'Invalid input required',
				'message' => validation_errors()
			], RestController::HTTP_BAD_REQUEST);
		} else {
			$uname = htmlentities(htmlspecialchars($data['uname']));
			$pass = htmlentities(htmlspecialchars($data['pass']));

			$where = ['username' => $uname];
			$row = $this->auth->show($where);
			if ($row->num_rows() < 1) {
				$this->response([
					'status' => FALSE,
					'title' => 'User Not Found',
					'message' => 'Please check your username and password!'
				], RestController::HTTP_BAD_REQUEST);
			}else{
				$show = $row->row();
				if ($show->is_active == 0) {
					$this->response([
						'status' => FALSE,
						'title' => 'User Not Active',
						'message' => 'User '.$show->username.' is not active, please contact Administrator!'
					], RestController::HTTP_BAD_REQUEST);
				}else{
					if (password_verify(base64_encode($pass), $show->password)) {
						$avatar = @$show->avatar ? $show->avatar : 'user.jpg';
						$remToken = $show->remember_token;

						$array = array(
							'id' => $show->id,
							'nama' => $show->name,
							'username' => $show->username,
							'token' => $show->secretkey,
							'idr' => $show->id_roles,
							'roles' => $show->roles,
							'code' => $show->code,
							'idd' => $show->id_divisi,
							'divisi' => $show->divisi,
							'remember_token' => $remToken,
						);
						
						$this->response([
							'status' => TRUE,
							'title' => 'Success get User',
							'data' => $array
						], RestController::HTTP_OK);
					}else{
						$alert = '<div class="alert alert-danger alert-dismissible fade show" role="alert">
						<i class="mdi mdi-block-helper me-2"></i>
						<strong>Error!</strong> Password mengalami kesalahan, harap masukan password dengan benar.
						<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>';
						$this->response([
							'status' => FALSE,
							'title' => 'Error Username or Password',
							'message' => 'Username atau Password mengalami kesalahan, harap masukan password dengan benar.'
						], RestController::HTTP_BAD_REQUEST);
					}
				}
			}
		}
	}

}

/* End of file Users.php */
/* Location: ./application/controllers/Users.php */