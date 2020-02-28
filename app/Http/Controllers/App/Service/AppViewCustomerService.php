<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;

use App\Http\Controllers\App\Service\AppUploadService;
use App\Http\Controllers\App\Service\AppLanguageService;



class AppViewCustomerService extends AppBaseApiService{
    private $AppLanguageService;
    private $AppUploadService;


    function __construct(){
        $this->setTable('view_customer');
        $this->companyAuth = true;
        $this->AppLanguageService = new AppLanguageService();
    }

    function getProfile($customer_id){
        try{
            $this->companyAuth = false;
            $result = DB::table($this->getTable())->where('id', $customer_id)
            ->get(['picture','gender','firstname','lastname','email','create_date','company_name','company_phone','company_image']);
            Log::info('[AppViewCustomerService] -- ' .'['.$this->getTable().'] -- getProfile : ' . json_encode($result[0]));
            return $result[0];
        }catch(Excepton $e){
            throw new Exception ($e->getMessage());
        }
    }

    function test(){
        return $this->findAll();
    }
}

?>