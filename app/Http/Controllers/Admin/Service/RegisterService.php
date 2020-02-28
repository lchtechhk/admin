<?php
namespace App\Http\Controllers\Admin\Service;
use Log;
use DB;
use Lang;
use Exception;
use Session;

use App\Http\Controllers\Admin\Service\UploadService;
use App\Http\Controllers\Admin\Service\LanguageService;
use App\Http\Controllers\Admin\Service\UserService;
use App\Http\Controllers\Admin\Service\CompanyService;
use App\Http\Controllers\Admin\Service\CompanyDescriptionService;
use App\Http\Controllers\Admin\Service\UserToCompanyService;
use App\Http\Controllers\Admin\Service\View_ManufacturerService;
use App\Http\Controllers\Admin\Service\PermissionService;
use Illuminate\Http\Request;
use App\Http\Controllers\Admin\Controller\AdminController;
use Hash;


class RegisterService extends BaseApiService{
    private $UploadService;
    private $LanguageService;
    private $UserService;
    private $CompanyService;
    private $CompanyDescriptionService;
    private $UserToCompanyService;
    private $View_ManufacturerService;
    private $PermissionService;
    private $AdminController;

    function __construct(){
        $this->setTable('');
        $this->UploadService = new UploadService();
        $this->LanguageService = new LanguageService();
        $this->CompanyService = new CompanyService();
        $this->UserService = new UserService();
        $this->CompanyDescriptionService = new CompanyDescriptionService();
        $this->UserToCompanyService = new UserToCompanyService();
        $this->View_ManufacturerService = new View_ManufacturerService();
        $this->PermissionService = new PermissionService();
        $this->AdminController = new AdminController();

    }

