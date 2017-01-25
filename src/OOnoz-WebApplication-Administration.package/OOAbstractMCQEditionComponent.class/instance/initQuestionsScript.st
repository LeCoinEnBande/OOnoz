javascript
initQuestionsScript
	^ '$(".checkbox").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)}); autosize($(''textarea''));' js