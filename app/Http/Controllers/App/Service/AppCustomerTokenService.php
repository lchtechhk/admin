<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Exception;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

use App\Http\Controllers\App\Service\AuthService;

class AppCustomerTokenService extends AppBaseApiService{
    private $AuthService;
    function __construct(){
        $this->setTable('customer_token');
        $this->companyAuth = false;
        $this->AuthService = new AuthService();   
    }

    function save_token($token){
        Log::info("owner : " . $token);
        JWTAuth::setToken($token);
        $payload = JWTAuth::getPayload($token);
        Log::info("payload : " . json_encode($payload));

    }
    function redirect_view($result,$title){
    }
}

?>