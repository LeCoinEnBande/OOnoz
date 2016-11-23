*OOnoz-WebApplication-Core
renderThemeAndSubThemesOn: html
	html tbsLabel
		bePrimary;
		with: self theme title.
	(self subThemes first: (3 min: self subThemes size))
		do: [ :s | 
			html space.
			html tbsLabel
				beDefault;
				with: s title ].
	self subThemes size > 3
		ifFalse: [ ^ self ].
	html space.
	html tbsLabel
		beDefault;
		with: '...'