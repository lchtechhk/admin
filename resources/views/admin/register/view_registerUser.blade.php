@extends('admin.login.layout_login')
@section('content')
@include('generic/view_function')
<style>
    .wrapper {
        display: none !important;
    }
</style>
{{json_encode($result)}}
<div style="margin: 2% 7% 7% 7%;">
    <!-- /.login-logo -->
    <div class="login-box-body">
        <div class="form-group has-feedback">
            @include('layouts/responseMessage')
            <div class="box-body">
                {!! Form::open(array('url' =>'admin/add_registerUser', 'method'=>'post', 'class' =>
                    'form-horizontal form-validate', 'enctype'=>'multipart/form-data')) !!}
                    <h3 class="box-title">{{ trans('labels.User Information') }}</h3>
                    <hr>
                    {{-- Content --}}
                    <div class="form-group">
                        <label for="name"
                            class="col-sm-2 col-md-3 control-label">{{ trans('labels.FirstName') }}
                            <span style="color:red">★</span>
                        </label>
                        <div class="col-sm-10 col-md-4">
                            {!! Form::text('first_name',!empty($result['first_name']) ? $result['first_name'] : '', array('class'=>'form-control field-validate', 'id'=>'first_name')) !!}
                            <span class="help-block"
                                style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.FirstNameText') }}</span>
                            <span
                                class="help-block hidden">{{ trans('labels.textRequiredFieldMessage') }}</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name"
                            class="col-sm-2 col-md-3 control-label">{{ trans('labels.LastName') }}
                            <span style="color:red">★</span>
                        </label>
                        <div class="col-sm-10 col-md-4">
                            {!! Form::text('last_name', !empty($result['last_name']) ? $result['last_name'] : '',array('class'=>'form-control field-validate', 'id'=>'last_name')) !!}
                            <span class="help-block"
                                style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.lastNameText') }}</span>
                            <span
                                class="help-block hidden">{{ trans('labels.textRequiredFieldMessage') }}</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Gender') }}</label>
                        <div class="col-sm-10 col-md-4">
                            <label>
                                <input type="radio" name="gender" value="M" class="minimal"
                                @if(!empty($result['gender']))
                                {{print_radio_value('listing',"M",$result['gender'])}}
                                @endif>
                                {{ trans('labels.Female') }}
                            </label>
                            <br>
                            <label>
                                <input type="radio" name="gender" value="F" class="minimal"
                                @if(!empty($result['gender']))
                                {{print_radio_value('listing',"F",$result['gender'])}}
                                @endif>
                                {{ trans('labels.Male') }}
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Picture') }}</label>
                        <div class="col-sm-10 col-md-4">
                            {!! Form::file('user_image', array('id'=>'user_image')) !!}
                            <span class="help-block"
                                style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.UploadProductImageText') }}</span>
                            <br>
                            @if(!empty($result['user_image']))
                                {!! Form::hidden('user_oldImage', empty($result['user_image']) ? '' : print_value($result['operation'],$result['user_image']) , array('id'=>'user_oldImage',
                                'class'=>' ')) !!}
                                <img src="{{asset('').$result['user_image']}}" alt="" width=" 100px">
                            @else
                                <img src="../resources/assets/images/default_images/product.png"
                                style="width: 50px; float: left; margin-right: 10px">
                            @endif
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.DOB') }}</label>
                        <div class="col-sm-10 col-md-4">
                            {!! Form::text('dob', !empty($result['dob']) ? $result['dob'] : '', array('class'=>'form-control datepicker' , 'id'=>'dob')) !!}
                            <span class="help-block"
                                style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.DOBText') }}</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Telephone') }}</label>
                        <div class="col-sm-10 col-md-4">
                            {!! Form::text('phone', !empty($result['phone']) ? $result['phone'] : '', array('class'=>'form-control', 'id'=>'phone')) !!}
                            <span class="help-block"
                                style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.TelephoneText') }}</span>
                        </div>
                    </div>
                    <hr>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.EmailAddress') }}
                            <span style="color:red">★</span>
                        </label>
                        <div class="col-sm-10 col-md-4">
                            {!! Form::email('email', !empty($result['email']) ? $result['email'] : '', array('class'=>'form-control
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
                            {!! Form::text('password_str',!empty($result['password_str']) ? $result['password_str'] : '',array('class'=>'form-control ', 'id'=>'password_str')) !!}
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
                                <option value="active" selected>{{ trans('labels.Active') }}</option>              
                            </select>
                            <span class="help-block"
                                style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.StatusText') }}</span>
                        </div>
                    </div>
                    <h3 class="box-title">{{ trans('labels.Company Information') }}</h3>
                    <hr>
                   
                    @foreach($result['languages'] as $language)
                        <div class="form-group">
                            <label for="name" class="col-sm-2 col-md-3 control-label">
                                {{ trans('labels.Name') }}
                                ({{ $language->name}})
                                <span style="color:red">★</span>
                            </label>
                            <div class="col-sm-10 col-md-4">
                                {!! Form::text("language_array[".$language->language_id."]",!empty($result['language_array'][$language->language_id]) ? $result['language_array'][$language->language_id] : '', array('class'=>'form-control
                                field-validate', 'id'=>'name')) !!}
                                <span class="help-block"
                                    style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.companyName') }}({{ $language->name}})</span>
                                <span
                                    class="help-block hidden">{{ trans('labels.textRequiredFieldMessage') }}</span>
                            </div>
                        </div>
                    @endforeach

                    <div class="form-group">
                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.EmailAddress') }}
                            <span style="color:red">★</span>
                        </label>
                        <div class="col-sm-10 col-md-4">
                            {!! Form::email('company_email', !empty($result['company_email']) ? $result['company_email'] : '', array('class'=>'form-control
                            email-validate', 'id'=>'company_email')) !!}
                            <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                                {{ trans('labels.EmailText') }}</span>
                            <span class="help-block hidden"> {{ trans('labels.EmailError') }}</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Picture') }}</label>
                        <div class="col-sm-10 col-md-4">
                            {!! Form::file('company_image', array('id'=>'company_image')) !!}
                            <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.PictureText') }}</span>
                            <br>
                            @if(!empty($result['user_image']))
                                {!! Form::hidden('company_oldImage', empty($result['company_image']) ? '' : print_value($result['operation'],$result['company_image']) , array('id'=>'company_oldImage',
                                'class'=>' ')) !!}
                                <img src="{{asset('').$result['company_image']}}" alt="" width=" 100px">
                            @else
                                <img src="../resources/assets/images/default_images/product.png"
                                style="width: 50px; float: left; margin-right: 10px">
                            @endif
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Telephone') }}</label>
                        <div class="col-sm-10 col-md-4">
                            {!! Form::text('company_phone', !empty($result['company_phone']) ? $result['company_phone'] : '',
                            array('class'=>'form-control', 'id'=>'company_phone')) !!}
                            <span class="help-block"
                                style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.TelephoneText') }}</span>
                        </div>
                    </div>


                    {{-- Language Content --}}
                    <div class="form-group">
                        <div class="col-sm-2 col-md-3 control-label"></div>
                        <div class="col-sm-10 col-md-4">
                            <button id="add_registerCompany" type="submit" class="btn btn-primary">Add</button>
                            <a href="{{ URL::to('admin/login')}}" type="button" class="btn btn-default">{{ trans('labels.back') }}</a>
                        </div>
                    </div>
                {!! Form::close() !!}
            </div>
        </div>
    </div>
</div>
