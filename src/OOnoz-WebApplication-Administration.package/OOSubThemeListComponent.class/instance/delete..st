public
delete: aSubTheme
	self flag: #todo. "When we will be able to desable mcq, do it for the one with only one subtheme."
	(OOAbstractMCQ selectMany: [ :m | m subThemes includes: aSubTheme ])
		do: [ :m | 
			m removeSubTheme: aSubTheme.
			m save ].
	aSubTheme theme
		removeSubTheme: aSubTheme;
		save