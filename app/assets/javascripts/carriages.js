$(document).on('turbolinks:load', function(){
    $('.seats').hide();
    type = $('#carriage_type').val();
    show_seats(type)

    $('#carriage_type').on('change', function (e) {
      $('.seats').hide();
      show_seats($(this).val());
  });
});

function show_seats(type){
  switch (type) {
    case 'EconomCarriage':
      $('.top_seats').show();
      $('.bottom_seats').show();
      $('.side_top_seats').show();
      $('.side_bottom_seats').show();
      break;
    case 'CoupeCarriage':
      $('.top_seats').show();    
      $('.bottom_seats').show();
      break;
    case 'SedentaryCarriage':
    case 'SleepCarriage':
      $('.bottom_seats').show();
      break;
  }
}