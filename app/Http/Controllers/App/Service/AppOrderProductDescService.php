<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;
use JWTAuth;


class AppOrderProductDescService extends AppBaseApiService{

    function __construct(){
        $this->setTable('order_product_description');
        $this->companyAuth = false;
    }
}

?>