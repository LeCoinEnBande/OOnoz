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
  return ("0" + aDate.minutes).slice (-2) + ":" + ("0" + aDate.seconds).slice (-2);
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
}





/**
 * I will load X elements of a list and I will delete the previous or the next elements.
 *
 * @param start The starting element to add.
 * @param end The end element to add.
 * @param list The list to complete.
 */
function load(start, end, list) {
    var dataObj = {};
    dataObj[list.dataset.cbid] = start + ":" + end;
    $.ajax({
        url: list.dataset.url,
        type: "POST",
        data: dataObj,
        success: function (html_code) {
            var tempDiv = document.createElement("div");
            tempDiv.innerHTML = html_code;
            salvattore.appendElements(list, tempDiv.children);
        },
        error: function () {
            location.reload();
        }
    });
}

/**
 * I define a function to load more elements when we are at the beginning or at the end of the list.
 */
function initMcqSelectionScroll() {
    if ($("#queryResult").length > 0) {
        var list = $("#queryResult")[0];
        $(window).scroll(function (e) {
                // If we have less elements in the list than the max we can show, just do nothing.
                if (list.dataset.listmaxsize > list.getElementsByTagName("figure").length) {
                    var tempLastIndex;
                    if (0.8 < (($(window).scrollTop() + $(window).height()) / $("body")[0].scrollHeight)) {
                        tempLastIndex = list.getElementsByTagName("figure").length;
                        if (tempLastIndex > list.dataset.lastindexasked) {
                            //this test is to avoid asking multiple time to the server
                            list.dataset.lastindexasked = tempLastIndex;
                            load(parseInt(list.dataset.lastindexasked) + 1, parseInt(list.dataset.lastindexasked) + parseInt(list.dataset.loadingstep), list);
                        }
                    }
                }
            }
        )
    }

}

window.addEventListener("load", function () {
    initMcqSelectionScroll();
});
'