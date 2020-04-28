<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;
use JWTAuth;



class AppViewOrderProductService extends AppBaseApiService{



    function __construct(){
        $this->setTable('view_order_product');
        $this->companyAuth = true;
    }

    function getDetailByOrderId($order_id){
        try{
            if(empty($order_id))throw new Exception ("Not Found The Order Id");
            $result = array('pending'=>[],'transport'=>[],'received'=>[]);
            $order_product_result = DB::table($this->getTable());
            $order_product_result = $order_product_result->where('language_id',JWTAuth::parseToken()->authenticate()->default_language_id);
            $order_product_result = $order_product_result->where('company_id',JWTAuth::parseToken()->authenticate()->company_id);
            $order_product_result = $order_product_result->where('customer_id',JWTAuth::parseToken()->authenticate()->id);
            $order_product_result = $order_product_result->where('order_id',$order_id);
            $order_product_result = $order_product_result->whereIn('order_product_status',['pending','transport','received']);
            $order_product_result = $order_product_result->get();
    
            $pending_qty = 0;
            $transport_qty = 0;
            $received_qty = 0;
            foreach ($order_product_result as $index => $order_product) {
                $order_product_status = $order_product->order_product_status;
                if($order_product_status == 'pending'){
                    $result['pending'][] = $order_product;
                    $pending_qty++;
                }else if($order_product_status == 'transport'){
                    $result['transport'][] = $order_product;
                    $transport_qty++;
                }else if($order_product_status == 'received'){
                    $result['received'][] = $order_product;
                    $received_qty++;
                }
            }
            $result['pending_qty'] = $pending_qty;
            $result['transport_qty'] = $transport_qty;
            $result['received_qty'] = $received_qty;
            Log::info('[getDetailByOrderId] : ' . json_encode($result));
            return $result;
        }catch(Exception $e){
            throw new Exception ($e->getMessage());
        }
    }
    function getAllOrderProductRecord(){
        $result = array('pending'=>[],'transport'=>[],'received'=>[]);
        $order_product_result = DB::table($this->getTable());
        $order_product_result = $order_product_result->where('language_id',JWTAuth::parseToken()->authenticate()->default_language_id);
        $order_product_result = $order_product_result->where('company_id',JWTAuth::parseToken()->authenticate()->company_id);
        $order_product_result = $order_product_result->where('customer_id',JWTAuth::parseToken()->authenticate()->id);
        $order_product_result = $order_product_result->whereIn('order_product_status',['pending','transport','received']);
        $order_product_result = $order_product_result->get();

        $pending_qty = 0;
        $transport_qty = 0;
        $received_qty = 0;
        foreach ($order_product_result as $index => $order_product) {
            $order_product_status = $order_product->order_product_status;
            if($order_product_status == 'pending'){
                $result['pending'][] = $order_product;
                $pending_qty++;
            }else if($order_product_status == 'transport'){
                $result['transport'][] = $order_product;
                $transport_qty++;
            }else if($order_product_status == 'received'){
                $result['received'][] = $order_product;
                $received_qty++;
            }
        }
        $result['pending_qty'] = $pending_qty;
        $result['transport_qty'] = $transport_qty;
        $result['received_qty'] = $received_qty;
        Log::info('[getAllOrderProductRecord] : ' . json_encode($result));
        return $result;
    }
    function test(){
        return $this->findAll();
    }
}

?>