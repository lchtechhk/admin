@extends('admin.common.layout')
@section('content')
<div class="content-wrapper">
    @include('layouts/add_header')
    <section class="content">
        <div class="row">
            {{-- {{json_encode($_POST)}} --}}
            @if (!empty($result['payment_method']))
                {{json_encode($result['payment_method'])}}
            @endif
            <div class="col-md-12">
                <div class="box-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box box-info"><br>
                                @include('layouts/responseMessage')
                                <div class="box-body">
                                    @if ($result['operation'] == 'listing' || $result['operation'] == 'add' || $result['operation'] == 'view_add' )
                                        {!! Form::open(array('url' =>'admin/addPaymentMethod', 'method'=>'post', 'class' => 'form-horizontal form-validate', 'enctype'=>'multipart/form-data')) !!}
                                    @elseif ($result['operation'] == 'edit' || $result['operation'] == 'view_edit')
                                        {!! Form::open(array('url' =>'admin/updatePaymentMethod', 'method'=>'post', 'class' => 'form-horizontal form-validate', 'enctype'=>'multipart/form-data')) !!}
                                    @endif

                                    {{-- Only Edit --}}
                                    @if ($result['operation'] == 'edit' || $result['operation'] == 'view_edit')
                                        <div class="form-group">
                                            <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.payment_method_id') }}
                                                <span style="color:red">★</span>
                                            </label>
                                            <div class="col-sm-10 col-md-4">
                                                {!! Form::text('payment_method_id', empty($result['payment_method']->payment_method_id) ? '' : $result['payment_method']->payment_method_id,
                                                array('class'=>'form-control', 'id'=>'payment_method_id','readonly')) !!}
                                            </div>
                                        </div>
                                    @endif

                                    {{-- Content --}}
                                    <div class="form-group">
                                        <label for="name"
                                            class="col-sm-2 col-md-3 control-label">{{ trans('labels.Name') }}</label>
                                            <span style="color:red">★</span>
                                        <div class="col-sm-10 col-md-4">
                                            {!! Form::text('name', 
                                            print_value(isset($_POST['name']) ? $_POST['name'] : !empty($result['payment_method']->name) ? $result['payment_method']->name : '' ),
                                            array('class'=>'form-control field-validate',
                                            'id'=>'name'))!!}
                                            <span class="help-block"
                                                style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.examplePaymentMethodName') }}</span>
                                            <span
                                                class="help-block hidden">{{ trans('labels.textRequiredFieldMessage') }}</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="name"
                                            class="col-sm-2 col-md-3 control-label">{{ trans('labels.Description') }}</label>
                                        <div class="col-sm-10 col-md-4">
                                            {!! Form::text('description', 
                                            print_value(isset($_POST['description']) ? $_POST['description'] : !empty($result['payment_method']->description) ? $result['payment_method']->description : '' ),
                                            array('class'=>'form-control ',
                                            'id'=>'description'))!!}
                                            <span class="help-block"
                                                style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.examplePaymentMethodDescription') }}</span>
                                            <span
                                                class="help-block hidden">{{ trans('labels.textRequiredFieldMessage') }}</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Image') }} </label>
                                        <div class="col-sm-10 col-md-4">
                                            {!! Form::file('image', array('id'=>'image')) !!}<span class="help-block"
                                            style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                                            {{ trans('labels.UploadPaymentMethodImageText') }}</span>
                                            <br>
                                            @if(!empty($result['payment_method']->image))
                                                {!! Form::hidden('oldImage', 
                                                empty($result['payment_method']->image) ? '' : $result['payment_method']->image , 
                                                array('id'=>'oldImage',
                                                'class'=>' ')) !!}
                                                <img src="{{asset('').$result['payment_method']->image}}" alt="" width=" 100px">
                                            @else
                                                <img src="{{asset('').'storage/default_images/product.png' }}"
                                                style="width: 50px; float: left; margin-right: 10px">
                                            @endif
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.PaymentMethodStatus') }} <span style="color:red">★</span></label>
                                        <div class="col-sm-10 col-md-4">
                                            <select class="form-control field-validate" name="status" id="status">
                                                <option value="active"
                                                    {{print_selected_value('active', (isset($_POST['status']) ? $_POST['status'] : (!empty($result['payment_method']->status) ? $result['payment_method']->status : '')))}}>
                                                    Active
                                                </option>
                                                <option value="inactive"
                                                    {{print_selected_value('inactive', (isset($_POST['status']) ? $_POST['status'] : (!empty($result['payment_method']->status) ? $result['payment_method']->status : '')))}}>
                                                    Inactive
                                                </option>
                                            </select>
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

<script type="text/javascript">
    $(function () {
        
        //for multiple languages
        @foreach($result['languages'] as $languages)
            // Replace the <textarea id="editor1"> with a CKEditor
            // instance, using default configuration.
            console.log('language_array[{{$languages->language_id}}][description]');
            CKEDITOR.replace( 'language_array[{{$languages->language_id}}][description]', {
                filebrowserBrowseUrl: '{{url('uploads/images/')}}',
                filebrowserUploadUrl: '{{url('admin/article/image')}}?_token={{csrf_token()}}'
            });
        @endforeach
        
        //bootstrap WYSIHTML5 - text editor
        $(".textarea").wysihtml5();
        
});
</script>

@endsection