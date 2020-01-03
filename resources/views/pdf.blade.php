<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <title>测试pdf</title>
  <style type="text/css" media="all">
    @font-face {
      font-family: "stc";
      src: url("{{storage_path('fonts\stc.ttf')}}") format('truetype');
    }

    * {
      color: #000;
      font-family: "stc";
    }
    .information_table{
      border: 1px solid black;
    }
    .information_tr{
      border: 1px solid black;
      padding:5px;
    }
    .information_td{
      padding:5px;
    }
    .page-break {
        page-break-after: always;
    }
  </style>
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
      <table class="information" style="width:100%;">
        <tr class="information_tr">
          <td class="information_td">顧客</td>
          <td class="information_td">
            1
          </td>
          <td class="information_td">日期 : </td>
          <td class="information_td">
            2
          </td>
          <td class="information_td">已操作時數 :</td>
          <td class="information_td">
            3
          </td>
        </tr>
      </table>
    </div>
  </div>

  <div class="page-break"></div>
<h1>Page 2</h1>
</body>

</html>