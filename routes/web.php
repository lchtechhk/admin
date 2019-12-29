<?php
header("Cache-Control: no-cache, must-revalidate");
header('Access-Control-Allow-Origin:  *');
header('Access-Control-Allow-Methods:  POST, GET, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers:  Content-Type, X-Auth-Token, Origin, Authorization');

Route::get('/', function() { return Redirect::to("admin/login"); });

Route::group(['namespace' => 'Admin', 'prefix'=>'admin'], function () {
    Route::get('/login', 'Controller\AdminController@login');
    // Route::get('/login', function () {
    //     return view('welcome');
    // });

});
