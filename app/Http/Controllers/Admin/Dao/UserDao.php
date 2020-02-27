<?php
namespace App\Http\Controllers\Admin\Dao;
use Log;
use DB;
use Lang;
use Exception;
use Session;
use Hash;

use App\Http\Controllers\Admin\Service\BaseApiService;

class UserDao extends BaseApiService{

    function __construct(){
        $this->setTable('user');
    }
    function redirect_view($result,$title){}
}

?>