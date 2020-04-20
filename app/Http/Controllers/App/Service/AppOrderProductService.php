<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;
use JWTAuth;




class AppOrderProductService extends AppBaseApiService{

    function __construct(){
        $this->setTable('order_product');
        $this->companyAuth = false;
    }
}

?>