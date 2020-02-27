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


use App\Http\Controllers\App\Service\AppViewCompanyService;

class AppCategoryController extends Controller{
    private $AppViewCompanyService;
    
	public function __construct(){
		$this->AppViewCompanyService = new AppViewCompanyService();

	}
    
    function getCompanyInfo(Request $request){
        try{
            $result = array();
            $result['success'] = true;
            $result['categories'] = $this->AppViewCompanyService->test();
            return response()->json($result, 200);
        }catch(Exception $e){
            $result['success'] = false;
            $result['msg'] = $e->getMessage();
            return response()->json($result, 500);
        }
    }
}
