instance creation
newInstance
	^ super newInstance
		theme: OOThemeTest new newInstance;
		yourself