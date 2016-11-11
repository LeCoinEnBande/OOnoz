tests-adding
testAddSubTheme
	| size |
	size := instance subThemes size.
	instance addSubTheme: (OOSubTheme title: 'titre du sous-theme' description: 'description du ss-theme').
	self assert: instance subThemes size equals: size + 1