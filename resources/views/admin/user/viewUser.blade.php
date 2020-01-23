@extends('admin.common.layout')
@section('content')
<div class="content-wrapper">
    @include('layouts/add_header')
    <section class="content">
        <div class="row">
            {{-- AD :{{ isset($_POST['first_name']) ? $_POST['first_name'] : ""}} --}}
            {{-- {{isset($result['user']) ? json_encode($result['user']->companies) : ""}} <br/> --}}
            {{-- $_POST['check_box_company'] : {{ isset($_POST['check_box_company']) ?  json_encode($_POST['check_box_company']) : "6666"}}  <br/>
            check_box_company : {{isset($_POST['check_box_company'][2]) ? $_POST['check_box_company'][2] : "33333"}} --}}
            <table>
                <?php


                    foreach ($_POST as $key => $value) {
                        echo "<tr>";
                        echo "<td>";
                        echo $key;
                        echo "</td>";
                        echo "<td>";
                        echo json_encode($value);
                        echo "</td>";
                        echo "</tr>";
                    }


                ?>
                </table>
            <div class="col-md-12">
                <div class="box-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box box-info"><br>
                                @include('layouts/responseMessage')
                                <div class="box-body">
                                    @if ($result['operation'] == 'listing' || $result['operation'] == 'add' ||
                                        $result['operation'] == 'view_add' )
                                        {!! Form::open(array('url' =>'admin/addUser', 'method'=>'post', 'class' =>
                                        'form-horizontal form-validate', 'enctype'=>'multipart/form-data')) !!}
                                    @elseif ($result['operation'] == 'edit' || $result['operation'] == 'view_edit')
                                        {!! Form::open(array('url' =>'admin/updateUser', 'method'=>'post', 'class' =>
                                        'form-horizontal form-validate', 'enctype'=>'multipart/form-data')) !!}
                                    @endif
                                    {{-- Only Edit --}}
                                    @if ($result['operation'] == 'edit' || $result['operation'] == 'view_edit')
                                        <div class="form-group">
                                            <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.UserId') }}
                                                <span style="color:red">★</span>
                                            </label>
                                            <div class="col-sm-10 col-md-4">
                                                {!! Form::text('user_id', empty($result['user']->user_id) ? '' : $result['user']->user_id,
                                                array('class'=>'form-control', 'id'=>'user_id','readonly')) !!}
                                            </div>
                                        </div>
                                    @endif
                                {{-- Content --}}
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.BelongCompany') }}
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
                                                        @if (!empty($result['companies']) && count($result['companies']) > 0)
                                                            @foreach ($result['companies'] as $index=>$company)
                                                                <tr>
                                                                    <td>
                                                                        <input style="transform: scale(1.5);" type="checkbox"
                                                                        name="check_box_company[{{$company->company_id}}]" value="{{$company->company_id}}"
                                                                        {{-- {{print_checkbox($company->company_id, (isset($_POST['companies'][$index]['company_id']) ? $_POST['companies'][$index]['company_id'] : 1 ))}}> --}}
                                                                        {{!empty($result['main_company_id']) && $result['main_company_id'] == $company->company_id ? 'disabled checked' : ''}}
                                                                        {{print_checkbox($company->company_id, (!empty($_POST['check_box_company'][$company->company_id]) ? $_POST['check_box_company'][$company->company_id] : (!empty($result['user']->companies[$index]->company_id) ? $result['user']->companies[$index]->company_id : '')))}}
                                                                        >
                                                                    </td>
                                                                    <td>{{$company->company_id}}</td>
                                                                    <td>{{$company->name}}</td>
                                                                </tr>
                                                            @endforeach
                                                        @endif
                                                    </thead>
                                                </table>
                                            </div>
                                        </div>
                                    </div>


                                </div>

                                {{-- <div class="form-group">
                                    <label for="name"
                                        class="col-sm-2 col-md-3 control-label">{{ trans('labels.Permission') }}<span
                                            style="color:red">★</span></label>
                                    <div class="col-sm-10 col-md-4">
                                        <select class="form-control field-validate" id="permission" name="permission">
                                            <option value="">-</option>
                                            @foreach ($result['permissions'] as $permission)
                                            <option value="{{ $permission->name }}"
                                                {{print_selected_value($permission->name, (isset($_POST['permission']) ? $_POST['permission'] : (!empty($result['user']->permission) ? $result['user']->permission : '')))}}>
                                                {{ $permission->name }}
                                            </option>
                                            @endforeach
                                        </select>
                                        <span class="help-block"
                                            style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                                            {{ trans('labels.ChoosePermissionText') }}.</span>
                                        <span
                                            class="help-block hidden">{{ trans('labels.textRequiredFieldMessage') }}</span>
                                    </div>
                                </div> --}}
                                <div class="form-group">
                                    <label for="name"
                                        class="col-sm-2 col-md-3 control-label">{{ trans('labels.FirstName') }}
                                        <span style="color:red">★</span>
                                    </label>
                                    <div class="col-sm-10 col-md-4">
                                        {!! Form::text('first_name',
                                        print_value((isset($_POST['first_name']) ? $_POST['first_name'] : (!empty($result['user']->first_name) ? $result['user']->first_name : '' ))),
                                        array('class'=>'form-control field-validate', 'id'=>'first_name')) !!}
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
                                        {!! Form::text('last_name',
                                        print_value((isset($_POST['last_name']) ? $_POST['last_name'] : (!empty($result['user']->last_name) ? $result['user']->last_name : '' ))),
                                        array('class'=>'form-control field-validate', 'id'=>'last_name')) !!}
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
                                            {{print_radio_value("M", (isset($_POST['gender']) ? $_POST['gender'] : (!empty($result['user']->gender) ? $result['user']->gender : '')))}}>
                                            {{ trans('labels.Male') }}
                                        </label>
                                        <br>
                                        <label>
                                            <input  type="radio" name="gender" value="F" class="minimal"
                                            {{print_radio_value("F", (isset($_POST['gender']) ? $_POST['gender'] : (!empty($result['user']->gender) ? $result['user']->gender : '')))}}>
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
                                        @if(!empty($result['user']->image))
                                            <img width="150px" src="{{asset('').'/'.$result['user']->image}}" class="img-circle">
                                        @else
                                            <img width="150px" src="{{asset('').'storage/default_images/user.png' }}" class="img-circle">
                                        @endif
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.DOB') }}</label>
                                    <div class="col-sm-10 col-md-4">
                                        {!! Form::text('dob',
                                        print_value((isset($_POST['dob']) ? $_POST['dob'] : (!empty($result['user']->dob) ? $result['user']->dob : '' ))),
                                        array('class'=>'form-control datepicker' , 'id'=>'dob')) !!}
                                        <span class="help-block"
                                            style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.DOBText') }}</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Telephone') }}</label>
                                    <div class="col-sm-10 col-md-4">
                                        {!! Form::text('phone',
                                        print_value((isset($_POST['phone']) ? $_POST['phone'] : (!empty($result['user']->phone) ? $result['user']->phone : '' ))),
                                        array('class'=>'form-control', 'id'=>'phone')) !!}
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
                                        {!! Form::email('email',
                                        print_value((isset($_POST['email']) ? $_POST['email'] : (!empty($result['user']->email) ? $result['user']->email : '' ))),
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
                                        {!! Form::password('password_str',  array('class'=>'form-control ', 'id'=>'password_str')) !!}
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
                                            {{print_selected_value("active", (isset($_POST['status']) ? $_POST['status'] : (!empty($result['user']->status) ? $result['user']->status : '')))}}>
                                            {{ trans('labels.Active') }}
                                            </option>
                                            <option value="inactive"
                                            {{print_selected_value("inactive", (isset($_POST['status']) ? $_POST['status'] : (!empty($result['user']->status) ? $result['user']->status : '')))}}>
                                            {{ trans('labels.Inactive') }}
                                            </option>
                                        </select>
                                        <span class="help-block"
                                            style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.StatusText') }}</span>
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
