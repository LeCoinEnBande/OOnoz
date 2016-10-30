rendering
renderFormContentOn: html
	html
		tbsContainer: [ html heading
				level2;
				class: #h5;
				with: 'Changer de mot de passe'.
			html
				tbsRow: [ html tbsColumn
						mediumSize: 6;
						mediumOffset: 3;
						with: [ self renderErrorMessageOn: html.
							self renderOldPasswordInputOn: html.
							self renderNewPasswordInputsOn: html ] ] ]