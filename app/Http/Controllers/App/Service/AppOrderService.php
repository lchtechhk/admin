<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;
use JWTAuth;

use App\Http\Controllers\App\Service\AppUploadService;
use App\Http\Controllers\App\Service\AppLanguageService;



class AppOrderService extends AppBaseApiService{
    private $AppLanguageService;
    private $AppUploadService;


    function __construct(){
        $this->setTable('orders');
        $this->companyAuth = true;
        $this->AppLanguageService = new AppLanguageService();
    }

    function addOrder($param){
        $result = array();
        try{
            // To Do Order
            $param['customer_id'] = JWTAuth::parseToken()->authenticate()->id;
            $param['company_id'] = JWTAuth::parseToken()->authenticate()->company_id;
            $param['status'] = "active";
            $param['order_status'] = "pending";
            $param['date_purchased'] = date("Y-m-d H:s:i");
            $add_order_result = $this->add($param);
            if(empty($add_order_result['status']) || $add_order_result['status'] == 'fail')throw new Exception("Error To Add Order");
            // To Do Order Product
            
            // To Do Order Product Desc

            // throw new Exception("Error To Add Order");
            $result = $this->response($result,"Successful","view_edit");
        }catch(Exception $e){
            $result = $this->throwException($result,$e->getMessage(),false);
        }
        return $result;   
    }

    function test(){
        return $this->findAll();
    }
}

?>