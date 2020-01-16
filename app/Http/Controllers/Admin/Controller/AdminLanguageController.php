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


use App\Http\Controllers\Admin\Service\LanguageService;

class AdminLanguageController extends Controller{
    private $LanguageService;

	public function __construct(){
		$this->LanguageService = new LanguageService();
	
	}
	
	function listingLanguage(Request $request){
        $title = array('pageTitle' => Lang::get("labels.listingLanguage"));
        $result = array();
		$result['operation'] = 'listing';
		return $this->LanguageService->redirect_view($result,$title);
    }

    function defaultLanguage(Request $request){
        $title = array('pageTitle' => Lang::get("labels.defaultLanguage"));
        $result = array();
        $result['operation'] = 'defaultLanguage';
        $result['request'] = $request;
		$result['language_id'] = $request->language_id;
		return $this->LanguageService->redirect_view($result,$title);
    }

    function view_addLanguage(Request $request){
        $title = array('pageTitle' => Lang::get("labels.view_addLanguage"));
        $result = array();
		$result['request'] = $request;
        $result['operation'] = 'view_add';
		return $this->LanguageService->redirect_view($result,$title);
    }

    function view_editLanguage(Request $request){
        $title = array('pageTitle' => Lang::get("labels.view_editLanguage"));
        $result = array();
		$result['request'] = $request;
		$result['language_id'] = $request->language_id;
        $result['operation'] = 'view_edit';
		return $this->LanguageService->redirect_view($result,$title);
    }

    function addLanguage(Request $request){
        $title = array('pageTitle' => Lang::get("labels.addLanguage"));
        $result = array();
        $result = $request->input();
        $result['request'] = $request;
        $result['operation'] = 'add';
        // Log::info('[result] --  : ' . json_encode($result));
        return $this->LanguageService->redirect_view($result,$title);
    }

    function updateLanguage(Request $request){
        $title = array('pageTitle' => Lang::get("labels.updateLanguage"));
        $result = array();
        $result = $request->input();
        $result['request'] = $request;
        $result['operation'] = 'edit';
        return $this->LanguageService->redirect_view($result,$title);
    }

    function deleteLanguage(Request $request){
        $title = array('pageTitle' => Lang::get("labels.deleteLanguage"));
        $result = array();
        $result = $request->input();
        $result['request'] = $request;
        $result['operation'] = 'delete';
        return $this->LanguageService->redirect_view($result,$title);
	}
}
