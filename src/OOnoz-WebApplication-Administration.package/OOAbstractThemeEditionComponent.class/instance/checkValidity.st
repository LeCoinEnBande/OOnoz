actions
checkValidity
	| subThemes |
	self theme validate.
	self theme checkDisponibility.
	subThemes := self theme subThemes collect: [ :s | s title ].
	subThemes size = subThemes asSet size
		ifFalse: [ OOUnavailableSubTheme signal ]