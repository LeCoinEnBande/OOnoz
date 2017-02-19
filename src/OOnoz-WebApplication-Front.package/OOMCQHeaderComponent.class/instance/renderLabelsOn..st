rendering
renderLabelsOn: html
	self mcq renderThemeAndSubThemesOn: html.
	html space.
	html tbsLabel
		beSuccess;
		with: self mcq orderer label.
	html space.
	html tbsLabel
		beInfo;
		with:
			self mcq price greaseString , ' crédit'
				,
					(self mcq price > 1
						ifTrue: [ 's' ]
						ifFalse: [ '' ]).
	html space.
	html tbsLabel
		beDefault;
		class: 'difficulty-' , self mcq level asString;
		with: 'Niveau ' , self mcq level asString