<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;




class AppViewAddressBookService extends AppBaseApiService{


    function __construct(){
        $this->setTable('view_address_book');
        $this->companyAuth = false;
    }

    function findByCustomerId($customer_id){
        return $this->findByColumn_Value("customer_id",$customer_id);
    }
}

?>