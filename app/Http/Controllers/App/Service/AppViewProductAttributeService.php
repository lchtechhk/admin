<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;


class AppViewProductAttributeService extends AppBaseApiService{

    function __construct(){
        $this->setTable('view_product_attribute');
        $this->companyAuth = true;
    }

    function test(){
        return $this->findAll();
    }
}

?>