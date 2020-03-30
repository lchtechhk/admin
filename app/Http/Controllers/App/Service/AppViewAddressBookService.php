<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;
use JWTAuth;




class AppViewAddressBookService extends AppBaseApiService{


    function __construct(){
        $this->setTable('view_address_book');
        $this->companyAuth = false;
    }

    function findByCustomerId($customer_id){
        return $this->findByColumn_Value("customer_id",$customer_id);
    }

    function findAddressByToken(){
        $result = array();
        try{
            $customer_id = JWTAuth::parseToken()->authenticate()->id;
            $customer_address = $this->findByColumn_Value("customer_id",$customer_id);
            Log::info("[findAddressByToken] : " . json_encode($customer_address));
            $result = $customer_address;
        }catch(Exception $e){
            $result = $this->throwException($result,$e->getMessage(),false);
        }
        return $result;   
    }
}

?>