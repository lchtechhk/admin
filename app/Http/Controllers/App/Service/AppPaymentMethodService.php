<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;

class AppPaymentMethodService extends AppBaseApiService{
  


    function __construct(){
        $this->setTable('payment_method');
        $this->companyAuth = true;
    }

    function getAllPaymentMethod(){
        return $this->findAll();
    }

    function getAllPaymentMethodForLogin($company_id){
        $this->companyAuth = false;
        return $this->findByColumn_Value("company_id",$company_id);
    }
    function test(){
        return $this->findAll();
    }
}

?>