testing
checkDisponibility
	(self theme isNil or: [ self theme class selectOne: [ :them | (them subThemes collect: #title) includes: self title ] ]) isNotNil
		ifTrue: [ (OOUnavailableSubTheme modelObject: self reason: 'Ce thème posséde déjà un sous thème de ce nom.') signal ]