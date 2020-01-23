<?php
namespace App\Http\Controllers\Admin\Service;
use Log;
use DB;
use Lang;
use Exception;
use Session;
use Hash;

use App\Http\Controllers\Admin\Service\UploadService;
use App\Http\Controllers\Admin\Service\LanguageService;
use App\Http\Controllers\Admin\Service\PermissionService;
use App\Http\Controllers\Admin\Service\UserToCompanyService;
use App\Http\Controllers\Admin\Service\View_CompanyService;

class UserService extends BaseApiService{
    private $UploadService;
    private $LanguageService;
    private $PermissionService;
    private $UserToCompanyService;
    private $View_CompanyService;

    function __construct(){
        $this->setTable('user');
        $this->LanguageService = new LanguageService();
        $this->UploadService = new UploadService();
        $this->PermissionService = new PermissionService();
        $this->UserToCompanyService = new UserToCompanyService();
        $this->View_CompanyService = new View_CompanyService();

    }

    function checkDuplicateOwnEmail($email,$id){
        $result = DB::table($this->getTable())
        ->where('email','=',$email)
        ->where('user_id','=',$id)
        ->count();
        Log::info('[UserService] -- checkDuplicateOwnEmail : ] '. $result);
        return $result;
    }

    function getUserById($result,$user_id){
        $user = $this->findByColumn_Value("user_id",$user_id);
        $result['user'] = !empty($user) && \sizeof($user)>0? $user[0] : array();
        $result['user']->companies = $this->View_CompanyService->getCompanyBelongOwn();
        return $result;
    }
    function getUserBelongOwn(){
        $user_ids = $this->UserToCompanyService->getUserIdsByCompany();
        Log::info('user_ids : ' . json_encode($user_ids));
        return $this->findByColumn_Values("user_id",$user_ids);
    }

    private function getListing(){
        return $this->getUserBelongOwn();
    }

    function redirect_view($result,$title){
        $result['label'] = "User";
        $result['permissions'] = $this->PermissionService->findByColumn_Value("is_public",1);
        $result['companies'] = $this->View_CompanyService->findByColumn_Value("party_id",Session::get('party_id'));
        switch($result['operation']){
            case 'listing':
                Log::info('[listing] --  : ' . \json_encode($result));
                $result['users'] = $this->getListing();
                return view("admin.user.listingUser", $title)->with('result', $result);
            break;
            case 'view_add':
                Log::info('[view_add] --  : ' . \json_encode($result));
                return view("admin.user.viewUser", $title)->with('result', $result);
            break;
            case 'view_edit':
                $result = $this->getUserById($result,$result['user_id']);
                $result['main_company_id'] = $this->UserToCompanyService->getMainCompanyIdByUser($result['user_id']);
                Log::info('[view_edit] --  : ' . \json_encode($result));
                return view("admin.user.viewUser", $title)->with('result', $result);
            break;
            case 'add':
                try{
                    DB::beginTransaction();
                    $email = $result['email'];
                    $own_email_count = $this->getCountForEmailExisting($email);
                    // Log::info('own_email_count : ' . $own_email_count);
                    if($own_email_count > 0 ){
                        throw new Exception("Update Error, The Email Is Duplicate In DB");
                    }
                    $result['image'] = $this->UploadService->upload_image($result['request'],'image','storage/company/'.Session::get('default_company_id').'/customer/images/');
                    $result['default_language_id'] = Session::get('language_id');
                    $result['default_company_id'] = Session::get('default_company_id');
                    $result['password'] = Hash::make($result['password_str']);
                    $add_user_result = $this->add($result);
                    if(empty($add_user_result['status']) || $add_user_result['status'] == 'fail')throw new Exception("Error To Add User");
                    $result = $this->response($result,"Success To Add User","view_edit");
                    $result = $this->getUserById($result,$result['user_id']);
                    DB::commit();
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }
                Log::info('result : ' . json_encode($result));
                return view("admin.user.viewUser", $title)->with('result', $result);
            break;
            case 'edit':
                try{
                    DB::beginTransaction();
                    $email = $result['email'];
                    $user_id = $result['user_id'];
                    $own_email_count = $this->getCountForEmailExisting($email);
                    $duplicate_email_count = $this->checkDuplicateOwnEmail($email,$user_id);
                    if($own_email_count > 1 ){
                        unset($result['email']);
                    }else if($own_email_count == 0 && $duplicate_email_count > 0){
                        throw new Exception("Update Error, The Email Is Duplicate In DB");
                    }

                    $result['image'] = $this->UploadService->upload_image($result['request'],'image','storage/company/'.Session::get('default_company_id').'/customer/images/');
                    if(empty($result['password_str'])){
                        unset($result['password']);
                        unset($result['password_str']);
                    }
                    // handle update User To Company
                    // Log::info('edit resultresult : ' . json_encode($result));

                    $delete_vtc_result = $this->UserToCompanyService->cleanByUserId($result['user_id']);
                    if(!empty($result['check_box_company']) && sizeof($result['check_box_company']) > 0){
                        if(empty($delete_vtc_result['status']) || $delete_vtc_result['status'] == 'fail')throw new Exception("Error To Delete VTC");
                        foreach ($result['check_box_company'] as $index => $company_id) {
                            $vtc_param = array();
                            $vtc_param['user_id'] = $result['user_id'];
                            $vtc_param['company_id'] = $company_id;
                            $vtc_param['is_main_company'] = 'no';
                            $add_vtc_result = $this->UserToCompanyService->add($vtc_param);
                            if(empty($add_vtc_result['status']) || $add_vtc_result['status'] == 'fail')throw new Exception("Error To Add VTC");
                        }
                        Log::info('edit check_box_company : ' . json_encode($result['check_box_company']));

                    }
                    // handle update User
                    $update_user_result = $this->update("user_id",$result);
                    if(empty($update_user_result['status']) || $update_user_result['status'] == 'fail')throw new Exception("Error To Update User");
                    $result = $this->response($result,"Success To Edit User","view_edit");
                    DB::commit();
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }
                $result = $this->getUserById($result,$result['user_id']);
                Log::info('result : ' . json_encode($result));
                return view("admin.user.viewUser", $title)->with('result', $result);
            break;
            case 'delete':
                try{
                    $delete_user_result = $this->deleteByKey_Value("user_id",$result['user_id']);
                    if(empty($delete_user_result['status']) || $delete_user_result['status'] == 'fail')throw new Exception("Error To Delete User");
                    $result['users'] = $this->getListing();
                    $result = $this->response($result,"Success To Delete User","view_edit");
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }
                return view("admin.user.listingUser", $title)->with('result', $result);
            break;
        }
    }
}

?>
