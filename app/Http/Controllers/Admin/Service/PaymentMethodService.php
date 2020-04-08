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
                $result = $this->getPaymentMethodById($result,$result['company_id']);
                Log::info('[view_edit] : ' .json_encode($result));

                return view("admin.payment_method.viewPaymentMethod", $title)->with('result', $result);
            break;
            break;
            case 'add':
                try{
                    DB::beginTransaction();
                    if($image = $this->UploadService->upload_image($result['request'],'image','storage/default_images/'))$result['image'] = $image;
                    if($icon = $this->UploadService->upload_image($result['request'],'icon','storage/default_images/'))$result['icon'] = $icon;
                    $add_method_result = $this->add($result);
                    if(empty($add_method_result['status']) || $add_method_result['status'] == 'fail')throw new Exception("Error To Add Payment Method");
                    $result['payment_method_id'] = $add_method_result['response_id'];
                    $result = $this->response($result,"Successful","view_edit");
                    $result = $this->getPaymentMethodById($result,$result['payment_method_id']);
                    DB::commit();
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }
                Log::info('[add result] --  : ' . json_encode($result));

                return view("admin.payment_method.viewPaymentMethod", $title)->with('result', $result);       
            break;
            case 'edit':
                try{
                    DB::beginTransaction();
                    if($image = $this->UploadService->upload_image($result['request'],'image','storage/company/'.Session::get('default_company_id').'/company/images/'))$result['image'] = $image;
                    if($icon = $this->UploadService->upload_image($result['request'],'icon','storage/company/'.Session::get('default_company_id').'/company/icons/'))$result['icon'] = $icon;
                    Log::info('[edit result] --  : ' . json_encode($result));
                    // handle Company
                    $update_company_result = $this->update("company_id",$result);
                    if(empty($update_company_result['status']) || $update_company_result['status'] == 'fail')throw new Exception("Error To update Company");
                    foreach ($result['language_array'] as $language_id => $obj) {
                        $name = !empty($obj['name']) ? $obj['name'] : '';
                        $description = !empty($obj['description']) ? $obj['description'] : '';
                        $param = array();
                        $param['name'] = $name;
                        $param['company_id'] = $result['company_id'];
                        $param['language_id'] = $language_id;
                        $isExisting = $this->CompanyDescriptionService->isExistingByMultipleKey_Value($param,array("company_id","language_id"),array($result['company_id'],$language_id));
                        if($isExisting){
                            $update_company_description_result = $this->CompanyDescriptionService->updateByMultipleKey_Value($param,array("company_id","language_id"),array($result['company_id'],$language_id));
                            if(empty($update_company_description_result['status']) || $update_company_description_result['status'] == 'fail')throw new Exception("Error To Update Company");
                        }else {
                            $add_company_description_result = $this->CompanyDescriptionService->add($param);
                            if(empty($add_company_description_result['status']) || $add_company_description_result['status'] == 'fail')throw new Exception("Error To Add Company Description");
                        }
                    }
                    // handle vtc
                    $delete_vtc_result = $this->UserToCompanyService->cleanByCompanyId($result['company_id']);
                    if(!empty($result['check_box_user']) && sizeof($result['check_box_user']) > 0){
                        foreach ($result['check_box_user'] as $index => $user_id) {
                            $vtc_param = array();
                            $vtc_param['user_id'] = $user_id;
                            $vtc_param['company_id'] = $result['company_id'];
                            $vtc_param['is_main_company'] = 'no';
                            $add_vtc_result = $this->UserToCompanyService->add($vtc_param);
                            if(empty($add_vtc_result['status']) || $add_vtc_result['status'] == 'fail')throw new Exception("Error To Add VTC");
                        }
                    }

                    $result = $this->response($result,"Successful","view_edit");
                    $result = $this->getPaymentMethodById($result,$result['company_id']);
                    DB::commit();
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }
                return view("admin.payment_method.viewCompany", $title)->with('result', $result);        
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