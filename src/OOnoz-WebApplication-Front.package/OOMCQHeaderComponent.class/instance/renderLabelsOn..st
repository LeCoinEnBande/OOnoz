rendering
renderLabelsOn: html
	html tbsLabel
		bePrimary;
		with: 'ThemeTODO'.
	html space.
	html tbsLabel
		beDefault;
		with: 'SubthemeTODO'.
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
						ifFalse: [ '' ])