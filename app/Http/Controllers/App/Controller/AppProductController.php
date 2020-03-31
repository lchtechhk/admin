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
use App\Http\Controllers\App\Service\AppViewProductAttributeService;

class AppProductController extends Controller{
    private $AppProductService;
    private $AppViewProductService;
    private $AppViewProductAttributeService;

	public function __construct(){
		$this->AppProductService = new AppProductService();
		$this->AppViewProductService = new AppViewProductService();
		$this->AppViewProductAttributeService = new AppViewProductAttributeService();

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

    function getProductDetails(Request $request){
        try{
            $product_id = $request->input('product_id');
            $search = array();
            if(!empty($product_id) && $product_id > 0)$search['product_id'] = $product_id;
            $search['status'] = 'active';

            $product = $this->AppViewProductService->findByProductId($search);
            Log::info("product : " . json_encode($product));
            return response()->json(['status' => true, 'data'=> [ 'product' => $product]],200);
        }catch(Exception $e){
            return response()->json(['status' => false, 'data'=> '', 'message'=>$e->getMessage()]);
        }
    }

    function getProductByAttIds(Request $request){
        try{
            $attu_ids = $request->input('attu_ids');
            $search = array();
            if(!empty($attu_ids) && $attu_ids > 0)$search['product_attribute_id'] = $attu_ids;
            $search['status'] = 'active';
            $products = $this->AppViewProductAttributeService->findByAttIds($search);
            Log::info("products : " . json_encode($products));
            return response()->json(['status' => true, 'data'=> [ 'products' => $products]],200);
        }catch(Exception $e){
            return response()->json(['status' => false, 'data'=> '', 'message'=>$e->getMessage()]);
        }
    }
}
