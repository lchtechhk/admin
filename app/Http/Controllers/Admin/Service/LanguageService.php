<?php
namespace App\Http\Controllers\Admin\Service;
use Log;
use DB;
use Lang;
use Exception;
use Session;
use App\Http\Controllers\Admin\Service\UploadService;

     class LanguageService extends BaseApiService{
        private $UploadService;

        function __construct(){
            $this->setTable('language');
            $this->UploadService = new UploadService();
            $this->companyAuth = true;
        }

        function update_default_language($language_id){
            try{
                $user_auth = auth()->guard('admin')->user();
                $user_id = $user_auth->user_id;
                $result = array("user_id"=>$user_id,"default_language"=>$language_id);
                Log::info("update_default_language : " . \json_encode($result));
                $this->setTable('user');
                $update_user_result = $this->update("user_id",$result);
                $this->setTable('language');
                if(empty($update_user_result['status']) || $update_user_result['status'] == 'fail')throw new Exception("Error To Update User Default Language");
                return $result = $this->response($result,"Success To Update User Default Language","");
            }catch(Exception $e){
                return $result = $this->throwException($result,$e->getMessage(),true);
            }
            
        }

        function clean_dafault_language(){
            try{
                $result = array("company_id"=>Session::get('default_company_id'),"is_default"=>'no');
                $result_clean_dafault_language = $this->update("company_id",$result);
                if(empty($result_clean_dafault_language['status']) || $result_clean_dafault_language['status'] == 'fail')throw new Exception("Error To Clean Default Language");
                Log::info("result_clean_dafault_language : " . \json_encode($result_clean_dafault_language));
                return $result_clean_dafault_language;
            }catch(Exception $e){
                return $this->throwException($result,$e->getMessage(),false);
            }
        }
        function getLanguage($language_id){
            $language_array = $this->findByColumn_Value("language_id",$language_id);
            $language = !empty($language_array) && sizeof($language_array) > 0 ? $language_array[0] : array();
            Log::info('[language] -- getLanguage : ' .json_encode($language));
            return $language;
        }
        function redirect_view($result,$title){
            $result['label'] = "Language";
            switch($result['operation']){
                case 'listing':
                    $result['languages'] = $this->findAll();
                    // Log::info('[result] : ' . \json_encode($result));
                    return view("admin.language.listingLanguage", $title)->with('result', $result);
                break;
                case 'defaultLanguage':
                    try{
                        DB::beginTransaction();
                        $result_clean_dafault_language = $this->clean_dafault_language();
                        if(empty($result_clean_dafault_language['status']) || $result_clean_dafault_language['status'] == 'fail')throw new Exception($result_clean_dafault_language['message']);
                        
                        $result['is_default'] = 'yes';
                        $update_language_result = $this->update('language_id',$result);
                        if(empty($update_language_result['status']) || $update_language_result['status'] == 'fail')throw new Exception("Error To Update Default Language");
                        
                        $update_user_result = $this->update_default_language($result['language_id']);
                        if(empty($update_user_result['status']) || $update_user_result['status'] == 'fail')throw new Exception($update_user_result['message']);

                        $result = $this->response($result,"Success To Update City","view_edit");
                        // Log::info('[city result] --  : ' . json_encode($result));
                        DB::commit();
                    }catch(Exception $e){
                        $result = $this->throwException($result,$e->getMessage(),true);
                    }		
                    $result['languages'] = $this->findAll();
                    return view("admin.language.listingLanguage", $title)->with('result', $result);
                break;
                case 'view_add':
                    return view("admin.language.viewLanguage", $title)->with('result', $result);
                break;
                case 'view_edit':
                    $result['language'] = $this->getLanguage($result['language_id']);
                    return view("admin.language.viewLanguage", $title)->with('result', $result);		
                break;
                case 'add':
                    try{                    
                        DB::beginTransaction();
                        if($image = $this->UploadService->upload_image($result['request'],'image','storage/company/language/'))$result['image'] = $image;
                        $add_language_result = $this->add($result);
                        if(empty($add_language_result['status']) || $add_language_result['status'] == 'fail')throw new Exception("Error To Add Language");
                        $result['language_id'] = $add_language_result['response_id'];
                    $result = $this->response($result,"Successful","view_add");
                        DB::commit();
                    }catch(Exception $e){
                        $result = $this->throwException($result,$e->getMessage(),true);
                    }
                    $result['language'] = $this->getLanguage($result['language_id']);
                    return view("admin.language.viewLanguage", $title)->with('result', $result);
                break;
                case 'edit':
                    try{
                        DB::beginTransaction();
                        if($image = $this->UploadService->upload_image($result['request'],'image','storage/company/language/'))$result['image'] = $image;
                        $update_language_result = $this->update("language_id",$result);
                        if(empty($update_language_result['status']) || $update_language_result['status'] == 'fail')throw new Exception("Error To Update Language Image");
                        $result = $this->response($result,"Successful","view_edit");
                        DB::commit();
                    }catch(Exception $e){
                        $result = $this->throwException($result,$e->getMessage(),true);
                    }
                    $result['language'] = $this->getLanguage($result['language_id']);
                    return view("admin.language.viewLanguage", $title)->with('result', $result);
                break;
                case 'delete': 
                    try{
                        $delete_language_result = $this->deleteByKey_Value("language_id",$result['language_id']);
                        if(empty($delete_language_result['status']) || $delete_language_result['status'] == 'fail')throw new Exception("Error To Delete Language");
                        $result = $this->response($result,"Success To Delete Language","listing");
                        Log::info('[delete] : ' . \json_encode($result));
                    }catch(Exception $e){
                        $result = $this->throwException($result,$e->getMessage(),true);
                    }
                    $result['languages'] = $this->findAll();
                    return view("admin.language.listingLanguage", $title)->with('result', $result);
                break;
            }
        }
    }
?>