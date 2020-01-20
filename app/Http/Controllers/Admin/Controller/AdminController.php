<?php

namespace App\Http\Controllers\Admin\Controller;
use App\Http\Controllers\Controller;
use Validator;
// use App;
use Lang;
use Log;
use DB;
// use Hash;
use Auth;
use Session;
use Illuminate\Http\Request;

use App\Http\Controllers\Admin\Service\LanguageService;
use App\Http\Controllers\Admin\Service\View_CompanyService;
use App\Http\Controllers\Admin\Service\UserService;
use App\Http\Controllers\Admin\Service\View_OrderService;

class AdminController extends Controller{
    private $LanguageService;
	private $UserService;
	private $View_CompanyService;
	private $View_OrderService;

	function __construct(){
        $this->LanguageService = new LanguageService();
		$this->UserService = new UserService();
		$this->View_CompanyService = new View_CompanyService();
		$this->View_OrderService = new View_OrderService();
    }

    public function dashboard(Request $request){
		$title 			  = 	array('pageTitle' => Lang::get("labels.title_dashboard"));
		$language_id      = 	'1';
		$result 		  =		array();


		$reportBase		  = 	$request->reportBase; //this_month

		// //recently order placed
		$orders = $this->View_OrderService->findByColumn_Value('company_id',Session::get('default_company_id'));

		$index = 0;
		$total_price = array();

		$compeleted_orders = 0;
		$pending_orders = 0;


		$result['orders'] = $orders->chunk(10);
		$result['pending_orders'] = $pending_orders;
		$result['compeleted_orders'] = $compeleted_orders;
		$result['total_orders'] = count($orders);

		$result['inprocess'] = count($orders)-$pending_orders-$compeleted_orders;
		//add to cart orders

		$result['cart'] = 0;

		//Rencently added products
		$recentProducts = DB::table('product')
			->leftJoin('product_description','product_description.product_id','=','product.product_id')
			->where('product_description.language_id','=', $language_id)
			->orderBy('product.product_id', 'DESC')
			->paginate(8);
		$result['recentProducts'] = $recentProducts;

		// //products
		$products = DB::table('product')
			->leftJoin('product_description','product_description.product_id','=','product.product_id')
			->where('product_description.language_id','=', $language_id)
			->orderBy('product.product_id', 'DESC')
			->get();

			Log::info('products : ' . json_encode($products) );
		// //low products & out of stock
		$lowLimit = 0;
		$outOfStock = 0;
		foreach($products as $products_data){
			if($products_data->low_limit >= 1 && $products_data->quantity >= $products_data->low_limit){
				$lowLimit++;
			}elseif($products_data->quantity == 0){
				$outOfStock++;
			}
		}

		$result['lowLimit'] = $lowLimit;
		$result['outOfStock'] = $outOfStock;
		$result['totalProducts'] = count($products);

		$result['recentCustomers'] = array();
		$result['totalCustomers'] = 0;
		$result['reportBase'] = $reportBase;

		//get function from other controller
		$myVar = new AdminSiteSettingController();
		$currency = $myVar->getSetting();
		$result['currency'] = $currency;

		return view("admin.dashboard",$title)->with('result', $result);
    }

	public function login(){
		if (Auth::check()) {
		  return redirect('/admin/dashboard/this_month');
		}else{
			$title = array('pageTitle' => Lang::get("labels.login_page_name"));
			return view("admin.login.login",$title);
		}
	}

	//logout
	public function logout(){
		Auth::guard('admin')->logout();
		return redirect()->intended('admin/login');
	}

	//login function
	public function checkLogin(Request $request){
		Log::info('[checkLogin] --  : ');

		$validator = Validator::make(
			array(
					'email'    => $request->email,
					'password' => $request->password
				), 
			array(
					'email'    => 'required | email',
					'password' => 'required',
				)
		);
		//check validation
		if($validator->fails()){
			return redirect('admin/login')->withErrors($validator)->withInput();
		}else{
			//check authentication of email and password
			$adminInfo = array("email" => $request->email, "password" => $request->password);
			Log::info('adminInfo : ' . json_encode($adminInfo));
			if(auth()->guard('admin')->attempt($adminInfo)) {
				$user_auth = auth()->guard('admin')->user();
				Log::info('user_auth : ' . json_encode($user_auth));
				$language_id = $user_auth->default_language;
				$user = $this->UserService->findByColumn_Value("user_id",$user_auth->user_id);
				session(['language_id' => $language_id]);
				Log::info('user : ' . json_encode($user));
				return redirect()->intended('admin/dashboard/this_month')->with('administrators', $user);
			}else{
				return redirect('admin/login')->with('loginError',Lang::get("labels.EmailPasswordIncorrectText"));
			}

		}
		
	}

	// forward_login
	public function forward_login($email,$password){
		$validator = Validator::make(
			array(
					'email'    => $email,
					'password' => $password
				), 
			array(
					'email'    => 'required | email',
					'password' => 'required',
				)
		);
		//check validation
		if($validator->fails()){
			return redirect('admin/login')->withErrors($validator)->withInput();
		}else{
			//check authentication of email and password
			$adminInfo = array("email" => $email, "password" => $password);
			Log::info('adminInfo : ' . json_encode($adminInfo));
			if(auth()->guard('admin')->attempt($adminInfo)) {
				$user_auth = auth()->guard('admin')->user();
				Log::info('user_auth : ' . json_encode($user_auth));
				// $language_id = $user_auth->default_language;
				$user = $this->UserService->findByColumn_Value("user_id",$user_auth->user_id);
				// session(['language_id' => $language_id]);
				Log::info('user : ' . json_encode($user));
				return redirect()->intended('admin/dashboard/this_month')->with('administrators', $user);
			}else{
				return redirect('admin/login')->with('loginError',Lang::get("labels.EmailPasswordIncorrectText"));
			}

		}
	}
}
