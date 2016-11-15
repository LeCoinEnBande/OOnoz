accessing
theme: aTheme
	super theme: aTheme.
	self subThemesComponents: (theme subThemes collect: [ :subTheme | OOSubThemeComponent subTheme: subTheme ])