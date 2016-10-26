tests-adding
testAddSousTheme
	| size |
	size := theme subThemes size.
	theme addSubTheme: (OOSubTheme title: 'titre du sous-theme' description: 'description du ss-theme').
	self assert: theme subThemes size equals: size + 1