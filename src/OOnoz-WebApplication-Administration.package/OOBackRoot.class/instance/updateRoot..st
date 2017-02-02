updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	self isLogged ifFalse: [ anHtmlRoot bodyAttributes addClass: 'no-padding' ]