<?php
    namespace App\Http\Controllers\Admin\Dao;
    use DB;
    use Log;
    use Session;
    use App\Http\Controllers\Repository\MainRepository;

    abstract class AdminDao extends MainRepository{
        protected $table;
        protected $companyAuth = false;

        public function findAll(){
            DB::enableQueryLog();
            $result = DB::table($this->getTable());
            if($this->companyAuth) $result = $result->where('company_id',Session::get('default_company_id'));
            $result = $result->get();
            // Log::notice('[AdminDao] -- ' .'[SQL] - [findAll] --'.json_encode(DB::getQueryLog()));
            // Log::info('[AdminDao] -- ' .'['.$this->getTable().'] -- findAll : ' . json_encode($result));
            
            return $result;
        }
        public function findByArray($columns_values){
            DB::enableQueryLog();
            $result = DB::table($this->getTable());
            if($this->companyAuth) $result = $result->where('company_id',Session::get('default_company_id'));
            foreach($columns_values as $key =>$value){
                $result = $result->where($key,$value);
            }
            $result = $result->get();
            // Log::notice('[AdminDao] -- ' .'[SQL] - [findByArray] --'.json_encode(DB::getQueryLog()));
            // Log::info('[AdminDao] -- ' .'['.$this->getTable().'] -- findByArray : ' . json_encode($result));
            return $result;
        }
        public function findByColumn_Value($field,$id){
            DB::enableQueryLog();
            $result = DB::table($this->getTable())->where($field, $id);
            if($this->companyAuth)$result = $result->where('company_id',Session::get('default_company_id'));
            $result = $result->get();
            // Log::notice('[AdminDao] -- ' .'[SQL] - [findByColumn_Value] --'.json_encode(DB::getQueryLog()));
            // Log::info('[AdminDao] -- ' .'['.$this->getTable().'] -- findByColumn_Value : ' . json_encode($result));
            return $result;
        }
        public function findById($id){
            DB::enableQueryLog();
            $result = DB::table($this->getTable())->where('id', $id);
            if($this->companyAuth)$result = $result->where('company_id',Session::get('default_company_id'));
            $result = $result->get();
            // Log::notice('[AdminDao] -- ' .'[SQL] - [findById] --'.json_encode(DB::getQueryLog()));
            // Log::info('[AdminDao] -- ' .'['.$this->getTable().'] -- findById : ' . json_encode($result));
            return $result;
        }
        public function findByColumn_Values($column,$values){
            DB::enableQueryLog();
            $result = DB::table($this->getTable())->whereIn($column, $values);
            if($this->companyAuth)$result = $result->where('company_id',Session::get('default_company_id'));
            $result = $result->get();
            // Log::notice('[AdminDao] -- ' .'[SQL] - [findByColumn_Values] --'.json_encode(DB::getQueryLog()));
            // Log::info('[AdminDao] -- ' .'['.$this->getTable().'] -- findByColumn_Values : ' . json_encode($result));
            return $result;
        }
        // With Language
        public function findAllWithLanguage(){
            DB::enableQueryLog();
            $result = DB::table($this->getTable())->where('language_id',session('language_id'));
            if($this->companyAuth)$result = $result->where('company_id',Session::get('default_company_id'));
            $result = $result->get();
            // Log::notice('[AdminDao] -- ' .'[SQL] - [findAllWithLanguage] --'.json_encode(DB::getQueryLog()));
            // Log::info('[AdminDao] -- ' .'['.$this->getTable().'] -- findAllWithLanguage : ' . json_encode($result));
            return $result;
        }
        public function findByColumn_ValueWithLanguage($field,$id){
            DB::enableQueryLog();
            $result = DB::table($this->getTable())->where('language_id',session('language_id'))->where($field, $id);
            if($this->companyAuth)$result = $result->where('company_id',Session::get('default_company_id'));
            $result = $result->get();
            // Log::notice('[AdminDao] -- ' .'[SQL] - [findByColumn_ValueWithLanguage] --'.json_encode(DB::getQueryLog()));
            // Log::info('[AdminDao] -- ' .'['.$this->getTable().'] -- findByColumn_ValueWithLanguage : ' . json_encode($result));
            return $result;
        }
        public function findByColumn_ValuesWithLanguage($column,$values){
            DB::enableQueryLog();
            $result = DB::table($this->getTable())->where('language_id',session('language_id'))->whereIn($column, $values);
            if($this->companyAuth)$result = $result->where('company_id',Session::get('default_company_id'));
            $result = $result->get();
            // Log::notice('[AdminDao] -- ' .'[SQL] - [findByColumn_ValuesWithLanguage] --'.json_encode(DB::getQueryLog()));
            // Log::info('[AdminDao] -- ' .'['.$this->getTable().'] -- findByColumn_ValuesWithLanguage : ' . json_encode($result));
            return $result;
        }

        public function findByColumn_Values_Return_Array($column,$target_column,$id){
            DB::enableQueryLog();
            $result = DB::table($this->getTable())->where($column, $id);
            if($this->companyAuth)$result = $result->where('company_id',Session::get('default_company_id'));
            $result = $result->get();
            $id_array = array();
            foreach($result as $row){
                $id = $row->$target_column;
                $id_array[] = $id;
            }
            // Log::notice('[AdminDao] -- ' .'[SQL] - [findByColumn_Values_Return_Array] --'.json_encode(DB::getQueryLog()));
            // Log::info('[AdminDao] -- ' .'['.$this->getTable().'] -- findByColumn_Values_Return_Array : ' . json_encode($id_array));
            return $id_array;
        }

    }
?>
