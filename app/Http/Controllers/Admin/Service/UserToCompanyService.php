<?php
namespace App\Http\Controllers\Admin\Service;
use Log;
use DB;
use Session;
use App\Http\Controllers\Admin\Service\BaseApiService;
     class UserToCompanyService extends BaseApiService{
        function __construct(){
            $this->setTable('user_to_company');
        }

        function getMainCompanyIdByUser($user_id){
            $param = array();
            $param['user_id'] = $user_id;
            $param['is_main_company'] = 'yes';
            $result = $this->findByArray($param);
            if(sizeof($result) > 0){
                return $result[0]->company_id;
            }
            return null;
        }
        function cleanByUserId($user_id){
            DB::enableQueryLog();
            $delete_id = DB::table($this->table)->where('user_id', $user_id)->where(function ($query) {
                $query->where('is_main_company','no')->orWhereNull("is_main_company");
            })->delete();
            $result = array();
            if($delete_id === null){
                $result['status'] = 'fail';
            }else {
                $result['status'] = 'success';
            }
            $result['operation'] = 'delete';
            $query = DB::getQueryLog();
            Log::notice('[MainRepository] -- ' .'[cleanByUserId SQL] --'. \json_encode(end($query)));
            return $result;
        }
        function getUserIdsByCompany(){
            $user_to_company = $this->findByColumn_Value("company_id",Session::get('default_company_id'));
            $id_list = array();
            if(sizeof($user_to_company) > 0){
                foreach ($user_to_company AS $utc) {
                    $id_list[] = $utc->user_id;
                }
            }
            return $id_list;
        }
        function getCompanyIdsByUser(){
            $user_to_company = $this->findByColumn_Value("user_id",Session::get('user_id'));
            $id_list = array();
            if(sizeof($user_to_company) > 0){
                foreach ($user_to_company AS $utc) {
                    $id_list[] = $utc->company_id;
                }
            }
            return $id_list;
        }

        function redirect_view($result,$title){
        }
    }
?>
