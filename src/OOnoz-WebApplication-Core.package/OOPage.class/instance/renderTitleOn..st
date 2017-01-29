rendering
renderTitleOn: html
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