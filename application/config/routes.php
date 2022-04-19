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

$route['Auth']='Users/index';

$route['Branch']['GET'] = 'Client/branch/';
$route['Branch/(:any)']['GET'] = 'Client/branch/$1';

$route['inv_barang']='Barang/index';
$route['inv_barang/(:any)']='Barang/index/$1';

$route['inv_barang_proses']='BarangProses/index';
$route['inv_barang_proses/(:any)']='BarangProses/index/$1';

$route['inv_jenis_barang']='JenisBarang/index';
$route['inv_jenis_barang/(:any)']='JenisBarang/index/$1';

$route['inv_kategori_proses']='KategoriProses/index';
$route['inv_kategori_proses/(:any)']='KategoriProses/index/$1';

$route['inv_satuan_barang']='SatuanBarang/index';
$route['inv_satuan_barang/(:any)']='SatuanBarang/index/$1';

$route['inv_status_barang']='StatusBarang/index';
$route['inv_status_barang/(:any)']='StatusBarang/index/$1';

$route['type_barang']='CTypeBarang/index';
$route['type_barang/(:any)']='CTypeBarang/index/$1';