accessing
navContentMap
	| pages |
	pages := OrderedDictionary with: 'À propos' -> OOWelcomePage with: 'Aide' -> OOHelpPage.
	self isLogged
		ifTrue: [ pages at: 'Jouer' put: OOPlayPage ]
		ifFalse: [ pages at: 'Inscription' put: OOSubscriptionPage ].
	^ pages