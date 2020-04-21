{{-- @include('generic/order_function') --}}
<div class="modal fade" id="dialog_payment_method" tabindex="-1" role="dialog" aria-labelledby="dialog_payment_method">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="PaymentMethod">{{ trans('labels.PaymentMethod') }}</h4>
            </div>
            {!! Form::open(array('url' =>'admin/updateOrder', 'method'=>'post', 'class' => 'form-horizontal form-validate', 'enctype'=>'multipart/form-data')) !!}
                <div class="box-body">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.OrderId') }}<span style="color:red">★</span></label> 
                        <div class="col-sm-10 col-md-4">
                            {!! Form::text('order_id', 
                            print_value( (isset($_POST['order_id']) ? $_POST['order_id'] : (!empty($result['order']->order_id) ? $result['order']->order_id : '' ))),
                            array('class'=>'form-control','readonly','required')) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.CustomerName') }}<span style="color:red">★</span></label> 
                        <div class="col-sm-10 col-md-9">
                            <select class="form-control select2 " required name="customer_id" id="customer_id" style="width: 100%;" {{is_disabled($result['operation'],empty($result['order']->customer_id) ? '' : $result['order']->customer_id)}}>
                                <option value="">-</option>
                                @foreach ($result['customers'] as $customer)
                                    <option value="{{ $customer->id }}"
                                        @if(!empty($result['order']->customer_id))
                                            {{print_selected_value($customer->id,$result['order']->customer_id)}}
                                        @endif >
                                        {{ $customer->lastname }} {{$customer->firstname}}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.PaymentMethod') }}<span style="color:red">★</span></label> 
                        <div class="col-sm-10 col-md-4">
                            <select class="form-control field-validate select1 " name="payment_method_id" id="payment_method_id" style="width: 100%;">
                                <option value="">-</option>
                                @foreach ($result['payment_methods'] as $payment_method)
                                    <option value="{{ $payment_method->payment_method_id }}"
                                        @if(!empty($result['order']->payment_method_id))
                                            {{print_selected_value($payment_method->payment_method_id,$result['order']->payment_method_id)}}
                                        @endif >{{ $payment_method->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 col-md-3 control-label">{{ trans('labels.PaymentMethodName') }}<span style="color:red">★</span></label> 
                        <div class="col-sm-10 col-md-4">
                            {!! Form::text('payment_method_name', 
                            print_value( (isset($_POST['payment_method_name']) ? $_POST['payment_method_name'] : (!empty($result['order']->payment_method_name) ? $result['order']->payment_method_name : '' ))),
                            array('class'=>'form-control field-validate','readonly','id="payment_method_name"')) !!}
                        </div>
                    </div>
                </div>
                @include('layouts/dialog_submit_back_button')
            {!! Form::close() !!}
        </div>
    </div>
</div>