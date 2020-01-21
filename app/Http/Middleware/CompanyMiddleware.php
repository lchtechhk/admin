<?php

namespace App\Http\Middleware;

use Closure;
use DB;
use Session;
use Config;
use Log;
use App;
use App\Http\Controllers\Admin\Service\View_CompanyService;
use App\Http\Controllers\Admin\Service\UserToCompanyService;
use App\Http\Controllers\Admin\Service\LanguageService;

class CompanyMiddleware
{
    private $View_CompanyService;
    private $UserToCompanyService;
    private $LanguageService;
    function __construct(){
        $this->View_CompanyService = new View_CompanyService();
        $this->UserToCompanyService = new UserToCompanyService();
        $this->LanguageService = new LanguageService();
	}
    public function handle($request, Closure $next)
    {
        $user_auth = auth()->guard('admin')->user();
        if(empty($user_auth)) return redirect('/admin/login');
        Log::info("user_auth : " . json_encode($user_auth));

        $default_company_id = $user_auth->default_company_id;
        $user_id = $user_auth->user_id;

        $request->session()->put('user_id', $user_id);
        $request->session()->put('default_company_id', $default_company_id);

        $languages = $this->LanguageService->findByColumn_Value("is_default",'yes');
        if(!empty($languages) && \sizeof($languages) > 0){
            $language = $languages[0];
            $request->session()->put('direction', $language->direction);	 
            $request->session()->put('language_id', $language->language_id);
            App::setLocale($language->code);

            $own_companies = $this->View_CompanyService->getCompanyBelongOwn();
            if(\sizeof($own_companies) > 0){
                $request->session()->put('owner_companies', $own_companies);
            }else {
                return redirect('/admin/view_registerCompany');
            }
        }else {
            return redirect('/admin/login');
        }
        
        return $next($request);
    }
}
