@include('generic/view_function')
<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="addressLabel">{{ trans('labels.AddAddress') }}</h4>
        </div>

        <div class="box-body">
            @if ($result['operation'] == 'listing' || $result['operation'] == 'add' || $result['operation'] == 'view_add' )
            {!! Form::open(array('url' => array('admin/addAddressBook/'.$result['customer_id']), 'name'=>'addAddressFrom',
            'id'=>'addAddressFrom', 'method'=>'post', 'class' => 'form-horizontal', 'enctype'=>'multipart/form-data')) !!}
            @elseif ($result['operation'] == 'edit' || $result['operation'] == 'view_edit')
            {!! Form::open(array('url' => array('admin/updateAddressBook/'.$result['id']), 'name'=>'editAddressFrom',
            'id'=>'editAddressFrom', 'method'=>'post', 'class' => 'form-horizontal', 'enctype'=>'multipart/form-data')) !!}
            @endif

            {!! Form::hidden('customer_id', empty($result['customer_id']) ? '' : $result['customer_id'] , array('class'=>'form-control', 'id'=>'customer_id')) !!}
            <div class="modal-body">
                <div class="form-group">
                    <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Company') }}</label>
                    <div class="col-sm-10 col-md-8">
                        {!! Form::text('company',
                        print_value(isset($_POST['company']) ? $_POST['company'] : !empty($result['address']->company) ? $result['address']->company : '' ),
                        array('class'=>'form-control', 'id'=>'company')) !!}
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.FirstName') }}</label>
                    <div class="col-sm-10 col-md-8">
                        {!! Form::text('firstname',
                        print_value(isset($_POST['firstname']) ? $_POST['firstname'] : !empty($result['address']->firstname) ? $result['address']->firstname : '' ),
                        array('class'=>'form-control field-validate', 'id'=>'firstname')) !!}
                    </div>
                </div>

                <div class="form-group">    
                    <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.LastName') }}</label>
                    <div class="col-sm-10 col-md-8">
                        {!! Form::text('lastname', 
                        print_value(isset($_POST['lastname']) ? $_POST['lastname'] : !empty($result['address']->lastname) ? $result['address']->lastname : '' ),
                        array('class'=>'form-control',
                        'id'=>'lastname')) !!}
                    </div>
                </div>

                <div class="form-group">
                    <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.District') }}</label>
                    <div class="col-sm-10 col-md-8">
                        <select id="district_id" class="form-control" name="district_id">
                            <option value="">{{ trans('labels.SelectDistrict') }}</option>
                            @foreach($result['districts'] as $district)
                            <option value="{{ $district->district_id }}"
                                {{print_selected_value('active', isset($_POST['district_id']) ? $_POST['district_id'] : !empty($result['address']->district_id) ? $result['address']->district_id : '')}}>
                                {{ $district->district_name }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Estate') }}</label>
                    <div class="col-sm-10 col-md-8">
                        {!! Form::text('estate', 
                        print_value(isset($_POST['estate']) ? $_POST['estate'] : !empty($result['address']->estate) ? $result['address']->estate : '' ),
                        array('class'=>'form-control',
                        'id'=>'estate')) !!}
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Building') }}</label>
                    <div class="col-sm-10 col-md-8">
                        {!! Form::text('building', 
                        print_value(isset($_POST['building']) ? $_POST['building'] : !empty($result['address']->building) ? $result['address']->building : '' ),
                            array('class'=>'form-control',
                        'id'=>'building')) !!}
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Room') }}</label>
                    <div class="col-sm-10 col-md-8">
                        {!! Form::text('room', 
                        print_value(isset($_POST['room']) ? $_POST['room'] : !empty($result['address']->room) ? $result['address']->room : '' ),
                        array('class'=>'form-control',
                        'id'=>'room')) !!}
                    </div>
                </div>

            </div>

            @include('layouts/dialog_submit_back_button')
            {!! Form::close() !!}
        </div>
    </div>
</div>
