@extends('admin.common.layout') @section('content')
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
                                        {!! Form::open(array('url' =>'admin/addLanguage', 'method'=>'post', 'class' =>
                                        'form-horizontal form-validate', 'enctype'=>'multipart/form-data')) !!}
                                    @elseif ($result['operation'] == 'edit' || $result['operation'] == 'view_edit')
                                        {!! Form::open(array('url' =>'admin/updateLanguage', 'method'=>'post', 'class' =>
                                        'form-horizontal form-validate', 'enctype'=>'multipart/form-data')) !!}
                                    @endif
                                    @if ($result['operation'] == 'edit' || $result['operation'] == 'view_edit')
                                        <div class="form-group">
                                            <label for="name"
                                                class="col-sm-2 col-md-3 control-label">{{ trans('labels.LanguageId') }}
                                                <span style="color:red">★</span>
                                            </label>
                                            <div class="col-sm-10 col-md-4">
                                                {!! Form::text('language_id',
                                                empty($result['language']->language_id) ? '' :
                                                print_value($result['operation'],$result['language']->language_id),
                                                array('class'=>'form-control', 'id'=>'language_id','readonly')) !!}
                                            </div>
                                        </div>
                                    @endif

                                    <div class="form-group">
                                        <label for="name"
                                            class="col-sm-2 col-md-3 control-label">{{ trans('labels.Icon') }}</label>
                                        <div class="col-sm-10 col-md-4">
                                            {!! Form::file('image', array('id'=>'image')) !!}
                                            <span class="help-block"
                                                style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.LanguageFlag') }}</span>
                                            @if(!empty($result['language']->image))
                                                <img width="150px" src="{{asset('').$result['language']->image}}"
                                                    class="img-circle">
                                            @else
                                                <img width="150px"
                                                    src="{{asset('').'storage/image/question.png' }}"
                                                    class="img-circle">
                                            @endif
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="name"
                                            class="col-sm-2 col-md-3 control-label">{{ trans('labels.Name') }}</label>
                                        <div class="col-sm-10 col-md-4">
                                            {!! Form::text('name',  empty($result['language']->name) ? '' : $result['language']->name, array('class'=>'form-control ',
                                            'id'=>'name'))!!}
                                            <span class="help-block"
                                                style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.exampleLanguageName') }}</span>
                                            <span
                                                class="help-block hidden">{{ trans('labels.textRequiredFieldMessage') }}</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="name"
                                            class="col-sm-2 col-md-3 control-label">{{ trans('labels.Code') }}</label>
                                        <div class="col-sm-10 col-md-4">
                                            {!! Form::text('code', empty($result['language']->code) ? '' : $result['language']->code, array('class'=>'form-control ',
                                            'id'=>'code'))!!}
                                            <span class="help-block"
                                                style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.exampleLanguageCode') }}</span>
                                            <span
                                                class="help-block hidden">{{ trans('labels.textRequiredFieldMessage') }}</span>
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