<?php
namespace App\Http\Controllers\Admin\Service;
use Log;
use DB;
use Lang;
use Exception;
use Session;

use App\Http\Controllers\Admin\Service\UploadService;
use App\Http\Controllers\Admin\Service\LanguageService;
use App\Http\Controllers\Admin\Service\View_CompanyService;
use App\Http\Controllers\Admin\Service\CompanyDescriptionService;
use App\Http\Controllers\Admin\Service\UserService;
use App\Http\Controllers\Admin\Service\UserToCompanyService;

class CompanyService extends BaseApiService{
    private $UploadService;
    private $LanguageService;
    private $View_CompanyService;
    private $CompanyDescriptionService;
    private $UserService;
    private $UserToCompanyService;

    function __construct(){
        $this->setTable('company');
        $this->LanguageService = new LanguageService();
        $this->UploadService = new UploadService();
        $this->View_CompanyService = new View_CompanyService();
        $this->CompanyDescriptionService = new CompanyDescriptionService();
        $this->UserService = new UserService();
        $this->UserToCompanyService = new UserToCompanyService();
    }

    function checkDuplicateOwnEmail($email,$id){
        $result = DB::table($this->getTable())
        ->where('email','=',$email)
        ->where('company_id','=',$id)
        ->count();
        Log::info('[CompanyService] -- checkDuplicateOwnEmail : ] '. $result);
        return $result;
    }

    function getCompanyById($result,$company_id){
        $companies = $this->View_CompanyService->findByColumn_Value("company_id",$company_id);
        $result['company'] = !empty($companies) && sizeof($companies) > 0 ? $companies[0] : array();
        $result['company']->language_array = array();
        foreach ($companies as $obj) {
            $language_id = $obj->language_id;
            $name = $obj->name;
            
            $result['company']->language_array[$language_id] = array();
            $result['company']->language_array[$language_id]['name'] = $name;
        }
        $users = $this->UserService->getUserBelongOwn();
        $result['company']->users = $this->array_to_json($users,"user_id");
        // Log::info('[company] : ' .json_encode($result));
        return $result;
    }


    function redirect_view($result,$title){
        $result['label'] = "Company";
        $result['languages'] = $this->LanguageService->findAll();
        $result['users'] = $this->UserService->findByColumn_Value("party_id",Session::get('party_id'));
        $result['user_id'] = Session::get('user_id');
        if(!empty($result['company_id'])){
            $a = $this->UserToCompanyService->getMainUserIdByCompany($result['company_id']);
            $a_array = array();
            foreach ($a as $index => $user) {
                $user_id = $user->user_id;
                $a_array[$user_id] = $a;
            }
            $result['disable_user_ids'] = $a_array;
        }
        switch($result['operation']){
            case 'listingStaff':
                $result['label'] = "Staff";
                $id_list = $this->UserToCompanyService->getUserIdsByCompany();
                $result['staffs'] = $this->UserService->findByColumn_Values('user_id',$id_list);
                Log::info('[listing] --  : ' . \json_encode($result['staffs']));
                return view("admin.staff.listingStaff", $title)->with('result', $result);
            break;
            case 'listing':
                Log::info('[listing] --  : ' . \json_encode($result));
                $result['companies'] = $this->View_CompanyService->findByColumn_Value('company_id',Session::get('default_company_id'));
                return view("admin.company.listingCompany", $title)->with('result', $result);
            break;
            case 'view_add':
                return view("admin.company.viewCompany", $title)->with('result', $result);
            break;
            case 'view_edit':
                $result = $this->getCompanyById($result,$result['company_id']);
                Log::info('[view_edit] : ' .json_encode($result));

                return view("admin.company.viewCompany", $title)->with('result', $result);
            break;
            break;
            case 'add':
                try{
                    DB::beginTransaction();
                    if($image = $this->UploadService->upload_image($result['request'],'image','storage/company/'.Session::get('default_company_id').'/company/images/'))$result['image'] = $image;
                    if($icon = $this->UploadService->upload_image($result['request'],'icon','storage/company/'.Session::get('default_company_id').'/company/icons/'))$result['icon'] = $icon;
                    Log::info('[add result] --  : ' . json_encode($result));
                    $add_company_result = $this->add($result);
                    if(empty($add_company_result['status']) || $add_company_result['status'] == 'fail')throw new Exception("Error To Add Company");
                    $result['company_id'] = $add_company_result['response_id'];
                    foreach ($result['language_array'] as $language_id => $name) {
                        $param = array();
                        $param['language_id'] = $language_id;
                        $param['name'] = $name;
                        $param['company_id'] = $result['company_id'];
                        $add_company_description_result = $this->CompanyDescriptionService->add($param);
                        if(empty($add_company_description_result['status']) || $add_company_description_result['status'] == 'fail')throw new Exception("Error To Add Company Description");
                    }
                    // Handle User To Company
                    $user_to_company_param = array();
                    $user_to_company_param['user_id'] = auth()->guard('admin')->user()->user_id;
                    $user_to_company_param['company_id'] = $result['company_id'];
                    $user_to_company_param['admin_type'] = 'boss';
                    $add_user_to_company = $this->UserToCompanyService->register_add($user_to_company_param);
                    if(empty($add_user_to_company['status']) || $add_user_to_company['status'] == 'fail')throw new Exception("Error To Add User To Company");

                    $result = $this->response($result,"Successful","view_edit");
                    DB::commit();
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }
                $result = $this->getCompanyById($result,$result['company_id']);
                return view("admin.company.viewCompany", $title)->with('result', $result);       
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
                    foreach ($result['language_array'] as $language_id => $name) {
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
                    $result = $this->getCompanyById($result,$result['company_id']);
                    DB::commit();
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }
                return view("admin.company.viewCompany", $title)->with('result', $result);        
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
                return view("admin.company.listingCompany", $title)->with('result', $result);
            break;
        }
    }
}

?>