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
      show_econom();
      break;
    case 'CoupeCarriage':
      show_coupe();
      break;
    case 'SedentaryCarriage':
    case 'SleepCarriage':
    show_sleep_and_sedentary();
      break;
  }
}

function show_econom(){
  show_coupe();
  $('.side_top_seats').show();
  $('.side_bottom_seats').show();
}

function show_coupe(){
  show_sleep_and_sedentary();
  $('.top_seats').show();
}

function show_sleep_and_sedentary(){
  $('.bottom_seats').show();
}