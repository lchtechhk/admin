<?php
Route::group(['namespace' => 'App', 'prefix'=>'app'], function () {
	Route::post('/', 'Controller\AppTestController@test');
    Route::post('/login', 'Controller\AuthController@login');
	Route::group(['middleware' => 'app_api'], function() {
		Route::get('/respondWithToken', 'Controller\AuthController@respondWithToken');
		Route::get('/logout', 'Controller\AuthController@logout');
		Route::get('/me', 'Controller\AuthController@me');
		Route::get('/authenticate', 'Controller\AuthController@authenticate');
		Route::get('/refresh_token', 'Controller\AuthController@refresh_token');


		// Product
		Route::post('/listingProduct', 'Controller\AppProductController@listingProduct');
		Route::post('/getProductDetails', 'Controller\AppProductController@getProductDetails');

		// Category
		Route::get('/listingCategory', 'Controller\AppCategoryController@listingCategory');
		// District

		// Customer Address
		Route::get('/listingDistrict', 'Controller\AppDistrictController@listingDistrict');
		Route::post('/addCustomerAddress', 'Controller\AppAddressController@addCustomerAddress');
		Route::post('/updateCustomerAddress', 'Controller\AppAddressController@updateCustomerAddress');
		Route::post('/deleteCustomerAddress', 'Controller\AppAddressController@deleteCustomerAddress');
		Route::get('/getAddressByToken', 'Controller\AppAddressController@getAddressByToken');

		// Order
		Route::post('/listingOrder', 'Controller\AppOrderController@listingOrder');
		// Compnay
		Route::post('/getCompanyInfo', 'Controller\AppCustomerController@getCompanyInfo');

	});
});
