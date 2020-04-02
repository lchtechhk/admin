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


use App\Http\Controllers\App\Service\AppViewAddressBookService;
use App\Http\Controllers\App\Service\AppAddressBookService;

class AppAddressController extends Controller{
    private $AppViewAddressBookService;
    private $AppAddressBookService;

	public function __construct(){
		$this->AppViewAddressBookService = new AppViewAddressBookService();
		$this->AppAddressBookService = new AppAddressBookService();

    }

    function getFirstCustomerAddress(){
        try{
            DB::beginTransaction();
            $result = $this->AppAddressBookService->findFirstCustomerAddress();
            return response()->json(['status' => true, 'data'=> [ 'customer_address' => $result],'message' => 'Successful' ],200);
            DB::commit();
        }catch(Exception $e){
            return response()->json(['status' => false, 'data'=> '', 'message'=>$e->getMessage()]);
        }
    }
    
    function getAddressByToken(){
        try{
            DB::beginTransaction();
            $customer_address = $this->AppViewAddressBookService->findAddressByToken();
            return response()->json(['status' => true, 'data'=> [ 'customer_address' => $customer_address],'message' => 'Successful' ],200);
            DB::commit();
        }catch(Exception $e){
            return response()->json(['status' => false, 'data'=> '', 'message'=>$e->getMessage()]);
        }
    }

    function addCustomerAddress(Request $request){
        try{
            DB::beginTransaction();
            $param = array();
            $param = $request->input();
            $add_address_result = $this->AppAddressBookService->addCustomerAddress($param);
            if(empty($add_address_result['status']) || $add_address_result['status'] == 'fail')throw new Exception($add_address_result['message']);
            DB::commit();
            return response()->json(['status' => true, 'data'=> '','message' => 'Successful' ]);
        }catch(Exception $e){
            $this->AppAddressBookService->throwException(array(),$e->getMessage(),true);
            Log::info("[updateCustomerAddress] -- Error : " . $e->getMessage());
            return response()->json(['status' => false, 'data'=> '', 'message'=>$e->getMessage()]);
        }
        
        // Log::info("result : " . json_encode($update_address_result));

    }

    function updateCustomerAddress(Request $request){
        try{
            DB::beginTransaction();
            $param = array();
            $param = $request->input();
            $update_address_result = $this->AppAddressBookService->updateCustomerAddress($param);
            if(empty($update_address_result['status']) || $update_address_result['status'] == 'fail')throw new Exception($update_address_result['message']);
            DB::commit();
            return response()->json(['status' => true, 'data'=> '','message' => 'Successful' ]);
        }catch(Exception $e){
            $this->AppAddressBookService->throwException(array(),$e->getMessage(),true);
            Log::info("[updateCustomerAddress] -- Error : " . $e->getMessage());
            return response()->json(['status' => false, 'data'=> '', 'message'=>$e->getMessage()]);
        }
        
        // Log::info("result : " . json_encode($update_address_result));

    }

    function deleteCustomerAddress(Request $request){
        try{
            DB::beginTransaction();
            $param = array();
            $address_id = $request->input("address_id");
            $delete_address_result = $this->AppAddressBookService->deleteCustomerAddress($address_id);
            if(empty($delete_address_result['status']) || $delete_address_result['status'] == 'fail')throw new Exception($delete_address_result['message']);
            DB::commit();
            return response()->json(['status' => true, 'data'=> '','message' => 'Successful' ]);
        }catch(Exception $e){
            $this->AppAddressBookService->throwException(array(),$e->getMessage(),true);
            Log::info("[deleteCustomerAddress] -- Error : " . $e->getMessage());
            return response()->json(['status' => false, 'data'=> '', 'message'=>$e->getMessage()]);
        }
    }
}
