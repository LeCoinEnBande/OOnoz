rendering
renderFormContentOn: html
	html
		tbsRow: [ html
				tbsColMs: 8
				mo: 2
				with: [ self renderErrorOn: html.
					self renderMailInputOn: html ] ]