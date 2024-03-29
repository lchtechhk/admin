<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">

  <style type="text/css" media="all">
    .information_table {
      border-collapse: separate;
      border-spacing: 0 1em;
    }

    .information_th {
      max-width: 60px;
      min-width: 60px;

      text-align: center;
      padding: 5px;
    }

    .information_td {
      min-width: 90px;
      max-width: 90px;

      padding: 5px;
      border-bottom: 1px solid black;
    }

    .content_table {
      border: 1px solid black;
    }

    .content_table_header {
      border: 1px solid black;
      text-align: center;
      padding: 5px;
    }

    .content_table_item {
      border: 1px solid black;
      text-align: center;
      padding: 5px;
    }

    .content_table_footer {
      border: 1px solid black;
      text-align: center;
      padding: 5px;
    }
    .footer_table{
      padding: 5px;
    }
    .footer_th{
      padding: 5px;
    }
    .footer_td{
      padding: 5px;
    }
  </style>
</head>

<body style="font-size: 15px;">
  <div class="row">
    <div class="col-xs-6 col-md-6">
      <p class="bold">
        {!!$header!!}
      </p>
    </div>
    <div class="col-xs-6 col-md-6">
      <div class="text-center">
        <img style="width:200px;height:100px;" src="{!!$company_logo!!}">
      </div>
    </div>
  </div>
  <hr style="margin:5px; border: 1px solid black;">
  <div class="row">
    <div class="col-xs-12 col-md-12">
      <table class="information_table" style="width:100%;">
        <tr>
          <th class="information_th">顧客 : </th>
          <td class="information_td">1</td>
          <th class="information_th">日期 : </th>
          <td class="information_td">2</td>
          <th class="information_th">已操作時數 :</th>
          <td class="information_td">3</td>
        </tr>
        <tr>
          <th class="information_th">型號 : </th>
          <td class="information_td">4</td>
          <th class="information_th">車身號 : </th>
          <td class="information_td">5</td>
          <th class="information_th">門架類型 :</th>
          <td class="information_td">6</td>
        </tr>
      </table>
    </div>
  </div>
  <div class="row" style="margin-top:20px;">
    <div class="col-xs-12 col-md-12">
      <table class="content_table" style="width:100%;">
        <tr>
          <th class="content_table_header">No.</th>
          <th class="content_table_header">Name</th>
          <th class="content_table_header">Description</th>
          <th class="content_table_header">Qty</th>
          <th class="content_table_header">Amount</th>
        </tr>
        <tr>
          <td class="content_table_item">1</td>
          <td style="text-align:left;" class="content_table_item">A</td>
          <td style="text-align:left;" class="content_table_item">Description A</td>
          <td class="content_table_item">1</td>
          <td class="content_table_item">500</td>
        </tr><tr>
          <td class="content_table_item">2</td>
          <td style="text-align:left;" class="content_table_item">B</td>
          <td style="text-align:left;" class="content_table_item">Description B</td>
          <td class="content_table_item">1</td>
          <td class="content_table_item">500</td>
        </tr><tr>
          <td class="content_table_item">3</td>
          <td style="text-align:left;" class="content_table_item">C</td>
          <td style="text-align:left;" class="content_table_item">Description C</td>
          <td class="content_table_item">1</td>
          <td class="content_table_item">500</td>
        </tr>
        <tr>
          <td class="content_table_footer" colspan="4">Total</td>
          <td class="content_table_footer">1500</td>
        </tr>
      </table>
    </div>
  </div>
  <div class="row" style="margin-top:20px;">
    <div class="col-xs-12 col-md-12">
      <table class="footer_table" style="width:100%;">
        <tr>
          <th class="footer_th">Remark : </th>
          <td class="footer_td">NaRemarkRemarkRemarkRemarkRemarkRemarkRemarkRemarkRemarkRemarkme</td>
        </tr>
      </table>
    </div>
  </div>
</body>

</html>