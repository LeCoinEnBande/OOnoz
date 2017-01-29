rendering
renderFormContentOn: html
	html
		tbsContainer: [ html heading
				level2;
				class: #h5;
				with: 'Informations'.
			html
				tbsRow: [ html
						tbsColMs: 6
						mo: 3
						with: [ self renderUserErrorOn: html.
							self renderInputsNameOn: html.
							self renderEmailInputOn: html.
							self renderPostalAdresseOn: html.
							self renderBirthdayOn: html.
							self renderGenderInputOn: html.
							self renderRoleInputOn: html ] ] ]