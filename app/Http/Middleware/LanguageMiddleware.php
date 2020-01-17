<?php

namespace App\Http\Middleware;

use Closure;
use Session;
use Config;
use App;
use DB;
use Log;
use App\Http\Controllers\Admin\Service\LanguageService;

class LanguageMiddleware{
    
    private $LanguageService;
    function __construct(){
        $this->LanguageService = new LanguageService();
    }
    
    public function handle($request, Closure $next)
    {
		if(Session::has('locale')){
			$locale = Session::get('locale', Config::get('app.locale'));
		}else{	   
            $user_auth = auth()->guard('admin')->user();
            $default_company_id = $user_auth->default_company_id;
            $request->session()->put('default_company_id', $default_company_id);
            $languages = $this->LanguageService->findByColumn_Value("is_default",'yes');
            if(!empty($languages) && \sizeof($languages) > 0){
                $language = $languages[0];
                $request->session()->put('direction', $language->direction);	 	
                $locale = $language->code;
                App::setLocale($locale);
            }else {
                return redirect('/admin/login');
            }
            
		}
		
		
        return $next($request);
    }
}
