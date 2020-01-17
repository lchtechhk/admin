<?php
header("Cache-Control: no-cache, must-revalidate");
header('Access-Control-Allow-Origin:  *');
header('Access-Control-Allow-Methods:  POST, GET, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers:  Content-Type, X-Auth-Token, Origin, Authorization');

Route::get('/', function() { return Redirect::to("admin/login"); });

// Route::get('/', function() { return view('pdf.content'); });


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

    Route::group(['middleware' => 'admin','middleware' => 'language' , 'middleware' => 'company'], function () {
        // Route::group(['middleware' => 'admin', 'middleware' => 'company'], function () {

        // DashBoard
        Route::get('/dashboard/{reportBase}', 'Controller\AdminController@dashboard');
        
        //Language
		// Route::get('/getlanguages', 'AdminSiteSettingController@getlanguages');
        Route::get('/listingLanguage', 'Controller\AdminLanguageController@listingLanguage');
        Route::post('/defaultLanguage', 'Controller\AdminLanguageController@defaultLanguage');			
		Route::get('/view_addLanguage', 'Controller\AdminLanguageController@view_addLanguage');
        Route::get('/view_editLanguage/{language_id}', 'Controller\AdminLanguageController@view_editLanguage');
        Route::post('/addLanguage', 'Controller\AdminLanguageController@addLanguage');
		Route::post('/updateLanguage/{language_id}', 'Controller\AdminLanguageController@updateDistrict');
        Route::post('/deleteLanguage','Controller\AdminLanguageController@deleteDistrict');
        
        //Manufacturer
		Route::get('/listingManufacturer', 'Controller\AdminManufacturerController@listingManufacturer');
		Route::get('/view_addManufacturer', 'Controller\AdminManufacturerController@view_addManufacturer');
		Route::get('/view_editManufacturer/{manufacturer_id}', 'Controller\AdminManufacturerController@view_editManufacturer');
		Route::post('/addManufacturer', 'Controller\AdminManufacturerController@addManufacturer');
		Route::post('/updateManufacturer', 'Controller\AdminManufacturerController@updateManufacturer');
        Route::post('/deleteManufacturer', 'Controller\AdminManufacturerController@deleteManufacturer');
        

    });

    Route::get('/test', 'Controller\TestController@pdf');

});
