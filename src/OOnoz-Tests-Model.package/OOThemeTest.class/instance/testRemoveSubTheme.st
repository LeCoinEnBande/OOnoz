tests-adding
testRemoveSubTheme
	| aSubTheme sizeBeforeRemoval |
	aSubTheme := OOSubTheme title: 'test' description: 'test'.
	instance addSubTheme: aSubTheme.
	sizeBeforeRemoval := instance subThemes size.
	instance removeSubTheme: aSubTheme.
	self assert: instance subThemes size equals: sizeBeforeRemoval - 1