<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'welcome';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

$route['approved']='Approved/index';
$route['approved/(:any)']='Approved/index/$1';

$route['barang']='Barang/index';
$route['barang/(:any)']='Barang/index/$1';

$route['barang-detail']='Barang/detail';
$route['barang-detail/(:any)']='Barang/detail/$1';

$route['barang-kodeMax']='Barang/kodeMax';
$route['barang-kodeMax/(:any)']='Barang/kodeMax/$1';

$route['barang-proses']='BarangProses/index';
$route['barang-proses/(:any)']='BarangProses/index/$1';

$route['barang-proses-detail']='BarangProses/detail';
$route['barang-proses-detail/(:any)']='BarangProses/detail/$1';

$route['barang-proses-noMax']='BarangProses/noMax';
$route['barang-proses-noMax/(:any)']='BarangProses/noMax/$1';

$route['jenis-barang']='JenisBarang/index';
$route['jenis-barang/(:any)']='JenisBarang/index/$1';

$route['kategori-proses']='KategoriProses/index';
$route['kategori-proses/(:any)']='KategoriProses/index/$1';

$route['request-barang']='RequestBarang/index';
$route['request-barang/(:any)']='RequestBarang/index/$1';

$route['request-barang-detail']='RequestBarang/detail';
$route['request-barang-detail/(:any)']='RequestBarang/detail/$1';

$route['request-barang-kodeMax']='RequestBarang/kodeMax';
$route['request-barang-kodeMax/(:any)']='RequestBarang/kodeMax/$1';

$route['satuan-barang']='SatuanBarang/index';
$route['satuan-barang/(:any)']='SatuanBarang/index/$1';

$route['status-barang']='StatusBarang/index';
$route['status-barang/(:any)']='StatusBarang/index/$1';

$route['type-barang']='TypeBarang/index';
$route['type-barang/(:any)']='TypeBarang/index/$1';