<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;



class AppViewCustomerService extends AppBaseApiService{

    function __construct(){
        $this->setTable('view_customer');
        $this->companyAuth = true;
    }

    function getProfile($customer_id){
        Log::info('[getProfile] -- ' .  $customer_id);

        try{
            $this->companyAuth = false;
            // User Information
            $result = DB::table($this->getTable())->where('id', $customer_id)
            ->get(['company_id','language_id','language_name','language_image','picture','gender','firstname','lastname','email','create_date','company_name','company_phone','company_image']);
            if(!empty($result) && sizeof($result) > 0){
                if(empty($result[0]->picture)) $result[0]->picture = './assets/images/user.png';
            }
            // Last Login Time
            $result[0]->lasttime_login = array();
            $lasttime_login_result = $this->get_lasttime_login($customer_id);
            if(!empty($lasttime_login_result)){
                $result[0]->lasttime_login = $lasttime_login_result;
            }
            Log::info('[AppViewCustomerService] -- ' .'['.$this->getTable().'] -- getProfile : ' . json_encode($result[0]));
            return $result[0];
        }catch(Excepton $e){
            throw new Exception ($e->getMessage());
        }
    }

    function get_lasttime_login($customer_id){
        Log::info('[get_lasttime_login] -- ' );
        $result = DB::table("customer_token")->where("customer_id", $customer_id)->where("status", "cancel")->orderBy("create_date", 'desc')->first(['create_date','end_date','status']);
        Log::info('[AppDao] -- ' .'[customer_token] -- get_lasttime_login : ' . json_encode($result));
        return $result;
        // return "123";
    }
    function test(){
        return $this->findAll();
    }
}

?>