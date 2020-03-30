<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;
use JWTAuth;

use App\Http\Controllers\App\Service\AppUploadService;
use App\Http\Controllers\App\Service\AppLanguageService;



class AppViewDistrictService extends AppBaseApiService{


    function __construct(){
        $this->setTable('view_country_city_area_district');
        $this->companyAuth = true;
    }

    function getAllDistrict(){
        $customer_id = JWTAuth::parseToken()->authenticate()->id;
        $company_id = JWTAuth::parseToken()->authenticate()->company_id;
        $language_id = JWTAuth::parseToken()->authenticate()->default_language_id;
        Log::info("customer_id : " . $this->customer_id);
        Log::info("company_id : " . $this->company_id);
        Log::info("language_id : " . $this->language_id);
        return $this->findByColumn_Value("district_status","active");
    }
}

?>