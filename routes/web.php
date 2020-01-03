<?php
header("Cache-Control: no-cache, must-revalidate");
header('Access-Control-Allow-Origin:  *');
header('Access-Control-Allow-Methods:  POST, GET, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers:  Content-Type, X-Auth-Token, Origin, Authorization');

// Route::get('/', function() { return Redirect::to("admin/login"); });

Route::get('/', function() { return view('pdf'); });


Route::group(['namespace' => 'Admin', 'prefix'=>'admin'], function () {
    //log in
	Route::get('/login', 'Controller\AdminController@login');
	Route::post('/checkLogin', 'Controller\AdminController@checkLogin');
	Route::get('/forward_login', 'Controller\AdminController@forward_login');

	//log out
    Route::get('/logout', 'Controller\AdminController@logout');
    
    //Register
	Route::get('/view_registerUser', 'Controller\AdminRegisterController@view_registerUser');
    Route::post('/add_registerUser', 'Controller\AdminRegisterController@add_registerUser');
    
    //Register Company
    Route::group(['middleware' => 'admin'], function () {
		Route::get('/view_registerCompany', 'Controller\AdminRegisterController@view_registerCompany');
		Route::post('/add_registerCompany', 'Controller\AdminRegisterController@add_registerCompany');
    });
    
    Route::group(['middleware' => 'admin', 'middleware' => 'company'], function () {
        // DashBoard
		Route::get('/dashboard/{reportBase}', 'Controller\AdminController@dashboard');

    });

    Route::get('/test', 'Controller\TestController@pdf');

});
