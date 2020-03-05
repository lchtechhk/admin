<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;


class AppViewProductService extends AppBaseApiService{



    function __construct(){
        $this->setTable('view_product');
        $this->companyAuth = true;
    }

    function search($search){
        return $result = $this->findAllWithLanguage();

    }
    function test(){
        return $this->findAll();
    }
}

?>