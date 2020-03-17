<?php

namespace App\Http\Controllers\App\Controller;

use Illuminate\Routing\Controller;
use Log;
use Illuminate\Http\Request;
use Exception;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Validator, DB, Hash, Mail, Illuminate\Support\Facades\Password;

use App\Http\Controllers\App\Service\AuthService;

class AuthController extends Controller{
    private $AuthService;

    function __construct(){
        $this->AuthService = new AuthService();    
    }

    public function register(Request $request){
        $credentials = $request->only('username', 'email', 'password');
        $rules = [
            'username' => 'required|max:255|unique:users',
            'email' => 'required|email|max:255|unique:users',  
            'password' => 'required|min:6',
        ];
        $validator = Validator::make($credentials, $rules);
        if($validator->fails()) {
            return response()->json(['status'=> false, 'message'=> $validator->messages()]);
        }
        $username = $request->username;
        $email = $request->email;
        $password = $request->password;
        // User::create(['username' => $username, 'email' => $email, 'password' => Hash::make($password)]);
        // return $this->login($request);
    }

    public function login(Request $request){
        $credentials = $request->only('email', 'password');
        $rules = [
            'email' => 'required|email',
            'password' => 'required',
        ];
        $validator = Validator::make($credentials, $rules);
        if($validator->fails()) {
            return response()->json(['status'=> false, 'message'=> "The email must be a valid email address."]);
        }
        try {
            if (!$token = JWTAuth::attempt($credentials)) {
                return response()->json(['status' => false, 'message' => 'We cant find an account with this credentials.'], 401);
            }
        } catch (JWTException $e) {
            return response()->json(['status' => false, 'message' => 'Failed to login, please try again.'], 500);
        }

        try {
            $save_token_result = $this->AuthService->login($token);
            if(empty($save_token_result['status']) || $save_token_result['status'] == 'fail')throw new Exception($save_token_result['message']);
            return response()->json(['status' => true, 'data'=> [ 'token' => $token , 'owner' => $save_token_result['owner']],'message' => 'Login Successful']);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function logout(Request $request) {
        $credentials = $request->only('token');
        $token = $credentials['token'];
        $validator = Validator::make($credentials, ['token' => 'required']);
        try {
            $cancel_token_result = $this->AuthService->logout($token);
            if(empty($cancel_token_result['status']) || $cancel_token_result['status'] == 'fail')throw new Exception($cancel_token_result['message']);
            // JWTAuth::parseToken()->invalidate();
            return response()->json(['status' => true, 'message'=> "You have successfully logged out."]);
        } catch (JWTException $e) {
            return response()->json(['status' => false, 'message' => 'Failed to logout, please try again.'], 500);
        } catch (JWTException $e) {
            Log::error('error : ' . $e->getMessage());
            return response()->json(['status' => false, 'message' => $e->getMessage()], 500);
        }
    }

    protected function respondWithToken(Request $request){
        $token = $request->input('token');

        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => JWTAuth::factory()->getTTL() * 60
        ]);
    }

    public function me(){
        return $this->AuthService->getOwner()['msg'];
    }

    public function authenticate(Request $request){
        $token = $request->input('token');
        $owner = JWTAuth::parseToken()->authenticate();
        return response()->json(['status' => true, 'data'=> [ 'owner' => $owner]]);
    }
    public function refresh_token(Request $request){
        try{
            $token = $request->input('token');
            $owner = JWTAuth::parseToken()->authenticate();
            if($owner['status'] != true) throw new Exception($owner['message']);
            $refresh_token_result = $this->AuthService->refresh_token($token);
            if(empty($refresh_token_result['status']) || $refresh_token_result['status'] == 'fail')throw new Exception($save_token_result['message']);
            return response()->json(['status' => true, 'data'=> [ 'owner' => $refresh_token_result['owner'],'token' => $refresh_token_result['token']]]);
        }catch(Exception $e){
            Log::info("[refresh_token] -- Error : " . $e->getMessage());
            return response()->json(['status' => false, 'data'=> '', 'message'=>$e->getMessage()]);
        }
    }
}