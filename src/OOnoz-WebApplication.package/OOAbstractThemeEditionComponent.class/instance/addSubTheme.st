adding
addSubTheme
	theme subThemes add: (OOSubTheme title: 'titre à définir' description: 'description à définir' theme: theme).
	theme save.
	self subThemesComponents: (theme subThemes collect: [ :subTheme | OOSubThemeComponent subTheme: subTheme ])
