updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	self flag: #todo.	"When we will have a tab logo we will put it here."
	"anHtmlRoot link
		beShortcutIcon;
		url: ."
	anHtmlRoot title: 'OOnoz'.
	anHtmlRoot stylesheet url: self configuration resourcesURL , '/css/main.css'