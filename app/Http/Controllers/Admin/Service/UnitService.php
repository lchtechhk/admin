<?php
namespace App\Http\Controllers\Admin\Service;
use Log;
use DB;
use Lang;
use Exception;
use Session;

use App\Http\Controllers\Admin\Service\View_ManufacturerService;
use App\Http\Controllers\Admin\Service\LanguageService;
use App\Http\Controllers\Admin\Service\UploadService;
use App\Http\Controllers\Admin\Service\ManufacturerDescriptionService;


class UnitService extends BaseApiService{
    function __construct(){
        $this->setTable('unit');
    }
    function getUnit(){
        return DB::table($this->getTable())->where('language_id',Session::get('language_id'))->get();
    }
    function redirect_view($result,$title){
    }
}

?>