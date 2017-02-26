rendering
renderOptionsHookOn: html
	html render: self mcqFilter.
	html document
		addLoadScript:
			'$(".checkbox").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)});$(".material-switch").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)})'
				js