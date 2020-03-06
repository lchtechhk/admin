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


use App\Http\Controllers\App\Service\AppProductService;
use App\Http\Controllers\App\Service\AppViewProductService;

class AppProductController extends Controller{
    private $AppProductService;
    private $AppViewProductService;

	public function __construct(){
		$this->AppProductService = new AppProductService();
		$this->AppViewProductService = new AppViewProductService();

	}
    

    function listingProduct(Request $request){
        try{
            $sub_category_id = $request->input('sub_category_id');
            $search = array();
            if(!empty($sub_category_id) && $sub_category_id > 0)$search['sub_category_id'] = $sub_category_id;
            $search['status'] = 'active';

            $products = $this->AppViewProductService->search($search);
            Log::info("products : " . json_encode($products));
            return response()->json(['status' => true, 'data'=> [ 'products' => $products]],200);
        }catch(Exception $e){
            return response()->json(['status' => false, 'data'=> '', 'message'=>$e->getMessage()]);
        }

    }
}
