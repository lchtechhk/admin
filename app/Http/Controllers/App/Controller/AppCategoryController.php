<?php
namespace App\Http\Controllers\App\Controller;
use App\Http\Controllers\Controller;

use Validator;
use App;
use Lang;
use DB;
use Hash;
use Log;
use Auth;

//for requesting a value 
use Illuminate\Http\Request;


use App\Http\Controllers\App\Service\AppViewSubCategoryService;

class AppCategoryController extends Controller{
    private $AppViewSubCategoryService;
    
	public function __construct(){
		$this->AppViewSubCategoryService = new AppViewSubCategoryService();

	}
    
    function listingCategory(Request $request){
        Log::info("listingCategory");
        try{
            $result = array();
            $result['success'] = true;
            $result['categories'] = $this->AppViewSubCategoryService->listingCategory();
            return response()->json($result, 200);
        }catch(Exception $e){
            $result['success'] = false;
            $result['msg'] = $e->getMessage();
            return response()->json($result, 500);
        }
    }
}
