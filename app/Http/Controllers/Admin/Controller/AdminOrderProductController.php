<?php
namespace App\Http\Controllers\Admin\Controller;
use App\Http\Controllers\Controller;

//validator is builtin class in laravel
use Validator;
use App;
use Lang;
use DB;
use Exception;

//for password encryption or hash protected
use Hash;
use App\Administrator;

//for authenitcate login data
use Log;
use Auth;

//for requesting a value 
use Illuminate\Http\Request;

use App\Http\Controllers\Admin\Service\OrderProductService;

class AdminOrderProductController extends Controller{
    private $OrderProductService;

	public function __construct(){
        $this->OrderProductService = new OrderProductService();
	}
    
    function change_order_status(Request $request){
        $result = array();
        $result = $request->input();
        $result['operation'] = 'change_order_status';
        Log::info('[result] --  : ' . json_encode($result));
        return $this->OrderProductService->api($result);
    }

}
