accessing
loginComp
	^ loginComp ifNil: [ loginComp := OOBackLoginComponent new ]