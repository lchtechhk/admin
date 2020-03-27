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

class AppDistrictController extends Controller{
    private $AppViewOAppViewDistrictServicerderService;
    
	public function __construct(){
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

    function updateCustomerAddress(){
        
    }
}
