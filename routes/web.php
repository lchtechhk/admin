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

    Route::group(['middleware' => 'admin', 'middleware' => 'company'], function () {
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
		Route::post('/updateLanguage', 'Controller\AdminLanguageController@updateLanguage');
        Route::post('/deleteLanguage','Controller\AdminLanguageController@deleteLanguage');

        //Manufacturer
		Route::get('/listingManufacturer', 'Controller\AdminManufacturerController@listingManufacturer');
		Route::get('/view_addManufacturer', 'Controller\AdminManufacturerController@view_addManufacturer');
		Route::get('/view_editManufacturer/{manufacturer_id}', 'Controller\AdminManufacturerController@view_editManufacturer');
		Route::post('/addManufacturer', 'Controller\AdminManufacturerController@addManufacturer');
		Route::post('/updateManufacturer', 'Controller\AdminManufacturerController@updateManufacturer');
        Route::post('/deleteManufacturer', 'Controller\AdminManufacturerController@deleteManufacturer');
        
        //Categories
        Route::get('/listingCategory', 'Controller\AdminCategoryController@listingCategory');
		Route::get('/view_addCategory', 'Controller\AdminCategoryController@view_addCategory');
		Route::get('/view_editCategory/{category_id}', 'Controller\AdminCategoryController@view_editCategory');
		Route::post('/addCategory', 'Controller\AdminCategoryController@addCategory');
		Route::post('/updateCategory', 'Controller\AdminCategoryController@updateCategory');
        Route::post('/deleteCategory', 'Controller\AdminCategoryController@deleteCategory');
        
        //Sub Category
		Route::get('/listingSubCategory', 'Controller\AdminSubCategoryController@listingSubCategory');
		Route::get('/view_addSubCategory', 'Controller\AdminSubCategoryController@view_addSubCategory');
		Route::get('/view_editSubCategory/{sub_category_id}', 'Controller\AdminSubCategoryController@view_editSubCategory');
		Route::post('/addSubCategory', 'Controller\AdminSubCategoryController@addSubCategory');
		Route::post('/updateSubCategory', 'Controller\AdminSubCategoryController@updateSubCategory');
        Route::post('/deleteSubCategory', 'Controller\AdminSubCategoryController@deleteSubCategory');
        
        //product
		Route::get('/listingProduct', 'Controller\AdminProductController@listingProduct');
		Route::get('/view_addProduct', 'Controller\AdminProductController@view_addProduct');
		Route::get('/view_editProduct/{product_id}', 'Controller\AdminProductController@view_editProduct');
		Route::post('/addProduct', 'Controller\AdminProductController@addProduct');
		Route::post('/updateProduct', 'Controller\AdminProductController@updateProduct');
        Route::post('/deleteProduct', 'Controller\AdminProductController@deleteProduct');
        
        //Product Image
		Route::get('/listingProductImage/{product_id}/', 'Controller\AdminProductImageController@listingProductImage');
		Route::post('/view_addProductImage', 'Controller\AdminProductImageController@view_addProductImage');
		Route::post('/view_editProductImage', 'Controller\AdminProductImageController@view_editProductImage');
		Route::post('/addProductImage', 'Controller\AdminProductImageController@addProductImage');
		Route::post('/updateProductImage', 'Controller\AdminProductImageController@updateProductImage');
		Route::post('/deleteProductImage', 'Controller\AdminProductImageController@deleteProductImage');

        //product Attribute
		Route::get('/listingProductAttribute/{product_id}/', 'Controller\AdminProductAttributeController@listingProductAttribute');
		Route::post('/view_addProductAttribute', 'Controller\AdminProductAttributeController@view_addProductAttribute');
		Route::post('/view_editProductAttribute', 'Controller\AdminProductAttributeController@view_editProductAttribute');
		Route::post('/addProductAttribute', 'Controller\AdminProductAttributeController@addProductAttribute');
		Route::post('/updateProductAttribute', 'Controller\AdminProductAttributeController@updateProductAttribute');
		Route::post('/deleteProductAttribute1', 'Controller\AdminProductAttributeController@deleteProductAttribute');

		//Product Option
		Route::get('/listingProductOption', 'Controller\AdminProductOptionController@listingProductOption');
		Route::get('/view_addProductOption', 'Controller\AdminProductOptionController@view_addProductOption');
		Route::get('/view_editProductOption/{product_option_id}/', 'Controller\AdminProductOptionController@view_editProductOption');
		Route::post('/addProductOption', 'Controller\AdminProductOptionController@addProductOption');
		Route::post('/updateProductOption', 'Controller\AdminProductOptionController@updateProductOption');
		Route::post('/deleteProductOption', 'Controller\AdminProductOptionController@deleteProductOption');

		//Product Option Value
		Route::get('/listingProductOptionValue', 'Controller\AdminProductOptionValueController@listingProductOptionValue');
		Route::get('/view_addProductOptionValue', 'Controller\AdminProductOptionValueController@view_addProductOptionValue');
		Route::get('/view_editProductOptionValue/{product_option_value_id}/', 'Controller\AdminProductOptionValueController@view_editProductOptionValue');
		Route::post('/addProductOptionValue', 'Controller\AdminProductOptionValueController@addProductOptionValue');
		Route::post('/updateProductOptionValue', 'Controller\AdminProductOptionValueController@updateProductOptionValue');
		Route::post('/deleteProductOptionValue', 'Controller\AdminProductOptionValueController@deleteProductOptionValue');

    });

    Route::get('/test', 'Controller\TestController@pdf');

});
