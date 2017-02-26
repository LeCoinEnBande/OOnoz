testing
checkDisponibility
	(self class selectOne: [ :them | them title = self title ]) isNotNil
		ifTrue: [ (OOUnavailableTheme modelObject: self reason: 'Il existe déjà un thème de ce nom.')
				signal ]