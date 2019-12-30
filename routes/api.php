<?php
header("Cache-Control: no-cache, must-revalidate");
header('Access-Control-Allow-Origin:  *');
header('Access-Control-Allow-Methods:  POST, GET, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers:  Content-Type, X-Auth-Token, Origin, Authorization');


Route::group(['namespace' => 'App', 'prefix'=>'app'], function () {
	Route::post('/', 'Controller\AuthController@test');
    Route::post('/login', 'Controller\AuthController@login');
	Route::group(['middleware' => 'app_api'], function() {
		Route::get('/respondWithToken', 'Controller\AuthController@respondWithToken');
		Route::get('/logout', 'Controller\AuthController@logout');
		Route::get('/me', 'Controller\AuthController@me');
		Route::post('/authenticate', 'Controller\AuthController@authenticate');

		// Product
		Route::post('/listingProduct', 'Controller\AppProductController@listingProduct');
	});
});
