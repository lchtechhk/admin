<?php
namespace App\Http\Controllers\Admin\Service;
use Log;
use DB;
use Lang;
use Exception;

use App\Http\Controllers\Admin\Service\LanguageService;
use App\Http\Controllers\Admin\Service\UploadService;


class OrderProductService extends BaseApiService{
    private $LanguageService;
    private $UploadService;

    function __construct(){
        $this->setTable('order_product');
        $this->LanguageService = new LanguageService();
        $this->UploadService = new UploadService();
    }

    function api($result){
        switch($result['operation']){
            case 'change_order_status':
                try{
                    $param = array();
                    $param['order_product_id'] = $result['order_product_id'];
                    $param['order_status'] = $result['order_status'];
                    DB::beginTransaction();
                    $update_order_status_result = $this->update("order_product_id",$param);
                    if(empty($update_order_status_result['status']) || $update_order_status_result['status'] == 'fail')throw new Exception("Error To Update Order Status");
                    $result = $this->response($result,"Successful","change_order_status");
                    DB::commit();
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }		
                Log::info('[change_order_status service] --  : '. \json_encode($result));
                return $result;
            break;
        }
    }
    function redirect_view($result,$title){
    }
}

?>