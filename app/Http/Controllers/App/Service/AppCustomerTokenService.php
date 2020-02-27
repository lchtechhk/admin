<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Exception;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

use App\Http\Controllers\App\Service\AuthService;

class AppCustomerTokenService extends AppBaseApiService{
    private $AuthService;
    function __construct(){
        $this->setTable('customer_token');
        $this->companyAuth = false;
        $this->AuthService = new AuthService();   
    }

    function save_token($token){
        $result = array();
        JWTAuth::setToken($token);
        $payload = JWTAuth::getPayload($token);
        $customer_id = $payload['sub'];
        try{
            DB::beginTransaction();
            // Search
            $token_histories = $this->findByColumn_Value("customer_id",$customer_id);
            Log::info("token_histories : " . json_encode($token_histories));
            if(!empty($token_histories) && sizeof($token_histories) > 0){
                // Update
                $update_param = array();
                $update_param['end_date'] = date('Y-m-d H:i:s');
                $update_param['status'] = 'cancel';
                $update_token_result = DB::table($this->table)->where(array('customer_id'=>$customer_id,'status'=>'active'))->update($update_param);
                if($update_token_result == 0 )throw new Exception("Error To Update Token");
            }
            // Add
            $param = array();
            $param['customer_id'] = $customer_id;
            $param['token'] = $token;
            $add_token_result = $this->add($param);
            if(empty($add_token_result['status']) || $add_token_result['status'] == 'fail')throw new Exception("Error To Add Token");
            $result = $this->response($result,"Successful","view_edit");
            DB::commit();
        }catch(Exception $e){
            $result = $this->throwException($result,$e->getMessage(),true);
        }
        Log::info("result : " . json_encode($result));
    }
    function redirect_view($result,$title){
    }
}

?>