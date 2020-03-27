<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;


use App\Http\Controllers\App\Service\AuthService;


class AppAddressBookService extends AppBaseApiService{
    private $AuthService;


    function __construct(){
        $this->setTable('address_book');
        $this->companyAuth = false;
        $this->AuthService = new AuthService();   

    }

    function updateCustomerAddress($param){
        $result = array();
        try{
            $update_address_result = $this->update("id",$param);
            if(empty($update_address_result['status']) || $update_address_result['status'] == 'fail')throw new Exception("Error To update Address");
            $result = $this->response($result,"Successful","view_edit");
        }catch(Exception $e){
            $result = $this->throwException($result,$e->getMessage(),false);
        }
        return $result;   
    }

    function updateAddressDefault($token,$address_book_id){
        // Log::info("token : " . $token);
        // Log::info("address_book_id : " . $address_book_id);

        $result = array();
        try{
            $customer_id = $this->AuthService->getCustomerIdByToken($token);
            $clear_param = array("customer_id"=>$customer_id,'is_default'=>'no');
            // Log::info("clear_param : " . json_encode($clear_param));

            $clear_default_result = $this->update("customer_id",$clear_param);
            if(empty($clear_default_result['status']) || $clear_default_result['status'] == 'fail')throw new Exception("Error To Clear Default");
            $update_param = array('is_default'=>'yes');
            $update_default_result = $this->updateByMultipleKey_Value($update_param,array("id","customer_id"),array($address_book_id,$customer_id));
            if(empty($update_default_result['status']) || $update_default_result['status'] == 'fail')throw new Exception("Error To Update Default");
            $result = $this->response($result,"Successful","view_edit");
        }catch(Exception $e){
            $result = $this->throwException($result,$e->getMessage(),false);
        }
        return $result;   

    }
}

?>