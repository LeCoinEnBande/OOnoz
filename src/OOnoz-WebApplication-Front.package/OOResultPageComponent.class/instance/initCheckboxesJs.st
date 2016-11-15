javascript
initCheckboxesJs
	^ '$(".checkbox").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)})' js