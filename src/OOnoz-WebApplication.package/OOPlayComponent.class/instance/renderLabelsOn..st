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
	^ html tbsLabel
		beInfo;
		with: '0 crédit'