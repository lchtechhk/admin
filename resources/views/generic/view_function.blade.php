<?php 
    function testing(){
        error_log("testing function");
        return "testing";
    }

    function print_value($value){
        return $value;

    }

    function print_radio_value($display_choice,$post_value){
        $value = '';
        if($display_choice == $post_value)$value .= "checked";
        return $value;
    }

    function print_selected_value($display_choice,$post_value){
        $value = '';
        if($display_choice == $post_value)$value .= "selected";
        return $value;
    }

    function print_checkbox($display_choice,$post_value){
        $value = '';
        if($display_choice == $post_value)$value .= "checked";
        return $value;
    }

    function is_readonly($operation,$value){
        $value = '';
        if( ($operation == 'edit' || $operation == 'view_edit' || $operation == 'listing' || $operation == 'changeable') && !empty($value)){
            $value .= "readonly";
        }
        return $value;
    }

    function is_disabled($operation,$data){
        $value = '';
        if( ($operation == 'edit' || $operation == 'view_edit' || $operation == 'listing' || $operation == 'changeable') && !empty($data)){
            $value .= "disabled";
        }
        return $value;
    }

    // function print_value($operation,$data){
    //     $value = '';
    //     if($operation == 'edit' || $operation == 'view_edit' || $operation == 'listing' || $operation == 'changeable'){
    //         $value .= $data;
    //     }
    //     return $value;
    // }

    // function print_radio_value($operation,$data,$selected_value){
    //     $value = '';
    //     if( ($operation == 'edit' || $operation == 'view_edit' || $operation == 'listing' || $operation == 'changeable') && !empty($data) && !empty($selected_value) && $data == $selected_value){
    //         $value .= "checked";
    //     }
    //     return $value;
    // }

    // function print_selected_value($operation,$display_value,$add_value,$post_value){
    //     $value = '';
    //     if( ($operation == 'edit' || $operation == 'view_edit' || $operation == 'listing' || $operation == 'changeable') && !empty($display_value) && !empty($add_value) && $display_value == $add_value){
    //         $value .= "selected";
    //     }
    //     return $value;
    // }

?>