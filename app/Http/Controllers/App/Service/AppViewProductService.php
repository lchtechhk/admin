<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;

use App\Http\Controllers\App\Service\AppViewProductAttributeService;

class AppViewProductService extends AppBaseApiService{

    private $AppViewProductAttributeService;

    function __construct(){
        $this->setTable('view_product');
        $this->companyAuth = true;
		$this->AppViewProductAttributeService = new AppViewProductAttributeService();
    }

    function search($search){
        $key_product = array();
        $result_product = $this->findByArrayWithLanguage($search);
        $search_p_ids = array();
        foreach ($result_product as $index => $obj) {
            $product_id = $obj->product_id;
            $search_p_ids[] = $product_id;
            $obj->attribute = array();
            $key_product[$product_id] = $obj;
        }

        $result_attribute = $this->AppViewProductAttributeService->findByColumn_ValuesWithLanguage('product_attribute_id',$search_p_ids);

        foreach ($result_attribute as $attribute_index => $attribute_obj) {
            $a_product_id = $attribute_obj->product_id;
            if(isset($key_product[$a_product_id])){
                array_push($key_product[$a_product_id]->attribute,$attribute_obj);
            }
        }
        $result = array();
        foreach ($key_product as $key_id => $value) {
            $result[] = $value;
        }
        Log::info("result : " . json_encode($result));

        return $result;


    }
    
    function test(){
        return $this->findAll();
    }
}

?>