accessing
loginComp
	^ loginComp ifNil: [ loginComp := OOLoginComponent new ]