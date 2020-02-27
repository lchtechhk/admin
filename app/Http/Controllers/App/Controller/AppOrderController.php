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


use App\Http\Controllers\App\Service\AppOrderService;
use App\Http\Controllers\App\Service\AppViewOrderService;

class AppOrderController extends Controller{
    private $AppOrderService;
    private $AppViewOrderService;
    
	public function __construct(){
        $this->AppOrderService = new AppOrderService();
		$this->AppViewOrderService = new AppViewOrderService();

	}
    
    function listingOrder(Request $request){
        try{
            $result = array();
            $result['success'] = true;
            $result['orders'] = $this->AppViewOrderService->test();
            return response()->json($result, 200);
        }catch(Exception $e){
            $result['success'] = false;
            $result['msg'] = $e->getMessage();
            return response()->json($result, 500);
        }
    }
}
