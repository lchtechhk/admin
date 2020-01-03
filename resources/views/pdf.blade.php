<!DOCTYPE html>
<html>
<style type="text/css">
  @font-face {
    font-family: "stc";
    src: url("{{storage_path('fonts\stc.ttf')}}") format('truetype');
  }
  * {
    color:#000;
    font-family: "stc";
  }
</style>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>顧客 Laravel 5.6 PDF Generate Tutorial With Example</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body style="font-size: 12px;">
  <div class="row">
    <div class="col-xs-6 col-md-6">
      <p class="bold">
        <?= 'Rainbow Equipment Ltd.' ?><br>
        <?= 'Unit 706, Asia Trade Centre' ?><br>
        <?= '76 Lei Muk Road, Kwai Chung, NT, HK,' ?><br>
        <?= 'Tel' ?> : <?= '(+852) 3524-7324 / 9101-4561' ?><br>
        <?= 'Fax' ?>: <?= '(+852) 3168-9717' ?><br>
        <?= 'Email' ?>: <?= 'REL@Rainbow-Equipment.com' ?><br>
      </p>
    </div>
    <div class="col-xs-6 col-md-6">
      <div class="text-center">
        {{-- <img style="width:200px;height:100px;" src="{{$image}}"> --}}
        <img style="width:200px;height:100px;" src="http://localhost/admin/storage/company/logo/logo.png">
      </div>
    </div>
  </div>
  <hr style="margin:5px; border: 1px solid black;">
  <div class="row">
    <div class="col-xs-12 col-md-12">
      不支持汉字 dompdf_font_family
      <table style="width:100%;">
        <tr>
          {{-- <th>顧客 : </th>
          <td style="padding:5px;">
            1
          </td>
          <th>日期 : </th>
          <td style="padding:5px;">
            2
          </td>
          <th>已操作時數 :</th>
          <td style="padding:5px;">
            3
          </td> --}}
        </tr>
      </table>
    </div>
  </div>
</body>

</html>