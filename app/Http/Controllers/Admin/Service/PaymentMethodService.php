<?php
namespace App\Http\Controllers\Admin\Service;
use Log;
use DB;
use Lang;
use Exception;
use Session;

use App\Http\Controllers\Admin\Service\UploadService;
use App\Http\Controllers\Admin\Service\LanguageService;


class PaymentMethodService extends BaseApiService{
    private $UploadService;
    private $LanguageService;


    function __construct(){
        $this->companyAuth = true;
        $this->UploadService = new UploadService();
        $this->LanguageService = new LanguageService();
        $this->setTable('payment_method');
    }

    function getPaymentMethodById($result,$payment_method_id){
        $payment_method_array = $this->findByColumn_Value("payment_method_id",$payment_method_id);
        $payment_method = !empty($payment_method_array) && sizeof($payment_method_array) > 0 ? $payment_method_array[0] : array();
         $result['payment_method'] = $payment_method;
         return $result;
    }
    function redirect_view($result,$title){
        $result['label'] = "PaymentMethod";
        $result['languages'] = $this->LanguageService->findAll();
       
        switch($result['operation']){
            case 'listing':
                $result['payment_methods'] = $this->findAll();
                Log::info('[listing] --  : ' . \json_encode($result));
                return view("admin.payment_method.listingPaymentMethod", $title)->with('result', $result);
            break;
            case 'view_add':
                return view("admin.payment_method.viewPaymentMethod", $title)->with('result', $result);
            break;
            case 'view_edit':
                $result = $this->getPaymentMethodById($result,$result['payment_method_id']);
                return view("admin.payment_method.viewPaymentMethod", $title)->with('result', $result);
            break;
            break;
            case 'add':
                try{
                    DB::beginTransaction();
                    if($image = $this->UploadService->upload_image($result['request'],'image','storage/company/'.Session::get('default_company_id').'/payment_method/images/'))$result['image'] = $image;
                    Log::info('[add result] --  : ' . json_encode($result));

                    $add_method_result = $this->add($result);
                    if(empty($add_method_result['status']) || $add_method_result['status'] == 'fail')throw new Exception("Error To Add Payment Method");
                    $result['payment_method_id'] = $add_method_result['response_id'];
                    $result = $this->response($result,"Successful","view_edit");
                    $result = $this->getPaymentMethodById($result,$result['payment_method_id']);
                    DB::commit();
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }

                return view("admin.payment_method.viewPaymentMethod", $title)->with('result', $result);       
            break;
            case 'edit':
                try{
                    DB::beginTransaction();
                    if($image = $this->UploadService->upload_image($result['request'],'image','storage/company/'.Session::get('default_company_id').'/payment_method/images/'))$result['image'] = $image;
                    Log::info('[edit result] --  : ' . json_encode($result));
                    // handle Company
                    $update_method_result = $this->update("payment_method_id",$result);
                    if(empty($update_method_result['status']) || $update_method_result['status'] == 'fail')throw new Exception("Error To Update Payment Method");
                    $result = $this->response($result,"Successful","view_edit");
                    $result = $this->getPaymentMethodById($result,$result['payment_method_id']);
                    DB::commit();
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }
                return view("admin.payment_method.viewPaymentMethod", $title)->with('result', $result);        
            break;
            case 'delete': 
                try{
                    $delete_company_result = $this->deleteByKey_Value("company_id",$result['company_id']);
                    if(empty($delete_company_result['status']) || $delete_company_result['status'] == 'fail')throw new Exception("Error To Delete Company");
                    $result['companies'] = $this->View_CompanyService->getListing();
                    $result = $this->response($result,"Success To Delete Company","view_edit");
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }
                return view("admin.payment_method.listingCompany", $title)->with('result', $result);
            break;
        }
    }
}

?>