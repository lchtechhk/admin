<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;
use JWTAuth;

use App\Http\Controllers\App\Service\AppUploadService;
use App\Http\Controllers\App\Service\AppLanguageService;



class AppViewOrderService extends AppBaseApiService{
    private $AppLanguageService;
    private $AppUploadService;


    function __construct(){
        $this->setTable('view_order');
        $this->companyAuth = true;
        $this->AppLanguageService = new AppLanguageService();
    }

    function getAllOrderRecord(){
        $result = array('pending'=>[],'transport'=>[],'received'=>[]);
        $order_result = DB::table($this->getTable());
        $order_result = $order_result->where('company_id',JWTAuth::parseToken()->authenticate()->company_id);
        $order_result = $order_result->where('customer_id',JWTAuth::parseToken()->authenticate()->id);
        $order_result = $order_result->whereIn('order_status',['pending','transport','received']);
        $order_result = $order_result->get();
        
        $pending_qty = 0;
        $transport_qty = 0;
        $received_qty = 0;
        foreach ($order_result as $index => $order) {
            $order_status = $order->order_status;
            if($order_status == 'pending'){
                $result['pending'][] = $order;
                $pending_qty++;
            }else if($order_status == 'transport'){
                $result['transport'][] = $order;
                $transport_qty++;
            }else if($order_status == 'received'){
                $result['received'][] = $order;
                $received_qty++;
            }
        }
        $result['pending_qty'] = $pending_qty;
        $result['transport_qty'] = $transport_qty;
        $result['received_qty'] = $received_qty;
        Log::info('[getAllOrderRecord] : ' . json_encode($result));
        return $result;
    }

    function test(){
        return $this->findAll();
    }
}

?>