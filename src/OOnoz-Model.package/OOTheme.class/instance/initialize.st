initialization
initialize
		super initialize.
		self subThemes: Set new.
		subThemes add: (OOSubTheme title: 'Default' description: 'Default subtheme')