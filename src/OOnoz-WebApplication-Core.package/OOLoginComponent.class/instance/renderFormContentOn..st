rendering
renderFormContentOn: html
	html heading
		level2;
		class: #h5;
		with: 'Informations'.
	html
		tbsRow: [ html tbsColumn
				mediumSize: 8;
				mediumOffset: 2;
				with: [ self renderErrorOn: html.
					self renderMailInputOn: html.
					self renderPasswordInputOn: html.
					self renderForgottenPasswordLinkOn: html ] ]