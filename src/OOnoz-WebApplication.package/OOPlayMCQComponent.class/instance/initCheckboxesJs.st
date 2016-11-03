javascript
initCheckboxesJs
	^ JSStream
		on:
			'$(".checkbox").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)})'