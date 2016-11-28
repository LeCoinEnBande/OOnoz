initialization
initialize
	super initialize.
	self subThemeComponent: (OOSubThemeComponent subTheme: [ self subTheme ]).
	self hasBeenValidated: false