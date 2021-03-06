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
                        <h3 class="box-title">{{ trans('labels.ListingAll'.$result['label']) }} </h3>
                        <div class="box-tools pull-right">
                            <a href="{{ URL::to('admin/view_add'.$result['label']) }}" type="button"
                                class="btn btn-block btn-primary">{{ trans('labels.AddNew'.$result['label']) }}</a>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="table-wrap" style="fro">
                                    <div class="table">
                                        <table id="company" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>{{ trans('labels.ID') }}</th>
                                                    <th>{{ trans('labels.Image') }}</th>
                                                    <th>{{ trans('labels.CompanyName') }}</th>
                                                    <th>{{ trans('labels.Address') }}</th>
                                                    <th>{{ trans('labels.Phone') }}</th>
                                                    <th>{{ trans('labels.CreateDate') }}</th>
                                                    <th>{{ trans('labels.Action') }}</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @if (count($result['companies'])>0)
                                                @foreach ($result['companies'] as $company)
                                                    <tr>
                                                        <td>{{ $company->company_id }}</td>
                                                        <td>
                                                            @if(!empty($company->image))
                                                                <img src="{{asset('').'/'.$company->image}}" alt="" width=" 100px">
                                                            @else
                                                                <img src={{asset('')."resources/assets/images/default_images/company.png"}}
                                                                style="width: 50px; float: left; margin-right: 10px">
                                                            @endif
                                                        </td>
                                                        <td>{{ $company->name }}</td>
                                                        <td>{{ $company->email }}</td>
                                                        <td>{{ $company->phone }}</td>
                                                        <td>{{ $company->create_date }}</td>
                                                        <td>
                                                            <a data-toggle="tooltip" data-placement="bottom" title="View Company" href="view_editCompany/{{ $company->company_id }}" class="badge bg-light-blue"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                                        </td>
                                                    </tr>
                                                @endforeach
                                                @else
                                                <td colspan="8">{{ trans('labels.NoRecordFound') }}</td>
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
        @include('admin/company/deleteCompanyDialog')
    </section>
</div>
@endsection