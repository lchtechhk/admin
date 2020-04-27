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


use App\Http\Controllers\App\Service\AppOrderService;
use App\Http\Controllers\App\Service\AppViewOrderService;
use App\Http\Controllers\App\Service\AppViewOrderProductService;

class AppOrderController extends Controller{
    private $AppOrderService;
    private $AppViewOrderService;
    private $AppViewOrderProductService;

	public function __construct(){
        $this->AppOrderService = new AppOrderService();
		$this->AppViewOrderService = new AppViewOrderService();
		$this->AppViewOrderProductService = new AppViewOrderProductService();

	}
    
    function getAllOrderRecord(Request $request){
        try{
            $orders = $this->AppViewOrderProductService->getAllOrderProductRecord();
            return response()->json(['status' => true, 'data'=> [ 'orders' => $orders]],200);
        }catch(Exception $e){
            $result['success'] = false;
            $result['msg'] = $e->getMessage();
            return response()->json($result, 500);
        }
    }

    function addOrder(Request $request){
        try{
            DB::beginTransaction();
            $param = array();
            $param = $request->input();
            $add_order_result = $this->AppOrderService->addOrder($param);
            if(empty($add_order_result['status']) || $add_order_result['status'] == 'fail')throw new Exception($add_order_result['message']);
            DB::commit();
            return response()->json(['status' => true, 'data'=> '','message' => 'Successful' ]);
        }catch(Exception $e){
            $this->AppOrderService->throwException(array(),$e->getMessage(),true);
            Log::info("[addOrder] -- Error : " . $e->getMessage());
            return response()->json(['status' => false, 'data'=> '', 'message'=>$e->getMessage()]);
        }
        
        // Log::info("result : " . json_encode($update_address_result));

    }

}
