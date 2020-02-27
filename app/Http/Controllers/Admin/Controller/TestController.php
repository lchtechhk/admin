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
          'company_logo' => 'http://localhost/admin/storage/company/logo/logo.png',
          'header' => "Rainbow Equipment Ltd.<br>Unit 706, Asia Trade Centre<br>76 Lei Muk Road, Kwai Chung, NT, HK, <br>Tel : (+852) 3524-7324 / 9101-4561<br>Fax : (+852) 3168-9717<br>Email : REL@Rainbow-Equipment.com<br>"

      ];
      $file_name = "hello";
      // snappy
      $pdf = PDF::loadView('pdf.content', $data);
      $pdf->setOption('header-html',view('pdf.header'));
      Storage::disk('pdf')->put($file_name.'.pdf', $pdf->output());
      return $pdf->stream($file_name.".pdf");
      // return $pdf->download();
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
