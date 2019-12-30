@extends('admin.login.layout_login')
@section('content')
<style>
    .wrapper {
        display: none !important;
    }
</style>
<div class="login-box">
    <div class="login-logo">
        {{-- <img src="{{asset('/resources/views/admin/images/admin_logo/logo-android-blue-v1.png')}}"
        class="ionic-hide">
        <img src="{{asset('/resources/views/admin/images/admin_logo/logo-ionic-blue-v1.png')}}" class="android-hide">
        --}}
        <div style="font-size: 25px;">
            {{-- <b> {{ trans('labels.welcome_message') }}</b> --}}
            {{-- {{ trans('labels.welcome_message_to') }} --}}
        </div>
    </div>
    <div class="login-box-body">
        <p class="login-box-msg">{{ trans('labels.login_text') }}</p>
        @if( count($errors) > 0)
            @foreach($errors->all() as $error)
                <div class="alert alert-danger" role="alert">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                    <span class="sr-only">{{ trans('labels.Error') }}:</span>
                    {{ $error }}
                </div>
            @endforeach
        @endif

        @if(Session::has('loginError'))
            <div class="alert alert-danger" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                <span class="sr-only">{{ trans('labels.Error') }}:</span>
                {!! session('loginError') !!}
            </div>
        @endif

        {!! Form::open(array('url' =>'admin/checkLogin', 'method'=>'post', 'class'=>'form-validate')) !!}
            <div class="form-group has-feedback">
                {!! Form::email('email', '', array('class'=>'form-control email-validate', 'id'=>'email')) !!}
                <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                    {{ trans('labels.AdminEmailText') }}</span>
                <span class="help-block hidden"> {{ trans('labels.AdminEmailText') }}</span>
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name='password' class='form-control field-validate' value="">
                <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                    {{ trans('labels.AdminPasswordText') }}</span>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                <span class="help-block hidden">{{ trans('labels.textRequiredFieldMessage') }}</span>
            </div>
            <div class="row">
                <div class="col-xs-6">
                    {!! Form::submit(trans('labels.login'), array('id'=>'login', 'class'=>'btn btn-primary btn-block
                    btn-flat' )) !!}
                </div>
                <div class="col-xs-6">
                    <a href="{{ URL::to('admin/view_registerUser') }}"
                        class='btn btn-primary btn-block btn-flat'>{{trans('labels.register')}}</a>
                </div>
            </div>
        {!! Form::close() !!}
    </div>
</div>
