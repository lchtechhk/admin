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


use App\Http\Controllers\App\Service\AppOrderProductService;
use App\Http\Controllers\App\Service\AppViewOrderProductService;

class AppOrderProductController extends Controller{
    private $AppOrderProductService;
    private $AppViewOrderProductService;

	public function __construct(){
        $this->AppOrderProductService = new AppOrderProductService();
		$this->AppViewOrderProductService = new AppViewOrderProductService();

	}
    
    function getOrderDetail(Request $request){
        try{
            $order_id = $request->input('order_id');
            $orders = $this->AppViewOrderProductService->getDetailByOrderId($order_id);
            return response()->json(['status' => true, 'data'=> [ 'orders' => $orders]],200);
        }catch(Exception $e){
            $result['success'] = false;
            $result['msg'] = $e->getMessage();
            return response()->json($result, 500);
        }
    }


}
