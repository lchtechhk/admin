<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
  <title>测试pdf</title>
  <style type="text/css" media="all">
    @font-face {
      font-family: "stc";
      src: url("{{storage_path('fonts\stc.ttf')}}") format('truetype');
    }
    * {
      word-break: break-all;
      color: #000;
      font-family: "stc";
    }
    table {
      border-collapse: collapse;
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
        <img style="width:200px;height:100px;" src="http://localhost/admin/storage/company/logo/logo.png">
      </div>
    </div>
  </div>
  
  <hr style="margin:5px; border: 1px solid black;">
  <div class="row">
    <div class="col-xs-12 col-md-12">
      <table class="information" style="width:100%;">
        <tr>
          <td style="max-width:50px;text-align:center;padding:5px;" class="information_td">顧客 : </td>
          <td style="min-width:100px;padding:5px;border-bottom: 1px solid black;"></td>
          <td style="max-width:50px;text-align:center;padding:5px;" class="information_td">日期 : </td>
          <td style="min-width:100px;padding:5px;border-bottom: 1px solid black;"></td>
          <td style="max-width:50px;text-align:center;padding:5px;" class="information_td">已操作時數 :</td>
          <td style="min-width:100px;padding:5px;border-bottom: 1px solid black;"></td>
        </tr>
        <tr>
          <td style="text-align:center;padding:5px;" class="information_td">型號 : </td>
          <td style="padding:5px;border-bottom: 1px solid black;"><span></span></td>
          <td style="text-align:center;padding:5px;" class="information_td">車身號 : </td>
          <td style="padding:5px;border-bottom: 1px solid black;"></td>
          <td style="text-align:center;padding:5px;" class="information_td">門架類型 :</td>
          <td style="padding:5px;border-bottom: 1px solid black;"></td>
        </tr>
      </table>
    </div>
  </div>

  <div class="page-break"></div>
<h1>Page 2</h1>
</body>

</html>