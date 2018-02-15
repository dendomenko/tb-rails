$(document).on('turbolinks:load', function(){
    $('.find').click(function(){
        start = $('#start_station_id').val();
        end = $('#end_station_id').val();
        if (!validatie_stations(start, end)) {return false;}
    });
});

function validatie_stations(start, end) {
    if (!start || !end) {
        alert('Choose station!');
        return false;      
     }
    if (start == end) {
        alert('Choose another end station');
        return false;
    }
    return true;
}