helpers
generateTheme
	| theme |
	theme := OOTheme
		title: (String loremIpsum: (5 to: 30) atRandom)
		description: (String loremIpsum: (20 to: 700) atRandom).
	theme mediaLink: self randomImage.
	(1 to: 30) atRandom timesRepeat: [ theme addSubTheme: self generateSubTheme ].
	^ theme