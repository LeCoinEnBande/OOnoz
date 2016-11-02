helpers
generateThemes
	| res |
	res := OrderedCollection new.
	res add: (OOTheme title: 'Jeux vidéos' description: 'Tout ce qui concerne les jeux vidéos').
	res add: (OOTheme title: 'Histoire' description: '').
	^ res