rendering
renderFormContentOn: html
	html heading
		level2;
		class: #h5;
		with: 'Informations'.
	html
		tbsRow: [ html tbsColumn
				mediumSize: 10;
				mediumOffset: 1;
				with: [ self renderUserErrorOn: html.
					self renderInputsNameOn: html.
					self renderEmailInputOn: html.
					self renderPostalAdresseOn: html.
					self renderPasswordInputsOn: html.
					self renderBirthdayOn: html.
					self renderGenderInputOn: html ] ]