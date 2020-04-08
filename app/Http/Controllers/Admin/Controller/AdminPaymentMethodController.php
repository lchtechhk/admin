<?php
namespace App\Http\Controllers\Admin\Controller;
use App\Http\Controllers\Controller;

//validator is builtin class in laravel
use Validator;
use App;
use Lang;
use DB;
//for password encryption or hash protected
use Hash;
use App\Administrator;

//for authenitcate login data
use Log;
use Auth;

//for requesting a value 
use Illuminate\Http\Request;

use App\Http\Controllers\Admin\Service\PaymentMethodService;

class AdminPaymentMethodController extends Controller{
    private $PaymentMethodService;
    
	public function __construct(){
		$this->PaymentMethodService = new PaymentMethodService();

	}
    
	function listingPaymentMethod(Request $request){
        $title = array('pageTitle' => Lang::get("labels.ListPaymentMethod"));
        $result = array();
		$result['operation'] = 'listing';
		return $this->PaymentMethodService->redirect_view($result,$title);
    }

    function view_addPaymentMethod(Request $request){
        $title = array('pageTitle' => Lang::get("labels.view_addPaymentMethod"));
        $result = array();
		$result['request'] = $request;
        $result['operation'] = 'view_add';
		return $this->PaymentMethodService->redirect_view($result,$title);
    }

    function view_editPaymentMethod(Request $request){
        $title = array('pageTitle' => Lang::get("labels.view_editPaymentMethod"));
        $result = array();
        $result['request'] = $request;
        $result['operation'] = 'view_edit';
        $result['payment_method_id'] = $request->payment_method_id;
		return $this->PaymentMethodService->redirect_view($result,$title);
    }

    function addPaymentMethod(Request $request){
        $title = array('pageTitle' => Lang::get("labels.addPaymentMethod"));
        $result = array();
        $result = $request->input();
        $result['request'] = $request;
        $result['operation'] = 'add';
        // Log::info('[result] --  : ' . json_encode($result));
        return $this->PaymentMethodService->redirect_view($result,$title);
    }

    function updatePaymentMethod(Request $request){
        $title = array('pageTitle' => Lang::get("labels.updatePaymentMethod"));
        $result = array();
        $result = $request->input();
        $result['request'] = $request;
        $result['operation'] = 'edit';
        return $this->PaymentMethodService->redirect_view($result,$title);
    }

    function deletePaymentMethod(Request $request){
        $title = array('pageTitle' => Lang::get("labels.deletePaymentMethod"));
        $result = array();
        $result = $request->input();
        $result['request'] = $request;
        $result['operation'] = 'delete';
        return $this->PaymentMethodService->redirect_view($result,$title);
	}
}
