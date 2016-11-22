javascript
oonozJs
	^ 'function getTimeRemaining(endtime){
  return timeFor(endtime - Date.parse(new Date()));
}

function timeFor(aDate){
  return { 
    "total": aDate, 
    "minutes": Math.floor( (aDate/1000/60) % 60 ), 
    "seconds": Math.floor( (aDate/1000) % 60 ) 
  };
}

function formatedOutputFor(aDate){
  var date = "";
  if(aDate.minutes < 10){
    date += "0";
  }
  date += aDate.minutes;
  date += ":";
  if(aDate.seconds < 10){
    date += "0";
  }
  date += aDate.seconds;
  return date;
}

function launchClock(questionNumber){
  var clock = $(".timer" + questionNumber);
  var panel = $("#question" + questionNumber);
  var endtime = Date.now() + (parseInt(clock.data("time"))*1000);
  var timeinterval = setInterval(function(){
    var t = getTimeRemaining(endtime);
    if(panel.hasClass("in")){
      if(t.total<=0){
        clearInterval(timeinterval);
		    clock.html("00:00");
        $(".question" + questionNumber).trigger( "click" );
      } else { 
        clock.html(formatedOutputFor(t));
      }
    } else {
      clearInterval(timeinterval);
		clock.html("00:00");
    }
    
  },1000);
}

function initalizeClock(){
  var clocks = $(".oonoz-timer").each(function(index, elem){
    var t = timeFor(parseInt(elem.dataset.time)*1000);
    elem.innerHTML = formatedOutputFor(t);
  });
}'