helpers
generateSubThemes
	OOTheme selectAll do: [ :each | each addSubTheme: (OOSubTheme title: 'ss thème 1' description: 'description1' theme: each) save ].
	