<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;


class AppViewProductAttributeService extends AppBaseApiService{

    function __construct(){
        $this->setTable('view_product_attribute');
        $this->companyAuth = true;
    }

    function findByAttIds($param){
        $result_product = $this->findByArrayWithLanguage($param);
        if(!empty($result_product) && \sizeof($result_product) > 0){
            return $result_product;
        }
        return array();
    }

    function getProductByAttIds_key($param){
        $result = array();
        $result_product = $this->findByArrayWithLanguage($param);
        if(!empty($result_product) && \sizeof($result_product) > 0){
            foreach ($result_product as $index => $obj) {
               $product_attribute_id = $obj->product_attribute_id;
               $result[$product_attribute_id] = $obj;
            }
        }
        return $result;
    }
    // function getProductByAttributeId($product_attribute_id){
    //     $product_attribute_array = $this->findByColumn_Value("product_attribute_id",$product_attribute_id);
    //     $product_attribute = !empty($product_attribute_array) && sizeof($product_attribute_array) > 0 ? $product_attribute_array[0] : array();
    //     $product_attribute->language_array = array();
    //     foreach ($product_attribute_array as $obj) {
    //         $language_id = $obj->language_id;
    //         $product_name = $obj->product_name;
    //         $product_attribute_name = $obj->product_attribute_name;
    //         $product_description = $obj->product_description;
    //         $product_attribute->language_array[$language_id] = array();
    //         $product_attribute->language_array[$language_id]['product_name'] = $product_name;
    //         $product_attribute->language_array[$language_id]['product_attribute_name'] = $product_attribute_name;
    //         $product_attribute->language_array[$language_id]['product_description'] = $product_description;

    //     }
    //     return $product_attribute;
    // }
    
    function test(){
        return $this->findAll();
    }
}

?>