rendering
renderSearchFieldOn: html
	html
		tbsContainer: [ html
				tbsRow: [ html tbsColumn
						mediumSize: 10;
						mediumOffset: 1;
						with: [ html
								form: [ html
										tbsFormGroup: [ | label |
											html label
												for: html nextId;
												tbsScreenReaderOnly;
												with: (label := 'Rechercher parmis les xxx sous-thèmes').
											html textInput
												type: 'search';
												placeholder: label;
												id: html lastId;
												tbsFormControl ] ] ] ] ]