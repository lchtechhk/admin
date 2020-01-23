<?php
namespace App\Http\Controllers\Admin\Dao;
use Log;
use DB;
use Lang;
use Exception;
use Session;
use Hash;

use App\Http\Controllers\Admin\Service\BaseApiService;

class CompanyDao extends BaseApiService{

    function __construct(){
        $this->setTable('company');
    }
    function redirect_view($result,$title){}
}

?>