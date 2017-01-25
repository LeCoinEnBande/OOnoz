rendering
renderFormContentOn: html
	html
		tbsRow: [ html tbsColumn
				mediumSize: 8;
				mediumOffset: 2;
				with: [ self renderErrorOn: html.
					self renderMailInputOn: html.
					self renderPasswordInputOn: html.
					self renderForgottenPasswordLinkOn: html ] ]