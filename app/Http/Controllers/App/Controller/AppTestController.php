<?php

namespace App\Http\Controllers\App\Controller;

use Illuminate\Routing\Controller;
use Log;
use Illuminate\Http\Request;
use Exception;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Validator, DB, Hash, Mail, Illuminate\Support\Facades\Password;

use App\Http\Controllers\App\Service\AppViewCustomerService;

class AppTestController extends Controller{
    private $AppViewCustomerService;

    function __construct(){
        $this->AppViewCustomerService = new AppViewCustomerService(); 

    }
    public function test(){
        $customer_id = 1;
        $a = $this->AppViewCustomerService->getProfile($customer_id);
        // return '123';
        return response()->json(['status'=> true, 'message'=> $a ]);

      }
}