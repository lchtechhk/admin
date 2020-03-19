<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;

use App\Http\Controllers\App\Service\AppUploadService;
use App\Http\Controllers\App\Service\AppLanguageService;



class AppProductImageService extends AppBaseApiService{


    function __construct(){
        $this->setTable('product_image');
        $this->companyAuth = false;
    }

    function test(){
        return $this->findAll();
    }
}

?>