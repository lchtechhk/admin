<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Exception;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

use App\Http\Controllers\App\Service\AppViewCustomerService;
use App\Http\Controllers\App\Service\AppViewAddressBookService;

class AppCustomerTokenService extends AppBaseApiService{
    private $AppViewCustomerService;
    private $AppViewAddressBookService;

    function __construct(){
        $this->setTable('customer_token');
        $this->companyAuth = false;
        $this->AppViewCustomerService = new AppViewCustomerService(); 
        $this->AppViewAddressBookService = new AppViewAddressBookService(); 

    }

    function save_token($operation_type,$token){
        $result = array();
        JWTAuth::setToken($token);
        $payload = JWTAuth::getPayload($token);
        $customer_id = $payload['sub'];
        try{
            DB::beginTransaction();

            // getProfile
            $profile = $this->AppViewCustomerService->getProfile($customer_id);
            $result['owner'] = $profile;

            // getCustomerAddress
            $address = $this->AppViewAddressBookService->findByCustomerId($customer_id);
            $result['address'] = $address;
            // Search Token History
            $token_histories = $this->findByColumn_Value("customer_id",$customer_id);
            // Log::info("token_histories : " . json_encode($token_histories));
            if(!empty($token_histories) && sizeof($token_histories) > 0){
                // Update
                $update_param = array();
                $update_param['end_date'] = date('Y-m-d H:i:s');
                $update_param['status'] = 'cancel';
                $update_token_result = DB::table($this->table)->where(array('customer_id'=>$customer_id,'status'=>'active'))->update($update_param);
            }
            // Add Token History
            $param = array();
            $param['customer_id'] = $customer_id;
            if($operation_type == 'login'){
                $param['token'] = $token;
            }else if($operation_type == 'refresh'){
                $param['token'] = JWTAuth::refresh($token);
                $result['token'] = $param['token'];
            }
            $add_token_result = $this->add($param);
            if(empty($add_token_result['status']) || $add_token_result['status'] == 'fail')throw new Exception("Error To Add Token");
            $result = $this->response($result,"Successful","view_edit");
            DB::commit();
            // Log::info("address : " . json_encode($result));
        }catch(Exception $e){
            $result = $this->throwException($result,$e->getMessage(),true);
        }

        return $result;
    }

    function get_lasttime_login($customer_id){
        $result = DB::table($this->getTable())->where("customer_id", $customer_id)->orderBy("create_date", 'desc')->first(['create_date','status']);
        Log::info('[AppDao] -- ' .'['.$this->getTable().'] -- get_lasttime_login : ' . json_encode($result));
        return $result;
        // return "123";
    }
    function redirect_view($result,$title){
    }
}

?>