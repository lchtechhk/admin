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
use Exception;
//for requesting a value 
use Illuminate\Http\Request;


use App\Http\Controllers\App\Service\AppViewSubCategoryService;

class AppCategoryController extends Controller{
    private $AppViewSubCategoryService;
    
	public function __construct(){
		$this->AppViewSubCategoryService = new AppViewSubCategoryService();

	}
    
    function listingCategory(Request $request){
        if(!empty($sub_category_id))$search_param['sub_category_id'] = $sub_category_id;
        try{
            $categories = $this->AppViewSubCategoryService->listingCategory();
            return response()->json(['status' => true, 'data'=> [ 'categories' => $categories, 'max-item' =>4]],200);
        }catch(Exception $e){
            return response()->json(['status' => false, 'data'=> '', 'message'=>$e->getMessage()]);
        }
    }
}
