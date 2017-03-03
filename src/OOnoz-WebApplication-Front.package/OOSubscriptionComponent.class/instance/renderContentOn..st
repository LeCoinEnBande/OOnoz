rendering
renderContentOn: html
	html
		tbsContainer: [ html
				tbsRow: [ html
						tbsColMs: 8
						mo: 2
						with: [ html form
								id: 'form';
								class: #'text-center';
								with: [ self renderFormContentOn: html.
									self renderButtonsOn: html ] ] ] ]