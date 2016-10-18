updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	self flag: #todo.	"When we will have a tab logo we will put it here."
	"anHtmlRoot link
		beShortcutIcon;
		url: ."
	anHtmlRoot meta
		responseHeaderName: 'X-UA-Compatible';
		content: 'IE=edge'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'.
	anHtmlRoot title: 'OOnoz - Des milliers de questionnaires'.
	anHtmlRoot stylesheet url: self configuration resourcesURL , '/css/main.css'