<?php

namespace App\Http\Controllers\App\Controller;
use App\Http\Controllers\Controller;
use Illuminate\Routing\Controller;
use Log;

class AuthController extends Controller{
    function __construct(){
        Log::error('[__construct] : ');
    }
    
    public function test(){
        return "1233";
    }

}
