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
        return $this->findByColumn_Value("district_status","active");
    }
}

?>