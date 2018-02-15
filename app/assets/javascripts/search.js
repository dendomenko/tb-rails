$(document).ready(function(){
    $('.find').click(function(){
        start = $('#start_station_id').val();
        end = $('#end_station_id').val();
        if (!start || !end) {
           alert('Choose station!');
           return false;      
        }
        if (start == end) {
            alert('Choose another end station');
            return false;
        }
    });
});