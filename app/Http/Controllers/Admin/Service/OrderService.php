<?php
namespace App\Http\Controllers\Admin\Service;
use Log;
use DB;
use Lang;
use Exception;

use App\Http\Controllers\Admin\Service\LanguageService;
use App\Http\Controllers\Admin\Service\UploadService;
use App\Http\Controllers\Admin\Service\View_ProductAttributeService;
use App\Http\Controllers\Admin\Service\OrderProductService;
use App\Http\Controllers\Admin\Service\OrderProductDescriptionService;
use App\Http\Controllers\Admin\Service\View_OrderProductService;
use App\Http\Controllers\Admin\Service\OrderCommentService;
use App\Http\Controllers\Admin\Service\CustomerService;
use App\Http\Controllers\Admin\Service\PaymentMethodService;



class OrderService extends BaseApiService{
    private $LanguageService;
    private $UploadService;
    private $View_OrderService;
    private $OrderProductService;
    private $OrderProductDescriptionService;
    private $View_OrderProductService;
    private $View_ProductAttributeService;
    private $OrderCommentService;
    private $PaymentMethodService;

    function __construct(){
        $this->setTable('cms.orders');
        $this->companyAuth = true;
        $this->LanguageService = new LanguageService();
        $this->UploadService = new UploadService();
        $this->View_OrderService = new View_OrderService();
        $this->OrderProductDescriptionService = new OrderProductDescriptionService();
        $this->OrderProductService = new OrderProductService();
        $this->View_OrderProductService = new View_OrderProductService();
        $this->OrderCommentService = new OrderCommentService();
        $this->View_ProductAttributeService = new View_ProductAttributeService();
        $this->CustomerService = new CustomerService();
        $this->PaymentMethodService = new PaymentMethodService();

    }

