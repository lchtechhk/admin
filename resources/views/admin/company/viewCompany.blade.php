@extends('admin.common.layout')
@section('content')
<div class="content-wrapper">
    @include('layouts/add_header')
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box box-info"><br>
                                @include('layouts/responseMessage')
                                <div class="box-body">
                                    @if ($result['operation'] == 'listing' || $result['operation'] == 'add' ||
                                        $result['operation'] == 'view_add' )
                                        {!! Form::open(array('url' =>'admin/addCompany', 'method'=>'post', 'class' =>
                                        'form-horizontal form-validate', 'enctype'=>'multipart/form-data')) !!}
                                    @elseif ($result['operation'] == 'edit' || $result['operation'] == 'view_edit')
                                        {!! Form::open(array('url' =>'admin/updateCompany', 'method'=>'post', 'class' =>
                                        'form-horizontal form-validate', 'enctype'=>'multipart/form-data')) !!}
                                    @endif
                                    {{-- Only Edit --}}
                                    @if ($result['operation'] == 'edit' || $result['operation'] == 'view_edit')
                                        <div class="form-group">
                                            <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Company_id') }}
                                                <span style="color:red">★</span>
                                            </label>
                                            <div class="col-sm-10 col-md-4">
                                                {!! Form::text('company_id', empty($result['company']->company_id) ? '' : $result['company']->company_id,
                                                array('class'=>'form-control', 'id'=>'company_id','readonly')) !!}
                                            </div>
                                        </div>
                                    @endif
                                    {{-- user : {{empty($result['company']) ? '' : json_encode($result['company'])}} --}}
                                    disable_user_ids : {{empty($result['disable_user_ids']) ? '' : json_encode($result['disable_user_ids'])}}

                                {{-- Content --}}
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.BelongUser') }}
                                        <span style="color:red">★</span>
                                    </label>
                                    <div class="col-sm-10 col-md-4">
                                        <div class="table-wrap" style="fro">
                                            <div class="table">
                                                <table id="area" class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr>
															<th style="width:50px;">
																<input style="transform: scale(1.5);" type="checkbox" onchange="checkAllDoctor(this)">
                                                            </th>
                                                            <th>
																{{ trans('labels.Id') }}
															</th>
															<th>
																{{ trans('labels.CompanyName') }}
															</th>
                                                        </tr>
                                                        @if (!empty($result['users']) && count($result['users']) > 0)
                                                            @foreach ($result['users'] as $index=>$user)
                                                                <tr>
                                                                    @if ($result['operation'] == 'add' || $result['operation'] == 'view_add')
                                                                        <td>
                                                                            <input style="transform: scale(1.5);" type="checkbox"
                                                                            name="check_box_user[{{$user->user_id}}]" value="{{$user->user_id}}"
                                                                            {{!empty($result['user_id']) && $result['user_id'] == $user->user_id ? 'disabled checked' : ''}}
                                                                            {{print_checkbox($user->user_id, (!empty($_POST['check_box_user'][$user->user_id]) ? $_POST['check_box_user'][$user->user_id] : (!empty($result['company']->users[$user->user_id]->user_id) ? $result['company']->users[$user->user_id]->user_id : '')))}}
                                                                            >
                                                                        </td>
                                                                    @elseif ($result['operation'] == 'edit' || $result['operation'] == 'view_edit')
                                                                        <td>
                                                                            <input style="transform: scale(1.5);" type="checkbox"
                                                                            name="check_box_user[{{$user->user_id}}]" value="{{$user->user_id}}"
                                                                            {{!empty($result['disable_user_ids']) && isset($result['disable_user_ids'][$user->user_id]) ? 'disabled checked' : ''}}
                                                                            {{print_checkbox($user->user_id, (!empty($_POST['check_box_user'][$user->user_id]) ? $_POST['check_box_user'][$user->user_id] : (!empty($result['company']->users[$user->user_id]->user_id) ? $result['company']->users[$user->user_id]->user_id : '')))}}
                                                                            >
                                                                        </td>
                                                                    @endif
                                                                    <td>{{$user->user_id}}</td>
                                                                    <td>{{$user->last_name}} {{$user->first_name}}</td>
                                                                </tr>
                                                            @endforeach
                                                        @endif
                                                    </thead>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                @foreach($result['languages'] as $language)
                                    <div class="form-group">
                                        <label for="name" class="col-sm-2 col-md-3 control-label">
                                            {{ trans('labels.Name') }}
                                            ({{ $language->name}})
                                            <span style="color:red">★</span>
                                        </label>
                                        <div class="col-sm-10 col-md-4">
                                            {!! Form::text("language_array[".$language->language_id."][name]",
                                            print_value( (isset($_POST['language_array'][$language->language_id]['name']) ? $_POST['language_array'][$language->language_id]['name'] : (!empty($result['company']->language_array[$language->language_id]['name']) ? $result['company']->language_array[$language->language_id]['name'] : '' ))),
                                            array('class'=>'form-control
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
                                        {!! Form::email('email', 
                                        print_value((isset($_POST['email']) ? $_POST['email'] : (!empty($result['company']->email) ? $result['company']->email : '' ))),
                                        array('class'=>'form-control
                                        email-validate', 'id'=>'email')) !!}
                                        <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                                            {{ trans('labels.EmailText') }}</span>
                                        <span class="help-block hidden"> {{ trans('labels.EmailError') }}</span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Image') }} </label>
                                    <div class="col-sm-10 col-md-4">
                                        {!! Form::file('image', array('id'=>'image')) !!}<span class="help-block"
                                        style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                                        {{ trans('labels.UploadCompanyImageText') }}</span>
                                        <br>
                                        @if(!empty($result['company']->image))
                                            {!! Form::hidden('oldImage', 
                                            empty($result['company']->image) ? '' : $result['company']->image , 
                                            array('id'=>'oldImage',
                                            'class'=>' ')) !!}
                                            <img src="{{asset('').$result['company']->image}}" alt="" width=" 100px">
                                        @else
                                            <img src="{{asset('').'storage/default_images/company.png' }}"
                                            style="width: 50px; float: left; margin-right: 10px">
                                        @endif
                                    </div>
                                </div>
                        
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Telephone') }}</label>
                                    <div class="col-sm-10 col-md-4">
                                        {!! Form::text('phone', 
                                        print_value((isset($_POST['phone']) ? $_POST['phone'] : (!empty($result['company']->phone) ? $result['company']->phone : '' ))),
                                        array('class'=>'form-control', 'id'=>'phone')) !!}
                                        <span class="help-block"
                                            style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.TelephoneText') }}</span>
                                    </div>
                                </div>
                            {{-- Language Content --}}
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

<script type="text/javascript">
    $(function () {
        

        
    });
</script>

@endsection