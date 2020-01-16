<?php
namespace App\Http\Controllers\Admin\Service;
use Log;
use DB;
use Lang;
use Exception;
use Session;

     class LanguageService extends BaseApiService{

        function __construct(){
            $this->setTable('language');
            $this->companyAuth = true;
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
                    return view("admin.location.district.addDistrict", $title)->with('result', $result);
                break;
                case 'view_edit':
                    return view("admin.location.district.editDistrict", $title)->with('result', $result);		
                break;
                case 'add':
                    try{                        
                        return view("admin.location.district.editDistrict", $title)->with('result', $result);
                    }catch(Exception $e){
                        return view("admin.location.district.addDistrict", $title)->with('result', $result);
                    }
                break;
                case 'edit':
                    try{
                        DB::beginTransaction();
                        
                        DB::commit();
                    }catch(Exception $e){
                    }

                break;
                case 'delete': 
                    try{
                      
                    }catch(Exception $e){
                    }
                break;
            }
        }
    }
?>