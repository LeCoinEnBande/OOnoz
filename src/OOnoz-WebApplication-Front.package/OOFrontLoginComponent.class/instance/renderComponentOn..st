rendering
renderComponentOn: html
	self isLogged
		ifFalse: [ self renderFormOn: html ]
		ifTrue: [ self renderWelcomeMessageOn: html ]