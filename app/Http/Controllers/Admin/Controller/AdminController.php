<?php

namespace App\Http\Controllers\Admin\Controller;
use App\Http\Controllers\Controller;
// use Validator;
// use App;
use Lang;
use Log;
// use DB;
// use Hash;
use Auth;
use Session;
// use Illuminate\Http\Request;


class AdminController extends Controller{

	function __construct(){

	}
	public function login(){
		if (Auth::check()) {
		//   return redirect('/admin/dashboard/this_month');
		}else{
			$title = array('pageTitle' => Lang::get("labels.login_page_name"));
			return view("admin.login.login",$title);
		}
	}

}