    function redirect_view($result,$title){
        $result['label'] = "RegisterUser";
        $result['languages'] = $this->LanguageService->setUp();
        switch($result['operation']){
            case 'view_registerCompany':
                return view("admin.register.view_registerCompany", $title)->with('result', $result);
            break;
            case 'view_registerUser':
                $result['permissions'] = $this->PermissionService->findByColumn_Value("is_public",1);
                return view("admin.register.view_registerUser", $title)->with('result', $result);
            break;
            case 'add_registerCompany':
                try{
                    DB::beginTransaction();
                    if($image = $this->UploadService->upload_image($result['request'],'image','storage/company/'.Session::get('default_company_id').'/company/images/'))$result['image'] = $image;
                    if($icon = $this->UploadService->upload_image($result['request'],'icon','storage/company/'.Session::get('default_company_id').'/company/icons/'))$result['icon'] = $icon;
                    Log::info('[add_registerCompany] --  : ' . json_encode($result));
                    $result['is_main_company'] = 'yes';
                    $add_company_result = $this->CompanyService->register_add($result);
                    if(empty($add_company_result['status']) || $add_company_result['status'] == 'fail')throw new Exception("Error To Add Company");
                    $result['company_id'] = $add_company_result['response_id'];
                    foreach ($result['language_array'] as $language_id => $obj) {
                        $name = !empty($obj['name']) ? $obj['name'] : '';
                        $description = !empty($obj['description']) ? $obj['description'] : '';
                        $param = array();
                        $param['language_id'] = $language_id;
                        $param['name'] = $name;
                        $param['company_id'] = $result['company_id'];
                        $add_company_description_result = $this->CompanyDescriptionService->register_add($param);
                        if(empty($add_company_description_result['status']) || $add_company_description_result['status'] == 'fail')throw new Exception("Error To Add Company Description");
                    }
                    $user_to_company_param = array();
                    $user_to_company_param['user_id'] = auth()->guard('admin')->user()->user_id;
                    $user_to_company_param['company_id'] = $add_company_result['response_id'];
                    $user_to_company_param['is_main_company'] = "yes";
                    $add_user_to_company = $this->UserToCompanyService->register_add($user_to_company_param);
                    if(empty($add_user_to_company['status']) || $add_user_to_company['status'] == 'fail')throw new Exception("Error To Add User To Company");
                    $result = $this->response($result,"Successful","view_edit");
                    DB::commit();
                    return redirect('/admin/dashboard/this_month');
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }
                return view("admin.register.view_registerCompany", $title)->with('result', $result);      
            break;
            case 'add_registerUser':
                $res = $this->separate($result);
                $user_param = $res['user_param'];
                $company_param = $res['company_param'];
                try{
                    DB::beginTransaction();

                    // Handle Company
                    if($image = $this->UploadService->upload_image($result['request'],'company_image','storage/company/'.Session::get('default_company_id').'/company/images/'))$company_param['image'] = $image;
                    $company_param['is_main_company'] = 'yes';
                    $add_company_result = $this->CompanyService->register_add($company_param);
                    if(empty($add_company_result['status']) || $add_company_result['status'] == 'fail')throw new Exception("Error To Add Company");
                    $result['company_id'] = $add_company_result['response_id'];
                    // Handle Compant Party Id
                    $party_param = array();
                    $party_param['company_id'] = $result['company_id'];
                    $party_param['party_id'] = $result['company_id'].".TL";
                    $update_partyId_result = $this->CompanyService->update("company_id",$party_param);
                    if(empty($update_partyId_result['status']) || $update_partyId_result['status'] == 'fail')throw new Exception("Error To Update PartyId");

                    // Handle Language
                    $lan_param = array();
                    $lan_param['company_id'] = $result['company_id'];
                    $lan_param['name'] = $result['languages'][0]->name;
                    $lan_param['code'] = $result['languages'][0]->code;
                    $lan_param['image'] = $result['languages'][0]->image;
                    $lan_param['directory'] = $result['languages'][0]->directory;
                    $lan_param['is_default'] = $result['languages'][0]->is_default;
                    $add_language_result = $this->LanguageService->register_add($lan_param);
                    if(empty($add_language_result['status']) || $add_language_result['status'] == 'fail')throw new Exception("Error To Add Language");
                    $language_id = $add_language_result['response_id'];
                    
                // Handle User
                    $user_param['identity'] = 'boss';
                    $user_param['default_company_id'] = $result['company_id'];
                    $user_param['default_language_id'] = $language_id;
                    $user_param['party_id'] = $party_param['party_id'];
                    $user_param['password'] = Hash::make($user_param['password_str']);
                    $email = $user_param['email'];
                    $own_email_count = $this->UserService->getCountForEmailExisting($email);
                    if($own_email_count > 0 ){
                        throw new Exception("Update Error, The Email Is Duplicate In DB");
                    }        
                    if($image = $this->UploadService->upload_image($result['request'],'user_image','storage/company/'.Session::get('default_company_id').'/customer/images/'))$user_param['image'] = $image;
                    $add_user_result = $this->UserService->register_add($user_param);
                    $result['user_id'] = $add_user_result['response_id'];
                    if(empty($add_user_result['status']) || $add_user_result['status'] == 'fail')throw new Exception("Error To Add User");

            
                    // Handle Company Description
                    foreach ($company_param['language_array'] as $language_id => $obj) {
                        $name = !empty($obj['name']) ? $obj['name'] : '';
                        $description = !empty($obj['description']) ? $obj['description'] : '';
                        $param = array();
                        $param['language_id'] = $language_id;
                        $param['name'] = $name;
                        $param['company_id'] = $result['company_id'];
                        Log::info('[param] --  : ' . json_encode($param));

                        $add_company_description_result = $this->CompanyDescriptionService->register_add($param);
                        if(empty($add_company_description_result['status']) || $add_company_description_result['status'] == 'fail')throw new Exception("Error To Add Company Description");
                    }

                    // Handle User To Company
                    $user_to_company_param = array();
                    $user_to_company_param['user_id'] = $result['user_id'];
                    $user_to_company_param['company_id'] = $result['company_id'];
                    $user_to_company_param['is_main_company'] = "yes";
                    $add_user_to_company = $this->UserToCompanyService->register_add($user_to_company_param);
                    if(empty($add_user_to_company['status']) || $add_user_to_company['status'] == 'fail')throw new Exception("Error To Add User To Company");

                    $user = $this->UserService->findByColumn_Value("user_id",$add_user_result['response_id']);
                    $result['user'] = !empty($user) && \sizeof($user)>0? $user[0] : array();
                    $result = $this->response($result,"Success To Add User","view_edit");
                    DB::commit();
                    return $this->AdminController->forward_login($user_param['email'],$user_param['password_str']);
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }
                return view("admin.register.view_registerUser", $title)->with('result', $result);      
            break;
        }
    }

    function separate($result){
        $user_param = array();
        $company_param = array();
        $user_param['first_name'] = $result['first_name'];
        $user_param['last_name'] = $result['last_name'];
        $user_param['gender'] = $result['gender'];
        $user_param['dob'] = $result['dob'];
        $user_param['phone'] = $result['phone'];
        $user_param['email'] = $result['email'];
        $user_param['password_str'] = $result['password_str'];
        $user_param['status'] = $result['status'];

        $company_param['language_array'] = $result['language_array'];
        $company_param['email'] = $result['company_email'];
        $company_param['phone'] = $result['company_phone'];

        $res = array("user_param"=>$user_param,"company_param"=>$company_param);
        return $res;
    }
}

?>