<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;
use JWTAuth;



class AppViewOrderService extends AppBaseApiService{


    function __construct(){
        $this->setTable('view_order');
        $this->companyAuth = true;
    }

    function getAllOrderRecord(){
        $result = array('pending'=>[],'complete'=>[],'cancel'=>[]);
        $order_result = DB::table($this->getTable());
        $order_result = $order_result->where('company_id',JWTAuth::parseToken()->authenticate()->company_id);
        $order_result = $order_result->where('customer_id',JWTAuth::parseToken()->authenticate()->id);
        $order_result = $order_result->whereIn('order_status',['pending','complete','cancel']);
        $order_result = $order_result->get();
        
        $pending_qty = 0;
        $complete_qty = 0;
        $cancel_qty = 0;
        foreach ($order_result as $index => $order) {
            $order_status = $order->order_status;
            if($order_status == 'pending'){
                $result['pending'][] = $order;
                $pending_qty++;
            }else if($order_status == 'complete'){
                $result['complete'][] = $order;
                $complete_qty++;
            }else if($order_status == 'cancel'){
                $result['cancel'][] = $order;
                $cancel_qty++;
            }
        }
        $result['pending_qty'] = $pending_qty;
        $result['complete_qty'] = $complete_qty;
        $result['cancel_qty'] = $cancel_qty;
        Log::info('[getAllOrderRecord] : ' . json_encode($result));
        return $result;
    }

    function test(){
        return $this->findAll();
    }
}

?>