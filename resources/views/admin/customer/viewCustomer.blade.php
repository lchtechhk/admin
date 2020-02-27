@extends('admin.common.layout')
@section('content')
@include('generic/view_function')
<div class="content-wrapper">
  @include('layouts/edit_header')
  <section class="content">
    <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title">{{ trans('labels.Edit'.$result['label']) }}</h3>
          </div>
          <div class="box-body">
            <div class="row">
              <div class="col-xs-12">
                <div class="box box-info"><br>
                  @include('layouts/responseMessage')
                  <div class="box-body">
                    @if ($result['operation'] == 'listing' || $result['operation'] == 'add' || $result['operation'] == 'view_add' )
                        {!! Form::open(array('url' =>'admin/addCustomer', 'method'=>'post', 'class' => 'form-horizontal form-validate', 'enctype'=>'multipart/form-data')) !!} 
                    @elseif ($result['operation'] == 'edit' || $result['operation'] == 'view_edit')
                        {!! Form::open(array('url' =>'admin/updateCustomer', 'method'=>'post', 'class' => 'form-horizontal
                        form-validate', 'enctype'=>'multipart/form-data')) !!}
                    @endif
                    {!! Form::hidden('id', empty($result['customer']->id) ? '' : $result['customer']->id, array('class'=>'form-control', 'id'=>'id')) !!}
                    <div class="form-group">
                      <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.FirstName') }}
                        <span style="color:red">★</span>
                      </label>
                      <div class="col-sm-10 col-md-4">
                        {!! Form::text('firstname', 
                        print_value(isset($_POST['firstname']) ? $_POST['firstname'] : !empty($result['customer']->firstname) ? $result['customer']->firstname : '' ),
                        array('class'=>'form-control field-validate', 'id'=>'firstname')) !!}
                        <span class="help-block"
                          style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.FirstNameText') }}</span>
                        <span class="help-block hidden">{{ trans('labels.textRequiredFieldMessage') }}</span>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.LastName') }}
                        <span style="color:red">★</span>
                      </label>
                      <div class="col-sm-10 col-md-4">
                        {!! Form::text('lastname', 
                        print_value(isset($_POST['lastname']) ? $_POST['lastname'] : !empty($result['customer']->lastname) ? $result['customer']->lastname : '' ),
                        array('class'=>'form-control field-validate', 'id'=>'lastname')) !!}
                        <span class="help-block"
                          style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.lastNameText') }}</span>
                        <span class="help-block hidden">{{ trans('labels.textRequiredFieldMessage') }}</span>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Gender') }}</label>
                      <div class="col-sm-10 col-md-4">
                        <label>
                            <input type="radio" name="gender" value="M" class="minimal" 
                            {{print_radio_value("M",isset($_POST['gender']) ? $_POST['gender'] : !empty($result['customer']->gender) ? $result['customer']->gender : '')}}>
                            {{ trans('labels.Male') }}
                        </label>
                        <br>
                        <label>
                          <input type="radio" name="gender" value="F" class="minimal"
                          {{print_radio_value("F", isset($_POST['gender']) ? $_POST['gender'] : !empty($result['customer']->gender) ? $result['customer']->gender : '')}}>
                          {{ trans('labels.Female') }}
                        </label>
                      </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Image') }} </label>
                        <div class="col-sm-10 col-md-4">
                            {!! Form::file('image', array('id'=>'image')) !!}<span class="help-block"
                            style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                            {{ trans('labels.PictureText') }}</span>
                            <br>
                            @if(!empty($result['customer']->picture))
                                <img width="150px" src="{{asset('').'/'.$result['customer']->picture}}" class="img-circle">
                            @else
                                <img width="150px" src="{{asset('').'storage/default_images/user.png' }}" class="img-circle">
                            @endif
                        </div>
                    </div>

                    <div class="form-group">
                      <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.DOB') }}</label>
                      <div class="col-sm-10 col-md-4">
                        {!! Form::text('dob',
                        print_value(isset($_POST['dob']) ? $_POST['dob'] : !empty($result['customer']->dob) ? $result['customer']->dob : '' ),
                        array('class'=>'form-control datepicker' , 'id'=>'dob')) !!}
                        <span class="help-block"
                          style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.DOBText') }}</span>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Telephone') }}</label>
                      <div class="col-sm-10 col-md-4">
                        {!! Form::text('telephone', 
                        print_value(isset($_POST['telephone']) ? $_POST['telephone'] : !empty($result['customer']->telephone) ? $result['customer']->telephone : '' ),
                        array('class'=>'form-control field-validate', 'id'=>'telephone')) !!}
                        <span class="help-block"
                          style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.TelephoneText') }}</span>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Fax') }}</label>
                      <div class="col-sm-10 col-md-4">
                        {!! Form::text('fax', 
                        print_value(isset($_POST['fax']) ? $_POST['fax'] : !empty($result['customer']->fax) ? $result['customer']->fax : '' ),
                        array('class'=>'form-control', 'id'=>'fax')) !!}
                        <span class="help-block"
                          style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.FaxText') }}</span>
                      </div>
                    </div>
                    <hr>
                    <div class="form-group">
                      <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.EmailAddress') }}
                        <span style="color:red">★</span>
                      </label>
                      <div class="col-sm-10 col-md-4">
                        {!! Form::email('email', 
                        print_value(isset($_POST['email']) ? $_POST['email'] : !empty($result['customer']->email) ? $result['customer']->email : '' ),
                        array('class'=>'form-control
                        email-validate', 'id'=>'email')) !!}
                        <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                          {{ trans('labels.EmailText') }}</span>
                        <span class="help-block hidden"> {{ trans('labels.EmailError') }}</span>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Password') }}
                        <span style="color:red">★</span>
                      </label>
                      <div class="col-sm-10 col-md-4">
                        {!! Form::password('password_str', array('class'=>'form-control ', 'id'=>'password_str')) !!}
                        <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                          {{ trans('labels.PasswordText') }}
                        </span>
                        <span class="help-block hidden">{{ trans('labels.textRequiredFieldMessage') }}</span>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Status') }}
                        <span style="color:red">★</span>
                      </label>
                      <div class="col-sm-10 col-md-4">
                        <select class="form-control" name="status">
                          <option value="active"
                            {{print_selected_value('active', isset($_POST['status']) ? $_POST['status'] : !empty($result['customer']->status) ? $result['customer']->status : '')}}>
                            {{ trans('labels.Active') }}</option>
                          <option value="inactive"
                            {{print_selected_value('inactive', isset($_POST['status']) ? $_POST['status'] : !empty($result['customer']->status) ? $result['customer']->status : '')}}>
                            {{ trans('labels.Inactive') }}</option>
                        </select>
                        <span class="help-block"
                          style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.StatusText') }}</span>
                      </div>
                    </div>
                    @include('layouts/submit_back_button')
                    {!! Form::close() !!}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
  </section>
</div>
@endsection