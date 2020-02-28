@extends('admin.common.layout')
@section('content')
<div class="content-wrapper">
    @include('layouts/add_header')
    <section class="content">
        <div class="row">
            {{-- {{json_encode($_POST)}} --}}
            {{-- @if (!empty($result['product']))
                {{json_encode($result['product'])}}
            @endif --}}
            <div class="col-md-12">
                <div class="box-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box box-info"><br>
                                @include('layouts/responseMessage')
                                <div class="box-body">
                                    @if ($result['operation'] == 'listing' || $result['operation'] == 'add' || $result['operation'] == 'view_add' )
                                        {!! Form::open(array('url' =>'admin/addProduct', 'method'=>'post', 'class' => 'form-horizontal form-validate', 'enctype'=>'multipart/form-data')) !!}
                                    @elseif ($result['operation'] == 'edit' || $result['operation'] == 'view_edit')
                                        {!! Form::open(array('url' =>'admin/updateProduct', 'method'=>'post', 'class' => 'form-horizontal form-validate', 'enctype'=>'multipart/form-data')) !!}
                                    @endif

                                    {{-- Only Edit --}}
                                    @if ($result['operation'] == 'edit' || $result['operation'] == 'view_edit')
                                        <div class="form-group">
                                            <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Product_id') }}
                                                <span style="color:red">★</span>
                                            </label>
                                            <div class="col-sm-10 col-md-4">
                                                {!! Form::text('product_id', empty($result['product']->product_id) ? '' : $result['product']->product_id,
                                                array('class'=>'form-control', 'id'=>'product_id','readonly')) !!}
                                            </div>
                                        </div>
                                    @endif
                                    {{-- Content --}}
                                    <div class="form-group">
                                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Category') }}<span style="color:red">★</span></label>
                                        <div class="col-sm-10 col-md-4">
                                            <select class="form-control field-validate" id="sub_category_id" name="sub_category_id">
                                                @foreach ($result['view_sub_categories'] as $view_sub_category)
                                                    <option value="{{$view_sub_category->sub_category_id }}"
                                                        {{print_selected_value($view_sub_category->sub_category_id, (isset($_POST['sub_category_id']) ? $_POST['sub_category_id'] : (!empty($result['product']->sub_category_id) ? $result['product']->sub_category_id : '')))}}>
                                                        {{ $view_sub_category->category_name }} | {{ $view_sub_category->sub_category_name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                                            {{ trans('labels.ChooseCatgoryText') }}.</span>
                                            <span class="help-block hidden">{{ trans('labels.textRequiredFieldMessage') }}</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Manufacturers') }} </label>
                                        <div class="col-sm-10 col-md-4">
                                            <select class="form-control" name="manufacturer_id" id="manufacturer_id">
                                                @foreach ($result['view_manufacturers'] as $view_manufacturer)
                                                    <option value="{{ $view_manufacturer->manufacturer_id }}"
                                                        {{print_selected_value($view_manufacturer->manufacturer_id, (isset($_POST['manufacturer_id']) ? $_POST['manufacturer_id'] : (!empty($result['product']->manufacturer_id) ? $result['product']->manufacturer_id : '')))}}>
                                                        {{ $view_manufacturer->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                                <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">{{ trans('labels.ChooseManufacturerText') }}..</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Image') }} </label>
                                        <div class="col-sm-10 col-md-4">
                                            {!! Form::file('image', array('id'=>'image')) !!}<span class="help-block"
                                            style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                                            {{ trans('labels.UploadProductImageText') }}</span>
                                            <br>
                                            @if(!empty($result['product']->image))
                                                {!! Form::hidden('oldImage', 
                                                empty($result['product']->image) ? '' : $result['product']->image , 
                                                array('id'=>'oldImage',
                                                'class'=>' ')) !!}
                                                <img src="{{asset('').$result['product']->image}}" alt="" width=" 100px">
                                            @else
                                                <img src="{{asset('').'storage/default_images/product.png' }}"
                                                style="width: 50px; float: left; margin-right: 10px">
                                            @endif
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.ProductStatus') }} <span style="color:red">★</span></label>
                                        <div class="col-sm-10 col-md-4">
                                            <select class="form-control field-validate" name="status" id="status">
                                                <option value="active"
                                                    {{print_selected_value('active', (isset($_POST['status']) ? $_POST['status'] : (!empty($result['product']->status) ? $result['product']->status : '')))}}>
                                                    Active
                                                </option>
                                                <option value="inactive"
                                                    {{print_selected_value('inactive', (isset($_POST['status']) ? $_POST['status'] : (!empty($result['product']->status) ? $result['product']->status : '')))}}>
                                                    Inactive
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <hr>  

                                    <div class="form-group">
                                        <label for="name" class="col-sm-2 col-md-3 control-label">
                                            {{ trans('labels.ProductsPrice') }}
                                            <span style="color:red">★</span>
                                        </label>
                                        <div class="col-sm-10 col-md-4">
                                            {!! Form::text('price', 
                                            print_value( (isset($_POST['price']) ? $_POST['price'] : (!empty($result['product']->price) ? $result['product']->price : '' ))),
                                            array('class'=>'form-control field-validate', 'id'=>'price')) !!}
                                            <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                                            {{ trans('labels.ProductPriceText') }}
                                            </span>
                                            <span class="help-block hidden">{{ trans('labels.ProductPriceText') }}</span>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="name"
                                            class="col-sm-2 col-md-3 control-label">{{ trans('labels.ProductsWeight') }}</label>
                                        <div class="col-sm-10 col-md-2">
                                            {!! Form::text('weight', 
                                            print_value( (isset($_POST['weight']) ? $_POST['weight'] : (!empty($result['product']->weight) ? $result['product']->weight : '' ))),
                                            array('class'=>'form-control', 'id'=>'weight')) !!}
                                            <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                                            {{ trans('labels.RequiredTextForWeight') }}
                                            </span>
                                        </div>
                                        <div class="col-sm-10 col-md-2" style="padding-left: 0;">
                                            <select class="form-control" name="products_weight_unit">
                                            @if(count($result['units'])>0)
                                            @foreach($result['units'] as $unit)
                                                <option value="{{$unit->name}}"
                                                    {{print_selected_value($unit->name, (isset($_POST['weight_unit']) ? $_POST['weight_unit'] : (!empty($result['product']->weight_unit) ? $result['product']->weight_unit : '')))}}>
                                                    {{ $unit->name }}
                                                </option>
                                            @endforeach
                                            @endif
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="name" class="col-sm-2 col-md-3 control-label">
                                            {{ trans('labels.ProductsQuantity') }}
                                            <span style="color:red">★</span>
                                        </label>
                                        <div class="col-sm-10 col-md-4">
                                            {!! Form::text('quantity', 
                                            print_value( (isset($_POST['quantity']) ? $_POST['quantity'] : (!empty($result['product']->quantity) ? $result['product']->quantity : '' ))),
                                            array('class'=>'form-control field-validate', 'id'=>'quantity')) !!}
                                            <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                                            {{ trans('labels.ProductsQuantityText') }}
                                            </span>
                                            <span class="help-block hidden">{{ trans('labels.ProductsQuantityText') }}</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.QuantityLowLimit') }}</label>
                                        <div class="col-sm-10 col-md-4">
                                            {!! Form::text('low_limit', 
                                            print_value( (isset($_POST['low_limit']) ? $_POST['low_limit'] : (!empty($result['product']->low_limit) ? $result['product']->low_limit : '' ))),
                                            array('class'=>'form-control ', 'id'=>'low_limit')) !!}
                                            <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                                            {{ trans('labels.QuantityLowLimitText') }}</span>
                                        </div>
                                    </div>

                                    <hr>  

                                    <div class="form-group">
                                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Special') }} </label>
                                        <div class="col-sm-10 col-md-4">
                                            <select class="form-control" onChange="showSpecial()" name="special_status" id="special_status">
                                                <option value="active"
                                                    {{print_selected_value('active', (isset($_POST['special_status']) ? $_POST['special_status'] : (!empty($result['product']->special_status) ? $result['product']->special_status : '')))}}>
                                                    Active
                                                </option>
                                                <option value="cancel"
                                                    {{print_selected_value('cancel', (isset($_POST['special_status']) ? $_POST['special_status'] : (!empty($result['product']->special_status) ? $result['product']->special_status : '')))}}>
                                                    Inactive
                                                </option>
                                            </select>
                                            <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                                            {{ trans('labels.SpecialProductText') }}</span>
                                        </div>
                                    </div>

                                        <div class="special-container" style="display: none;">
                                            <div class="form-group">
                                                <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.SpecialPrice') }}<span style="color:red">★</span></label>
                                                <div class="col-sm-10 col-md-4">
                                                    {!! Form::text('special_price',
                                                    print_value( (isset($_POST['special_price']) ? $_POST['special_price'] : (!empty($result['product']->special_price) ? $result['product']->special_price : '' ))),
                                                    array('class'=>'form-control','id'=>'special_price')) !!}
                                                    <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                                                        {{ trans('labels.SpecialPriceTxt') }}.
                                                    </span>
                                                </div>
                                                <span class="help-block hidden">{{ trans('labels.SpecialPriceNote') }}.</span>
                                            </div>
                                            <div class="form-group">
                                                <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.ExpiryDate') }}<span style="color:red">★</span></label> 
                                                <div class="col-sm-10 col-md-4">
                                                    {!! Form::text('expiry_date', 
                                                    print_value( (isset($_POST['expiry_date']) ? $_POST['expiry_date'] : (!empty($result['product']->expiry_date) ? $result['product']->expiry_date : '' ))),
                                                    array('class'=>'form-control datepicker','id'=>'expiry_date')) !!}
                                                    <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                                                        {{ trans('labels.SpecialExpiryDateTxt') }}
                                                    </span>
                                                    <span class="help-block hidden">{{ trans('labels.textRequiredFieldMessage') }}</span>
                                                </div>
                                            </div>
                                        </div>
                                    <hr>


                                    {{-- Language Content --}}
                                    @foreach($result['languages'] as $language)
                                        <div class="form-group">
                                            <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.ProductName') }} ({{ $language->name}})
                                                <span style="color:red">★</span>
                                            </label>
                                            <div class="col-sm-10 col-md-4">
                                                    {!! Form::text("language_array[".$language->language_id."][name]",
                                                    print_value( (isset($_POST['language_array'][$language->language_id]['name']) ? $_POST['language_array'][$language->language_id]['name'] : (!empty($result['product']->language_array[$language->language_id]['name']) ? $result['product']->language_array[$language->language_id]['name'] : '' ))),
                                                    array('class'=>'form-control field-validate
                                                    ', 'id'=>'name')) !!}
                                            <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                                                {{ trans('labels.EnterProductNameIn') }} {{ $language->name }} </span>
                                            <span class="help-block hidden">{{ trans('labels.textRequiredFieldMessage') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.Description') }} ({{ $language->name }})</label>
                                            <div class="col-sm-10 col-md-8">
                                                    {!! Form::textarea("language_array[".$language->language_id."][description]",
                                                    print_value((isset($_POST['language_array'][$language->language_id]['description']) ? 
                                                    $_POST['language_array'][$language->language_id]['description'] : 
                                                    (!empty($result['product']->language_array[$language->language_id]['description']) ? 
                                                    $result['product']->language_array[$language->language_id]['description'] : '' ))),
                    
                                                    array('class'=>'form-control field-validate
                                                    ', 'id'=>'description')) !!}
                                                <span class="help-block" style="font-weight: normal;font-size: 11px;margin-bottom: 0;">
                                                {{ trans('labels.EnterProductDetailIn') }} {{ $language->name }}</span>
                                            </div>
                                        </div>
                                    @endforeach

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