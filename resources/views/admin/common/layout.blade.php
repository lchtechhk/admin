<!DOCTYPE html>
<html>


{{-- jquery --}}
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript"></script>

{{-- table-data --}}
<link rel="stylesheet" type="text/css" href={{App::make('url')->to('/')."/public/css/horizontal-scroll.css"}}>
<script src={{App::make('url')->to('/')."/resources/assets/js/table-data.js"}}></script>
<script src={{App::make('url')->to('/')."/resources/assets/js/objectUtils.js"}}></script>
<script src={{App::make('url')->to('/')."/resources/assets/js/filter.js"}}></script>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

@include('admin.common.meta')

<body class=" hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
        {{-- @include('admin.common.header') --}}
        {{-- @include('admin.common.sidebar') --}}
        @yield('content')
        @include('admin.common.controlsidebar')
        @include('admin.common.footer')
    </div>
    @include('admin.common.scripts')
</body>

</html>
