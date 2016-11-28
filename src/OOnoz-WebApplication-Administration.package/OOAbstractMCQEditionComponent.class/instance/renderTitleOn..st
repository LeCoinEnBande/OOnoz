rendering
renderTitleOn: html
	html
		tbsContainer: [ html
				tbsPageHeader: [ html
						tbsRow: [ html tbsColumn
								mediumSize: 10;
								mediumOffset: 1;
								with: [ html heading
										beCentered;
										with: self title.
									html paragraph: self description ] ] ] ]