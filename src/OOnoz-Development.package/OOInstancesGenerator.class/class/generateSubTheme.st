helpers
generateSubTheme
	^ (OOSubTheme
		title: (String loremIpsum: (5 to: 30) atRandom)
		description: (String loremIpsum: (20 to: 700) atRandom))
		mediaLink: self randomImage;
		yourself