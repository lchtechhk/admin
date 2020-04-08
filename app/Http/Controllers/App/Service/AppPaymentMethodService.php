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

    function listingAllPaymentMethod(){
        return $this->findAll();
    }
    function test(){
        return $this->findAll();
    }
}

?>