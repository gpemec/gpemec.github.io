
function getRemainingTime(endTime) {
    var t = Date.parse(endTime) - Date.parse(new Date());
    var seconds = Math.floor( (t / 1000) % 60);
    var minutes = Math.floor( (t / 1000/60) % 60);
    var hours = Math.floor( (t/(1000*60*60)) % 24);
    var days = Math.floor(t/(1000*60*60*24));
        return {
          "total": t,
          "days": days,
          "hours": hours,
          "minutes": minutes,
          "seconds": seconds
              };
}

function initializeClock(id, endTime) {
  var clock = document.getElementById(id);
  var daysSpan = clock.querySelector(".days");
  var hoursSpan = clock.querySelector(".hours");
  var minutesSpan = clock.querySelector(".minutes");
  var secondsSpan = clock.querySelector(".seconds");

  function updateClock() {
    var t = getRemainingTime(endTime);

    daysSpan.innerHTML = t.days;
    hoursSpan.innerHTML = ("0" + t.hours).slice(-2);
    minutesSpan.innerHTML = ("0" + t.minutes).slice(-2);
    secondsSpan.innerHTML = ("0" + t.seconds).slice(-2);

    if (t.total <= 0) {
      clearInterval(timeinterval);
    }
  }

  updateClock();
  var timeinterval = setInterval(updateClock, 1000);
}

var deadline = new Date("Sep 05, 2020 13:00:00");
initializeClock("clock-divi", deadline);

$(document).ready(function() {
    $('.js--features').waypoint(function(direction) {
        if (direction == 'down' && screen.width <= '780' ) {
            $('nav').addClass('sticky');
        } else {
            $('nav').removeClass('sticky');
        }
   }, {  offset: "120px"
  });

    $(".js--nav-icon").click(function() {
    var nav = $(".js--main-nav");
    nav.slideToggle(200);
    var icon = $(".js--nav-icon i");
        
      if (icon.hasClass("ion-md-menu")) {
        icon.addClass("ion-md-close");
        icon.removeClass("ion-md-menu");
//          $(".js--main-nav").slideDown();
      } else {
        icon.addClass("ion-md-menu");
        icon.removeClass("ion-md-close");
      }
  });
});



