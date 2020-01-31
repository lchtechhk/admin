<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;

use App\Http\Controllers\App\Service\AppUploadService;
use App\Http\Controllers\App\Service\AppLanguageService;



class AppOrderService extends AppBaseApiService{
    private $AppLanguageService;
    private $AppUploadService;


    function __construct(){
        $this->setTable('order');
        $this->companyAuth = true;
        $this->AppLanguageService = new AppLanguageService();
    }

    function test(){
        return $this->findAll();
    }
}

?>