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


use App\Http\Controllers\App\Service\AppViewCustomerService;

class AppCustomerController extends Controller{
    private $AppViewCustomerService;
    
	public function __construct(){
		$this->AppViewCustomerService = new AppViewCustomerService();

	}
    
    function getCompanyInfo(Request $request){
        try{
            $result = array();
            $result['success'] = true;
            $result['customers'] = $this->AppViewCustomerService->test();
            return response()->json($result, 200);
        }catch(Exception $e){
            $result['success'] = false;
            $result['msg'] = $e->getMessage();
            return response()->json($result, 500);
        }
    }
}
