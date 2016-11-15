helpers
generateThemes
	| themes |
	themes := OrderedCollection with: (OOTheme title: 'Jeux vidéos' description: 'Tout ce qui concerne les jeux vidéos') with: (OOTheme title: 'Histoire' description: '').
	themes do: [ :each | each save ].
	self generateSubThemes