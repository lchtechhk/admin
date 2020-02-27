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
                            <a href="{{ URL::to('admin/view_addLanguage') }}" type="button"
                                class="btn btn-block btn-primary">{{ trans('labels.AddNewLanguage') }}</a>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="table-wrap" style="fro">
                                    <div class="table">
                                        <table id="language" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>{{ trans('labels.Default') }}</th>
                                                    <th>{{ trans('labels.Language') }}</th>
                                                    <th>{{ trans('labels.Icon') }}</th>
                                                    <th>{{ trans('labels.Code') }}</th>
                                                    <th>{{ trans('labels.Action') }}</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @if(count($result['languages'])>0)
                                                    @foreach ($result['languages'] as $key => $language)
                                                        <tr>
                                                            <td>
                                                                <label>
                                                                    <input type="radio" name="language_id"
                                                                        value="{{ $language->language_id}}"
                                                                        class="default_language" @if($language->is_default=='yes')
                                                                    checked @endif >
                                                                </label>
                                                            </td>
                                                            <td>{{ $language->name }}</td>
                                                            <td><img src="{{asset('').$language->image}}" style="max-width:70px;"
                                                                    alt=""></td>
                                                            <td>{{ $language->code }}</td>
                                                            <td>
                                                                <a data-toggle="tooltip" data-placement="bottom"
                                                                    title=" {{ $language->name }}"
                                                                    href="{{ URL::to('admin/view_editLanguage/'.$language->language_id)}}"
                                                                    class="badge bg-light-blue"><i class="fa fa-pencil-square-o"
                                                                        aria-hidden="true"></i></a>

                                                                @if($language->is_default=='no')
                                                                <a data-toggle="tooltip" data-placement="bottom"
                                                                    title=" {{ $language->name }}" id="deleteLanguageId"
                                                                    language_id="{{ $language->language_id }}"
                                                                    class="badge bg-red"><i class="fa fa-trash"
                                                                        aria-hidden="true"></i></a>
                                                                @endif
                                                            </td>
                                                        </tr>
                                                    @endforeach
                                                @else
                                                <tr>
                                                    <td colspan="5">{{ trans('labels.Nolanguageexist') }}</td>
                                                </tr>
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
        @include('admin/language/deleteLanguage')
    </section>
</div>
@endsection