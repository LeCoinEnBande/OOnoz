rendering
renderFormContentOn: html
	html
		tbsContainer: [ html heading
				level2;
				class: #h5;
				with: 'Informations'.
			html
				tbsRow: [ html tbsColumn
						mediumSize: 6;
						mediumOffset: 3;
						with: [ self renderUserErrorOn: html.
							self renderInputsNameOn: html.
							self renderEmailInputOn: html.
							self renderPasswordInputsOn: html.
							self renderGenderInputOn: html ] ] ]