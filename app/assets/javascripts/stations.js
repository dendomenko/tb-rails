$(document).ready(function(){
    $('a.edit_station').click(function(e){
        e.preventDefault();
        station_id = $(this).data('stationId');

        form = $('#edit_station_' + station_id);
        title = $('#station_title_' + station_id);

        if (!$(this).hasClass('cancel')) {
          $(this).html('Cancel');
          $(this).addClass('cancel');
        } else {  
          $(this).html('Edit');
          $(this).removeClass('cancel');
        }      
        form.toggle();
        title.toggle();  
    });
});