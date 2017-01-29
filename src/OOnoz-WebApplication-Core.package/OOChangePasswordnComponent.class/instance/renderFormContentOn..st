rendering
renderFormContentOn: html
	html
		tbsContainer: [ html heading
				level2;
				class: #h5;
				with: 'Changer de mot de passe'.
			html
				tbsRow: [ html
						tbsColMs: 6
						mo: 3
						with: [ self renderErrorMessageOn: html.
							self renderOldPasswordInputOn: html.
							self renderNewPasswordInputsOn: html ] ] ]