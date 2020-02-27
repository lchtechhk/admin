<?php
Route::group(['namespace' => 'App', 'prefix'=>'app'], function () {
	Route::post('/', 'Controller\AuthController@test');
    Route::post('/login', 'Controller\AuthController@login');
	Route::group(['middleware' => 'app_api'], function() {
		Route::get('/respondWithToken', 'Controller\AuthController@respondWithToken');
		Route::get('/logout', 'Controller\AuthController@logout');
		Route::get('/me', 'Controller\AuthController@me');
		Route::get('/authenticate', 'Controller\AuthController@authenticate');
		Route::get('/refresh_token', 'Controller\AuthController@refresh_token');


		// Product
		Route::post('/listingProduct', 'Controller\AppProductController@listingProduct');
		// Category
		Route::post('/listingCategory', 'Controller\AppCategoryController@listingCategory');
		// Order
		Route::post('/listingOrder', 'Controller\AppOrderController@listingOrder');
		// Order
		Route::post('/getCompanyInfo', 'Controller\AppCustomerController@getCompanyInfo');

	});
});
