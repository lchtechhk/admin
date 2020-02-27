<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;
use JWTAuth;



class AuthService {

    function __construct(){
    }


    public function getOwner(){
        try {    
            $owner = JWTAuth::parseToken()->touser();
            if($owner)return ['status' => true, 'msg' => $owner];
            throw new Exception("User is not existing");
        } catch (Exception $e) {
            Log::error('[Api Auth Error] - getOwner : ' . $e->getMessage());
            return ['status' => false, 'message' => $e->getMessage()];
        }
    }

    public function refresh_token($token){
        return $new_token = JWTAuth::refresh($token);
    }
}

?>