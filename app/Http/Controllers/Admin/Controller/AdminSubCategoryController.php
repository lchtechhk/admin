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

use App\Http\Controllers\Admin\Service\SubCategoryService;

class AdminSubCategoryController extends Controller{
    private $SubCategoryService;
    
    public function __construct(){
		$this->SubCategoryService = new SubCategoryService();
    }
    
    function listingSubCategory(Request $request){
        $title = array('pageTitle' => Lang::get("labels.listSubCategory"));
        $result = array();
		$result['operation'] = 'listing';
		return $this->SubCategoryService->redirect_view($result,$title);
    }

    function view_addSubCategory(Request $request){
        $title = array('pageTitle' => Lang::get("labels.view_addSubCategory"));
        $result = array();
        $result = $request->input();
		$result['request'] = $request;
		$result['operation'] = 'view_add';
		return $this->SubCategoryService->redirect_view($result,$title);
    }

    function view_editSubCategory(Request $request){
        $title = array('pageTitle' => Lang::get("labels.view_editSubCategory"));
        $result = array();
        $result = $request->input();
        $result['request'] = $request;
        $result['sub_category_id'] = $request->sub_category_id;
		$result['operation'] = 'view_edit';
		return $this->SubCategoryService->redirect_view($result,$title);
    }

    function addSubCategory(Request $request){
        $title = array('pageTitle' => Lang::get("labels.addSubCategory"));
        $result = array();
        $result = $request->input();
		$result['request'] = $request;
		$result['operation'] = 'add';
        return $this->SubCategoryService->redirect_view($result,$title);    
    }

    function updateSubCategory(Request $request){
        $title = array('pageTitle' => Lang::get("labels.updateCategory"));
        $result = array();
        $result = $request->input();
		$result['request'] = $request;
		$result['operation'] = 'edit';
        return $this->SubCategoryService->redirect_view($result,$title);   
    }

    function deleteSubCategory(Request $request){
        $title = array('pageTitle' => Lang::get("labels.deleteSubCategory"));
        $result = array();
        $result = $request->input();
		$result['request'] = $request;
		$result['operation'] = 'delete';
        return $this->SubCategoryService->redirect_view($result,$title);   
    }
}
