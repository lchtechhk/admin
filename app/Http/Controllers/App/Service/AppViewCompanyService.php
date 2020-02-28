<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;

use App\Http\Controllers\App\Service\AppUploadService;
use App\Http\Controllers\App\Service\AppLanguageService;



class AppViewCompanyService extends AppBaseApiService{
    private $AppLanguageService;
    private $AppUploadService;


    function __construct(){
        $this->setTable('view_company');
        $this->companyAuth = true;
        $this->AppLanguageService = new AppLanguageService();
    }

    function test(){
        return $this->findAll();
    }

    function getProfile($customer_id){
        $this->companyAuth = false;
        $result = DB::table($this->getTable())->where('id', $customer_id)
        ->pluck('title','picture','gender',
        'firstname','lastname','email',
        'create_date','company_name','company_phone','company_image');
        $result = $result->get();
        Log::info('[AppViewCompanyService] -- ' .'['.$this->getTable().'] -- getProfile : ' . json_encode($result));
        return $result;
    }
}

?>