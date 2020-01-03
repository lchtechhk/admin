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
            'content' => 'Hello from 99Points.info'
        ];
        $pdf = App::make('dompdf.wrapper');
        $pdf = PDF::loadView('pdf', $data);
        Storage::disk('pdf')->put('1.pdf', $pdf->output());
        // return $pdf->download('invoice.pdf');
        return $pdf->stream();

    }
}
