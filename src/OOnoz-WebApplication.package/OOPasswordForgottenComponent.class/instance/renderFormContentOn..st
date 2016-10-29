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
						with: [ self renderErrorOn: html.
							self renderMailInputOn: html ] ] ]