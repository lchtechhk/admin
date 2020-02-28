<?php
namespace App\Http\Controllers\Admin\Service;
use Log;
use DB;
use Lang;
use Exception;
use Session;
use Hash;

use App\Http\Controllers\Admin\Service\View_CustomerService;
use App\Http\Controllers\Admin\Service\AddressBookService;
use App\Http\Controllers\Admin\Service\UploadService;

class CustomerService extends BaseApiService{
    private $View_CustomerService;
    private $AddressBookService;
	private $UploadService;

    function __construct(){
        $this->setTable('customer');
        $this->companyAuth = true;
        $this->View_CustomerService = new View_CustomerService();
        $this->AddressBookService = new AddressBookService();
		$this->UploadService = new UploadService();

    }
    function getListing(){
        return $this->View_CustomerService->getListingWithOutStatus();
    }

    function redirect_view($result,$title){
        $result['label'] = "Customer";
        switch($result['operation']){
            case 'listing':
                $result['customers'] = $this->getListing();
                Log::info('[Customer] -- getListing : ' .json_encode($result['customers'][0]));
                return view("admin.customer.listingCustomer", $title)->with('result', $result);
            break;
            case 'view_add':
                return view("admin.customer.viewCustomer", $title)->with('result', $result);
            break;
            case 'view_edit':
                $customers = $this->findById($result['request']->id);
                $result['customer'] = !empty($customers) && \sizeof($customers)>0? $customers[0] : array();
                return view("admin.customer.viewCustomer", $title)->with('result', $result);	
            break;
            case 'add':
                $email = $result['email'];
                $own_email_count = $this->View_CustomerService->getCountByEmail($email);
                if($own_email_count > 0 ){
                    $result['status'] = 'fail';
                    $result['message'] =  'Update Error, The Email Is Duplicate In DB';
                    return view("admin.customer.viewCustomer", $title)->with('result', $result);
                }        
                $result['picture'] = $this->UploadService->upload_image($result['request'],'image','storage/company/'.Session::get('default_company_id').'/customer/images/');
                $result['default_language_id'] = Session::get('language_id');
                $result['password'] = Hash::make($result['password_str']);
                $add_customer_result = $this->add($result);
                $customers = $this->findById($add_customer_result['response_id']);
                $result['customer'] = !empty($customers) && \sizeof($customers)>0? $customers[0] : array();
                $result = $this->response($result,"Success To Add Customer","view_edit");
                return view("admin.customer.viewCustomer", $title)->with('result', $result);
            break;
            case 'edit':
                $email = $result['email'];
                $id = $result['id'];
                $own_email_count = $this->View_CustomerService->getCountByEmailAndId($email,$id);
                $duplicate_email_count = $this->getCountForEmailExisting($email);
                if($own_email_count > 1 ){
                    unset($result['email']);
                }else if($own_email_count == 0 && $duplicate_email_count > 0){
                    $result['operation'] = 'edit';
                    $result['status'] = 'fail';
                    $result['message'] =  'Update Error, The Email Is Duplicate In DB';
                    $result['customer'] = !empty($customers) && \sizeof($customers)>0? $customers[0] : array();
                    return view("admin.customer.viewCustomer", $title)->with('result', $result);
                }
                $result['picture'] = $this->UploadService->upload_image($result['request'],'image','storage/company/'.Session::get('default_company_id').'/customer/images/');
                if(empty($result['password_str'])){
                    unset($result['password_str']);
                }else {
                    $result['password'] = Hash::make($result['password_str']);
                }
                $update_customer_result = $this->update('id',$result);
                if(empty($update_customer_result['status']) || $update_customer_result['status'] == 'fail')throw new Exception("Error To Update Customer");
                $customers = $this->findById($result['request']->id);
                $result['customer'] = !empty($customers) && \sizeof($customers)>0? $customers[0] : array();
                $result = $this->response($result,"Success To Update Customer","view_edit");
                return view("admin.customer.viewCustomer", $title)->with('result', $result);		
            break;
            case 'delete':
                try{
                    $delete_customer_result = $this->deleteByKey_Value("id",$result['id']);
                    if(empty($delete_customer_result['status']) || $delete_customer_result['status'] == 'fail')throw new Exception("Error To Update Customer");
                    $delete_address_book_result = $this->AddressBookService->deleteByKey_Value("customer_id",$result['id']);
                    if(empty($delete_address_book_result['status']) || $delete_address_book_result['status'] == 'fail')throw new Exception("Error To Update Customer");
                    $result['customers'] = $this->getListing();
                    $result = $this->response($result,"Success To Delete Customer","view_edit");
                }catch(Exception $e){
                    $result = $this->throwException($result,$e->getMessage(),true);
                }
                return view("admin.customer.listingCustomer", $title)->with('result', $result);
            break;
        }
    }
}

?>