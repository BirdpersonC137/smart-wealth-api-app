$(document).ready(function() {    
$( "#msg" ).addClass('animated').delay( 1000 ).queue(function(next){
    $(this).children(".lead").removeClass("jumbo-p")
    $(this).addClass("fadeInDownBig");
    next();
});
$( function() {
    $( "#slider-range-min" ).slider({
      range: "min",
      value: 500000,
      min: 0,
      max: 1000000,
      step: 10000,
      slide: function( event, ui ) {
        $( "#amount" ).val(ui.value);
      }
    });
    $( "#amount" ).val( "$" + $( "#slider-range-min" ).slider( "value" ) );
  } );
  $( function() {
    $( "#slider-range-min1" ).slider({
      range: "min",
      value: 5000,
      min: 0,
      max: 25000,
      step: 500,
      slide: function( event, ui ) {
        $( "#amount1" ).val(ui.value);
      }
    });
    $( "#amount1" ).val( "$" + $( "#slider-range-min1" ).slider( "value" ) );
  } );
})
