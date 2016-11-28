tests-adding
testAddSubThemeSetThemeOfSubtheme
	| subtheme |
	subtheme := OOSubTheme title: 'titre du sous-theme' description: 'description du ss-theme'.
	instance addSubTheme: subtheme.
	self assert: subtheme theme equals: instance