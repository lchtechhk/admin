<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;
use JWTAuth;


use App\Http\Controllers\App\Service\AppCustomerTokenService;

class AuthService {
    private $AppCustomerTokenService;
    function __construct(){
        $this->AppCustomerTokenService = new AppCustomerTokenService();   

    }


    public function getOwner(){
        try {    
            $owner = JWTAuth::parseToken()->touser();
            if($owner)return ['status' => true, 'msg' => $owner];
            throw new Exception("User is not existing");
        } catch (Exception $e) {
            return ['status' => false, 'message' => $e->getMessage()];
        }
    }

    public function refresh_token($old_token){
        $result = array();
        try {
            $result = $this->AppCustomerTokenService->save_token("refresh",$old_token);
        } catch (Exception $e) {
            $result = $this->throwException($result,$e->getMessage(),true);
        } 
        return $result;
    }

    public function login($token){
        $result = array();
        try {
            $result = $this->AppCustomerTokenService->save_token("login",$token);
            Log::info("login : " . json_encode($result));
        } catch (Exception $e) {
            $result = $this->throwException($result,$e->getMessage(),true);
        } 
        return $result;
    }

    public function logout($token){
        // Log::info("logout : " . $token);
        $result = array();
        try {   
            DB::beginTransaction();
            $param = array('token'=>$token,'end_date'=>date('Y-m-d H:i:s'),'status'=>'cancel');
            $a = $this->AppCustomerTokenService->findByColumn_Value("token",$token);
            if(empty($a))throw new Exception("Token is not existing");
            $cancel_token_result = $this->AppCustomerTokenService->update("token",$param);
            if(empty($cancel_token_result['status']) || $cancel_token_result['status'] == 'fail')throw new Exception($cancel_token_result['message']);
            $result = $this->response($result,"Successful","view_edit");
            DB::commit();
        } catch (Exception $e) {
            $result = $this->throwException($result,$e->getMessage(),true);
        } 
        return $result;
    }

    public function throwException($result,$error_msg,$is_rollback){
        Log::error("throwException : " . $error_msg);
        $result['status'] = 'fail';
        $result['message'] =  $error_msg;
        if($is_rollback)DB::rollBack();
        return $result;
    }
    public function response($result,$message,$operation){
        $result['status'] = "success";
        $result['message'] =  $message;
        $result['operation'] = $operation;
        return $result;
    }
}

?>