$(function() {
var original_product = $("#original_product").val();
var final_price = 0;

$('#price').on('input', function(ele) {
    var price = $("#price").val();
    var price_prefix = $("#price_prefix").val();
    if(price_prefix == 'add'){
        final_price = +original_product + +price;
    }else if(price_prefix == 'substract'){
        final_price = +original_product - +price;
    }
    $("#final_price").val(final_price);
  });

  $('#price_prefix').change(function() {
    var price = $("#price").val();
    var price_prefix = $("#price_prefix").val();

    if(price_prefix == 'add'){
        final_price = +original_product + +price;
    }else if(price_prefix == 'substract'){
        final_price = +original_product - +price;
    }
    $("#final_price").val(final_price);
  });

})