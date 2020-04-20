<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;
use JWTAuth;

use App\Http\Controllers\App\Service\AppUploadService;
use App\Http\Controllers\App\Service\AppLanguageService;
use App\Http\Controllers\App\Service\AppViewProductAttributeService;
use App\Http\Controllers\App\Service\AppOrderProductService;
use App\Http\Controllers\App\Service\AppOrderProductDescService;



class AppOrderService extends AppBaseApiService{
    private $AppLanguageService;
    private $AppUploadService;
    private $AppViewProductAttributeService;
    private $AppOrderProductService;
    private $AppOrderProductDescService;

    function __construct(){
        $this->setTable('orders');
        $this->companyAuth = true;
        $this->AppLanguageService = new AppLanguageService();
        $this->AppViewProductAttributeService = new AppViewProductAttributeService();
        $this->AppOrderProductService = new AppOrderProductService();
        $this->AppOrderProductDescService = new AppOrderProductDescService();

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
            $order_id = $add_order_result['response_id'];
            // To Add Order Product
            $product_parm = array();
            $product_parm = $param['order_products'];
            foreach ($product_parm as $index => $p) {
                //Add Order Id
                $p['order_id'] = $order_id;
                $product_parm[$index]['order_id'] = $order_id;
                $att_id = $p['product_attribute_id'];
                $add_order_product_result = $this->AppOrderProductService->add($p);
                if(empty($add_order_product_result['status']) || $add_order_product_result['status'] == 'fail')throw new Exception("Error To Add Order Product");
                $order_product_id = $add_order_product_result['response_id'];
                // Find Product Att Description
                $att_ps = $this->AppViewProductAttributeService->findByColumn_Value("product_attribute_id",$att_id);
                Log::info("att_ps : " . \json_encode($att_ps));
                // To Add Order Product Description
                foreach ($att_ps as $att_index => $att_desc) {
                    $desc_param = array();
                    $desc_param['order_id'] = $order_id;
                    $desc_param['order_product_id'] = $order_product_id;
                    $desc_param['language_id'] = $att_desc->language_id;
                    $desc_param['product_id'] = $att_desc->product_id;
                    $desc_param['product_attribute_id'] = $att_desc->product_attribute_id;
                    $desc_param['image'] = $att_desc->image;
                    $desc_param['product_name'] = $att_desc->product_name;
                    $desc_param['product_attribute_name'] = $att_desc->product_attribute_name;
                    $desc_param['product_description'] = $att_desc->product_description;
                    $add_order_product_desc_result = $this->AppOrderProductDescService->add($desc_param);
                    if(empty($add_order_product_desc_result['status']) || $add_order_product_desc_result['status'] == 'fail')throw new Exception("Error To Add Order Product Description");
                    Log::info("desc_param : " . \json_encode($desc_param));
                }
            }
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