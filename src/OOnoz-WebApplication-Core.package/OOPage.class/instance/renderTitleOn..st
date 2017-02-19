rendering
renderTitleOn: html
	self title
		ifEmpty: [ html div style: 'margin-top: 20px;'.
			^ self ].
		
	html
		tbsContainer: [ html
				tbsPageHeader: [ html
						tbsRow: [ html
								tbsColMs: 10
								mo: 1
								with: [ html heading
										beCentered;
										with: self title.
									html paragraph: self description ] ] ] ]