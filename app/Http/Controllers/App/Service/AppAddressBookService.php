<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;
use JWTAuth;

class AppAddressBookService extends AppBaseApiService{

    function __construct(){
        $this->setTable('address_book');
        $this->companyAuth = false;
    }

    function addCustomerAddress($param){
        $result = array();
        try{
            $param['customer_id'] = JWTAuth::parseToken()->authenticate()->id;
            $add_address_result = $this->add($param);
            if(empty($add_address_result['status']) || $add_address_result['status'] == 'fail')throw new Exception("Error To Add Address");
            if($param['is_default']){
                $update_default_result = $this->updateAddressDefault($add_address_result['response_id']);
                if(empty($update_default_result['status']) || $update_default_result['status'] == 'fail')throw new Exception($update_default_result['message']);
            }
            $result = $this->response($result,"Successful","view_edit");
        }catch(Exception $e){
            $result = $this->throwException($result,$e->getMessage(),false);
        }
        return $result;   
    }

    function updateCustomerAddress($param){
        $result = array();
        try{
            $update_address_result = $this->update("id",$param);
            if(empty($update_address_result['status']) || $update_address_result['status'] == 'fail')throw new Exception("Error To Update Address");
            if($param['is_default']){
                $update_default_result = $this->updateAddressDefault($param['id']);
                if(empty($update_default_result['status']) || $update_default_result['status'] == 'fail')throw new Exception($update_default_result['message']);
            }
            $result = $this->response($result,"Successful","view_edit");
        }catch(Exception $e){
            $result = $this->throwException($result,$e->getMessage(),false);
        }
        return $result;   
    }

    function deleteCustomerAddress($address_book_id){
        $result = array();
        try{
            $delete_address_result = $this->deleteByKey_Value("id",$address_book_id);
            if(empty($delete_address_result['status']) || $delete_address_result['status'] == 'fail')throw new Exception("Error To Delete Address");
            if(!empty($find_result = $this->findFirstCustomerAddress())){
                $first_address_id = $find_result->id;
                $update_default_result = $this->updateAddressDefault($first_address_id);
                if(empty($update_default_result['status']) || $update_default_result['status'] == 'fail')throw new Exception("Error To Update Default");

            }
            $result = $this->response($result,"Successful","view_edit");
        }catch(Exception $e){
            $result = $this->throwException($result,$e->getMessage(),false);
        }
        return $result;   
    }

    function findFirstCustomerAddress(){
        $result = array();
        try{
            $customer_id = JWTAuth::parseToken()->authenticate()->id;
            $result = DB::table($this->getTable());
            $result->where("customer_id",$customer_id);
            $result->first();
            $result = $result->get();
            Log::info('[AppAddressBookService] -- ' .'['.$this->getTable().'] -- findFirstCustomerAddress : ' . json_encode($result[0]));
            return $result[0];

        }catch(Exception $e){
            $result = $this->throwException($result,$e->getMessage(),false);
        }
    }
    function updateAddressDefault($address_book_id){
        $result = array();
        try{
            $customer_id = JWTAuth::parseToken()->authenticate()->id;
            $clear_param = array("customer_id"=>$customer_id,'is_default'=>'no');

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