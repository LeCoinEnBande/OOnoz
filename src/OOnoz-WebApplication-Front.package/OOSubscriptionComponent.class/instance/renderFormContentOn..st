rendering
renderFormContentOn: html
	html heading
		level4;
		with: 'Informations'.
	html
		tbsRow: [ html
				tbsColMs: 10
				mo: 1
				with: [ self renderUserErrorOn: html.
					self renderInputsNameOn: html.
					self renderEmailInputOn: html.
					self renderPostalAdresseOn: html.
					self renderPasswordInputsOn: html.
					self renderBirthdayOn: html.
					self renderGenderInputOn: html.
					self renderRoleInputOn: html.
					self renderCGUOn: html ] ]