@extends('admin.common.layout')
@section('content')
<div class="content-wrapper">
    @include('layouts/list_header')
    <section class="content">
        @include('layouts/responseMessage')
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">{{ trans('labels.ListingAllMainCategories') }} </h3>
                        <div class="box-tools pull-right">
                            <a href="{{ URL::to('admin/view_addOrder') }}" type="button"
                                class="btn btn-block btn-primary">{{ trans('labels.AddNewOrder') }}</a>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="table-wrap" style="fro">
                                    <div class="table">
                                        <table id="order" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>{{ trans('labels.ID') }}</th>
                                                    <th>{{ trans('labels.CompanyName') }}</th>
                                                    <th>{{ trans('labels.Email') }}</th>
                                                    <th>{{ trans('labels.Phone') }}</th>
                                                    <th>{{ trans('labels.OrderTotal') }}</th>
                                                    <th>{{ trans('labels.DatePurchased') }}</th>
                                                    <th>{{ trans('labels.Status') }} </th>
                                                    <th>{{ trans('labels.Action') }}</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @if (count($result['orders'])>0)
                                                @foreach ($result['orders'] as $order)
                                                    <tr>
                                                        <td>{{ $order->order_id }}</td>
                                                        <td>{{ $order->customer_company }}</td>
                                                        <td>{{ $order->email }}</td>
                                                        <td>{{ $order->customer_telephone }}</td>
                                                        <td>{{ $order->order_price }}</td>
                                                        <td>{{ $order->date_purchased }}</td>
                                                        <td>{{ $order->order_status }}</td>
                                                        <td>
                                                            <a data-toggle="tooltip" data-placement="bottom" title="View Order" href="view_editOrder/{{ $order->order_id }}" class="badge bg-light-blue"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                                            <a data-toggle="tooltip" data-placement="bottom" title="Delete Order" id="deleteOrderId" order_id ="{{ $order->order_id }}" class="badge bg-red"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                                        </td>
                                                    </tr>
                                                @endforeach
                                                @endif
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-xs-12 text-right">
                                    {{-- {{$result->links('vendor.pagination.default')}} --}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- delete -->
        @include('admin/order/deleteOrder')
    </section>
</div>
@endsection