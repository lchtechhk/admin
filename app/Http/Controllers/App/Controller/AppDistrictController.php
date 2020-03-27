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


use App\Http\Controllers\App\Service\AppViewDistrictService;
use App\Http\Controllers\App\Service\AppAddressBookService;

class AppDistrictController extends Controller{
    private $AppAddressBookService;
    private $AppViewDistrictService;

	public function __construct(){
		$this->AppAddressBookService = new AppAddressBookService();
		$this->AppViewDistrictService = new AppViewDistrictService();

	}
    
    function listingDistrict(){
        try{
            $districts = $this->AppViewDistrictService->getAllDistrict();
            Log::info("districts : " . json_encode($districts));
            return response()->json(['status' => true, 'data'=> [ 'districts' => $districts]],200);
        }catch(Exception $e){
            return response()->json(['status' => false, 'data'=> '', 'message'=>$e->getMessage()]);
        }
    }

    function updateCustomerAddress(Request $request){
        $param = array();
        $param = $request->input();
        $update_address_result = $this->AppAddressBookService->updateCustomerAddress($param);
        Log::info("result : " . json_encode($update_address_result));

    }
}
