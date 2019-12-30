<?php
header("Cache-Control: no-cache, must-revalidate");
header('Access-Control-Allow-Origin:  *');
header('Access-Control-Allow-Methods:  POST, GET, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers:  Content-Type, X-Auth-Token, Origin, Authorization');

// Route::post('/', 'Controller\AuthController@test');
// Route::post('/', function() { return "Abcd123" ; });

// Route::post('/', 'AdminController@checkLogin');


Route::group(['namespace' => 'App', 'prefix'=>'app'], function () {
	// Route::post('/', function() { return "Abcd123" ; });
	Route::post('/', 'Controller\AuthController@checkLogin');


//     Route::post('/login', 'Controller\AuthController@login');

// 	Route::post('/test', 'Controller\AuthController@test');


// 	Route::group(['middleware' => 'app_api'], function() {
// 		Route::get('/respondWithToken', 'Controller\AuthController@respondWithToken');
// 		Route::get('/logout', 'Controller\AuthController@logout');
// 		Route::get('/me', 'Controller\AuthController@me');
// 		Route::post('/authenticate', 'Controller\AuthController@authenticate');

// 		// Product
// 		Route::post('/listingProduct', 'Controller\AppProductController@listingProduct');
// 	});
});
