{{-- @include('generic/order_function') --}}
<div class="modal fade" id="dialog_payment_method" tabindex="-1" role="dialog" aria-labelledby="dialog_payment_method">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="PaymentMethod">{{ trans('labels.PaymentMethod') }}</h4>
            </div>

            {!! Form::open(array('id'=>'form_payment_method' ,'method'=>'post', 'class' => 'form-horizontal')) !!}
                <div class="box-body">           
                    <div class="form-group" id="group_payment_method_id">
                        <label for="name" class="col-sm-4 col-md-4 control-label">{{ trans('labels.PaymentMethod') }}<span style="color:red">★</span></label> 
                        <div class="col-sm-10 col-md-4">
                            <select class="form-control field-validate select1 " name="payment_method_id" id="payment_method_id" style="width: 100%;">
                                <option value="">-</option>
                                @foreach ($result['payment_methods'] as $payment_method)
                                    <option value="{{ $payment_method->payment_method_id }}"
                                        @if(!empty($result['order']->payment_method_id))
                                            {{print_selected_value($payment_method->payment_method_id,$result['order']->payment_method_id)}}
                                        @endif >{{ $payment_method->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group" id="group_payment_method_name">
                        <label for="name" class="col-sm-4 col-md-4 control-label">{{ trans('labels.PaymentMethodName') }}<span style="color:red">★</span></label> 
                        <div class="col-sm-10 col-md-4">
                            {!! Form::text('payment_method_name', 
                            print_value( (isset($_POST['payment_method_name']) ? $_POST['payment_method_name'] : (!empty($result['order']->payment_method_name) ? $result['order']->payment_method_name : '' ))),
                            array('class'=>'form-control field-validate','readonly','id="payment_method_name"')) !!}
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="btn btn-primary" id="addPaymentMethod">{{ trans('labels.Add') }}</div>
                </div>
            {!! Form::close() !!}
        </div>
    </div>
</div>