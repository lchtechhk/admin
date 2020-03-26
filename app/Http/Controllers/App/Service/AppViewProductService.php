<?php
namespace App\Http\Controllers\App\Service;
use Log;
use DB;
use Lang;
use Exception;

use App\Http\Controllers\App\Service\AppViewProductAttributeService;
use App\Http\Controllers\App\Service\AppProductImageService;

class AppViewProductService extends AppBaseApiService{

    private $AppViewProductAttributeService;
    private $AppProductImageService;

    function __construct(){
        $this->setTable('view_product');
        $this->companyAuth = true;
        $this->AppViewProductAttributeService = new AppViewProductAttributeService();
        $this->AppProductImageService = new AppProductImageService();

    }

    function search($search){
        $key_product = array();
        $result_product = $this->findByArrayWithLanguage($search);
        $search_p_ids = array();
        foreach ($result_product as $index => $obj) {
            $product_id = $obj->product_id;
            $search_p_ids[] = $product_id;
            $obj->attribute = array();
            $obj->images = array();
            $key_product[$product_id] = $obj;
        }

        $result_attribute = $this->AppViewProductAttributeService->findByColumn_ValuesWithLanguage('product_id',$search_p_ids);

        $result_image = $this->AppProductImageService->findByColumn_Values('product_id',$search_p_ids);


        foreach ($result_attribute as $attribute_index => $attribute_obj) {
            $a_product_id = $attribute_obj->product_id;
            if(isset($key_product[$a_product_id])){
                $original_image = $key_product[$a_product_id]->image;
                $attribute_obj->original_image = $original_image;
                array_push($key_product[$a_product_id]->attribute,$attribute_obj);
            }
        }
        foreach ($result_image as $image_index => $image_obj) {
            $i_product_id_id = $image_obj->product_id;
            if(isset($key_product[$i_product_id_id])){
                array_push($key_product[$i_product_id_id]->images,$image_obj);
            }
        }
        $result = array();
        foreach ($key_product as $key_id => $value) {
            $result[] = $value;
        }
        // Log::info("search : " . json_encode($result));

        return $result;


    }
    
    function findByProductId($search){
        $result_product = $this->findByArrayWithLanguage($search);
        if(!empty($result_product) && \sizeof($result_product) > 0){
            $result_product = $result_product[0];
            $result_attribute = $this->AppViewProductAttributeService->findByColumn_ValueWithLanguage('product_id',$search['product_id']);
            $result_image = $this->AppProductImageService->findByColumn_Value('product_id',$search['product_id']);
    
            $result_product->attribute = $result_attribute;
            $result_product->images = $result_image;
            // Log::info("result_product : " . json_encode($result_product));
            return $result_product;
        }
        return null;
    }
    function test(){
        return $this->findAll();
    }
}

?>