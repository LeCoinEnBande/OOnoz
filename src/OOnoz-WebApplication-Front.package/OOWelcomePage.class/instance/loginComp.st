accessing
loginComp
	^ loginComp ifNil: [ loginComp := OOFrontLoginComponent new ]