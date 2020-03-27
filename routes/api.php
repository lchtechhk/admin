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
		Route::get('/listingDistrict', 'Controller\AppDistrictController@listingDistrict');
		Route::post('/updateCustomerAddress', 'Controller\AppAddressController@updateCustomerAddress');
		// Order
		Route::post('/listingOrder', 'Controller\AppOrderController@listingOrder');
		// Compnay
		Route::post('/getCompanyInfo', 'Controller\AppCustomerController@getCompanyInfo');

	});
});
