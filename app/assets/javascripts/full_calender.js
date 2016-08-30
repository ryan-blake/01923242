var initialize_calendar;
initialize_calendar = function(){
  $('.calendar').each(function(){
    var calendar = $(this);
    calender.fullCalendar({});
  })
};

$(document).on('turbolinks:load', initialize_calender);
