rendering
renderFormContentOn: html
	html heading
		level2;
		class: #h5;
		with: 'Informations'.
	html
		tbsRow: [ html
				tbsColMs: 8
				mo: 2
				with: [ self renderErrorOn: html.
					self renderMailInputOn: html ] ]