    function update_order_total_price($order_id){
        $order_array = $this->findByColumn_Value("order_id",$order_id);
        $order = !empty($order_array) && sizeof($order_array) > 0 ? $order_array[0] : array();

        $order_product_array = $this->View_OrderProductService->findByColumn_ValueWithLanguage("order_id",$order_id);

        $original_total_price = $order->order_price;
        $total_price = 0;
        foreach ($order_product_array as $p) {
            $final_price = $p->final_price;
            $total_price += $final_price;
        }
        Log::info('original_total_price : ' .$original_total_price);
        Log::info('total_price : ' .$total_price);

        if($original_total_price != $total_price ){
            $data = array();
            $data['order_id'] = $order_id;
            $data['order_price'] = $total_price;
            // Log::info('order_id : ' .$order_id);
            // Log::info('original_total_price : ' .$original_total_price);
            // Log::info('total_price : ' .$total_price);
            $update_order_result = $this->update("order_id",$data);
            if(empty($update_order_result['status']) || $update_order_result['status'] == 'fail')throw new Exception("Error To Update Order");
        }
    }
    function getOrder($order_id){
        $order_array = $this->findByColumn_Value("order_id",$order_id);
        $order = !empty($order_array) && sizeof($order_array) > 0 ? $order_array[0] : array();
        Log::info('[order] -- getListing : ' .json_encode($order));

        $order_product_array = $this->View_OrderProductService->findByColumn_ValueWithLanguage("order_id",$order_id);
        $order_comment_array = $this->OrderCommentService->findByColumn_Value("order_id",$order_id);
        $order->order_products = $order_product_array;
        $order->order_comments = $order_comment_array;
        return $order;
    }

    
    function addOrderProduct($result){
        $product = array();
        try{
            $ps = $this->View_ProductAttributeService->getProductByAttributeId($result['product_attribute_id']);
            // Log::error('[ps] : ' . json_encode($ps));

            $product['order_id'] = $result['order_id'];
            $product['product_price'] = $result['product_price'];
            $product['product_quantity'] = $result['product_quantity'];
            $product['final_price'] = $result['final_price'];
            $product['product_attribute_id'] = $result['product_attribute_id'];
            $product['customer_remark'] = $result['customer_remark'];
            $product['order_product_status'] = $result['order_product_status'];

            $inset_order_product_result = $this->OrderProductService->add($product);
            if(empty($inset_order_product_result['status']) || $inset_order_product_result['status'] == 'fail')throw new Exception("Error To Inset Order Product");

            foreach ($ps->language_array as $language_id => $p) {
                $product_description = array();
                $product_description['order_product_id'] = $inset_order_product_result['response_id'];
                $product_description['order_id'] = $result['order_id'];
                $product_description['product_id'] = $ps->product_id;
                $product_description['product_attribute_id'] = $ps->product_attribute_id;
                $product_description['language_id'] = $language_id; 
                $product_description['product_name'] = $p["product_name"];
                $product_description['product_attribute_name'] = $p["product_attribute_name"];
                $product_description['product_description'] = $p["product_description"];
                $inset_order_product_desc_result = $this->OrderProductDescriptionService->add($product_description);
                if(empty($inset_order_product_desc_result['status']) || $inset_order_product_desc_result['status'] == 'fail')throw new Exception("Error To Inset Order Product Description");
            }
            return true;
        }catch(Exception $e){
            throw new Exception($e->getMessage());
        }
        return false;
    }
    function redirect_view($result,$title){
        $result['languages'] = $this->LanguageService->findAll();
        $result['label'] = "Order";
        $result['product_attributes'] = $this->View_ProductAttributeService->getAllProduct();
        $result['customers'] = $this->CustomerService->findAll();
        $result['payment_methods'] = $this->PaymentMethodService->findAll();
        switch($result['operation']){
            case 'listing':
                $result['orders'] = $this->View_OrderService->getListing();
                Log::info('[listing] --  : ' . \json_encode($result));
                return view("admin.order.listingOrder", $title)->with('result', $result);
            break;
            case 'view_add':
                $result['order'] =  array();
                Log::info('[view_add] --  : ' . json_encode($result['order']));
                return view("admin.order.addOrder", $title)->with('result', $result);
            break;
            case 'view_edit':
                $result['order'] = $this->getOrder($result['order_id']);
                Log::info('[view_edit] --  : ' . \json_encode($result['order']));
                return view("admin.order.viewOrder", $title)->with('result', $result);
            break;
            case 'add':
                try{
                    DB::beginTransaction();
                    Log::info('[add] --  : ');
                    DB::commit();
                    return view("admin.order.viewOrder", $title)->with('result', $result);
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                    return view("admin.order.viewOrder", $title)->with('result', $result);
                }
            break;
            case 'edit':
                try{
                    DB::beginTransaction();
                    $update_order_result = $this->update("order_id",$result);
                    if(empty($update_order_result['status']) || $update_order_result['status'] == 'fail')throw new Exception("Error To Update Order");
                    $result = $this->response($result,"Successful","view_edit");
                    DB::commit();
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }		
                Log::info('[edit] --  : ' . \json_encode($result));
                $result['order'] = $this->getOrder($result['order_id']);
                return view("admin.order.viewOrder", $title)->with('result', $result);
            break;
            case 'add_product':
                try{
                    DB::beginTransaction();
                    $this->addOrderProduct($result);
                    $this->update_order_total_price($result['order_id']);
                    $result = $this->response($result,"Successful","view_edit");
                    DB::commit();
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }		
                $result['order'] = $this->getOrder($result['order_id']);
                return view("admin.order.viewOrder", $title)->with('result', $result);
            break;
            case 'edit_product':
                try{
                    Log::info('[edit_product] --  : '. \json_encode($result));

                    DB::beginTransaction();
                    $item = array();
                    $item['order_product_id'] = $result['order_product_id'];
                    $item['final_price'] = $result['final_price'];
                    $item['product_quantity'] = $result['product_quantity'];
                    $item['customer_remark'] = $result['customer_remark'];
                    $update_order_product_result = $this->OrderProductService->update("order_product_id",$item);
                    if(empty($update_order_product_result['status']) || $update_order_product_result['status'] == 'fail')throw new Exception("Error To Update Order Product");
                    $update_order_result = $this->update_order_total_price($result['order_id']);

                    $result = $this->response($result,"Successful","view_edit");
                    DB::commit();
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }		
                $result['order'] = $this->getOrder($result['order_id']);
                return view("admin.order.viewOrder", $title)->with('result', $result);
            break;
            case 'delete_product':
                Log::info('[delete_product] --  : '. \json_encode($result));
                try{
                    DB::beginTransaction();
                    $delete_product_result = $this->OrderProductService->deleteByKey_Value("order_product_id",$result['order_product_id']);
                    if(empty($delete_product_result['status']) || $delete_product_result['status'] == 'fail')throw new Exception("Error To Delete Order Product");
                    $delete_product_result = $this->OrderProductDescriptionService->deleteByKey_Value("order_product_id",$result['order_product_id']);
                    if(empty($delete_product_result['status']) || $delete_product_result['status'] == 'fail')throw new Exception("Error To Delete Order Product");
                    $update_order_result = $this->update_order_total_price($result['order_id']);

                    $result = $this->response($result,"Successful","view_edit");
                    DB::commit();
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }		
                $result['order'] = $this->getOrder($result['order_id']);
                return view("admin.order.viewOrder", $title)->with('result', $result);
            break;
            case 'delete': 
                try{
                    Log::info('[delete] --  : ');
                    $delete_order_result = $this->deleteByKey_Value("order_id",$result['order_id']);
                    if(empty($delete_order_result['status']) || $delete_order_result['status'] == 'fail')throw new Exception("Error To Delete Order");
                    $result = $this->response($result,"Success To Delete Order","listing");
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }	
                $result['orders'] = $this->findAll();
                return view("admin.order.listingOrder", $title)->with('result', $result);
            break;
            // case 'part_customer_address':
            //     $result['order'] = $this->getOrder($result['order_id']);
            //     Log::info('[part_customer_address] --  : ' . \json_encode($result));
            //     return view("admin.order.dialog_customer_address")->with('result', $result);
            // break;
            case 'part_edit_product':
                Log::info('[part_edit_product] --  : ' . json_encode($result));
                return view("admin.order.edit.dialog_edit_product")->with('result', $result);
            break;  
        }
    }
}

?>