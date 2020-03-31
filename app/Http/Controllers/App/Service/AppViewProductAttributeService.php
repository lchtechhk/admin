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

    function findByAttIds($param){
        $result_product = $this->findByArrayWithLanguage($param);
        if(!empty($result_product) && \sizeof($result_product) > 0){
            return $result_product;
        }
        return array();
    }
    function test(){
        return $this->findAll();
    }
}

?>