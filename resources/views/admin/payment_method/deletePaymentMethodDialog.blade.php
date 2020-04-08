<div class="modal fade" id="deletePaymentMethodModal" tabindex="-1" role="dialog" aria-labelledby="deletePaymentMethodModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="deletePaymentMethodModalLabel">{{ trans('labels.deleteManufacturer') }}</h4>
            </div>
            {!! Form::open(array('url' =>'admin/deletePaymentMethod', 'name'=>'deletePaymentMethod', 'id'=>'deletePaymentMethod', 'method'=>'post',
            'class' => 'form-horizontal', 'enctype'=>'multipart/form-data')) !!}
            {!! Form::hidden('action', 'delete', array('class'=>'form-control')) !!}
            {!! Form::hidden('payment_method_id', '' , array('class'=>'form-control', 'id'=>'payment_method_id')) !!}
            <div class="modal-body">
                <p>{{ trans('labels.deletePaymentMethodText') }}</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">{{ trans('labels.Cancel') }}</button>
                <button type="submit" class="btn btn-primary" id="deletePaymentMethod">{{ trans('labels.Delete') }}</button>
            </div>
            {!! Form::close() !!}
        </div>
    </div>
</div>