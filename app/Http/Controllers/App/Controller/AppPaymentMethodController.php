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


use App\Http\Controllers\App\Service\AppPaymentMethodService;

class AppPaymentMethodController extends Controller{
    private $AppPaymentMethodService;

	public function __construct(){
		$this->AppPaymentMethodService = new AppPaymentMethodService();

    }

    function getAllPaymentMethod(){
        try{
            DB::beginTransaction();
            $result = $this->AppPaymentMethodService->getAllPaymentMethod();
            return response()->json(['status' => true, 'data'=> [ 'payment_methods' => $result],'message' => 'Successful' ],200);
            DB::commit();
        }catch(Exception $e){
            return response()->json(['status' => false, 'data'=> '', 'message'=>$e->getMessage()]);
        }
    }
}
