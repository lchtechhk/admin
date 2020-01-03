<?php

namespace App\Http\Controllers\Admin\Controller;
use App\Http\Controllers\Controller;
use App;
use Lang;
use Log;
use DB;
// use Hash;
use Auth;
use Session;
use Illuminate\Http\Request;
use PDF;
use Storage;
class TestController extends Controller{

	function __construct(){
        
    }

    function pdf(){
      $data = [
          'title' => 'First PDF for Medium',
          'image' => 'http://localhost/admin/storage/company/logo/logo.png',
          'content' => '昨'
      ];
      $pdf = PDF::loadView('pdf', $data);
      $file_name = "test";
      Storage::disk('pdf')->put($file_name.'.pdf', $pdf->output());
      return $pdf->stream();
      // return response()->download('storage/pdf/'.$file_name.'.pdf');
    }

    function characet($data){
        if( !empty($data) ){
          $fileType = mb_detect_encoding($data , array('UTF-8','GBK','LATIN1','BIG5')) ;
          if( $fileType != 'UTF-8'){
            $data = mb_convert_encoding($data ,'utf-8' , $fileType);
          }
        }
        return $data;
      }
}
