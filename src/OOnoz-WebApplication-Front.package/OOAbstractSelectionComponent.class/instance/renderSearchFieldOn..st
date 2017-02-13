rendering
renderSearchFieldOn: html
	html
		tbsRow: [ html
				tbsColMs: 10
				mo: 1
				with: [ html
						tbsFormGroup: [ | label |
							html label
								for: html nextId;
								tbsScreenReaderOnly;
								with: (label := self searchFieldLabel).
							html textInput
								type: 'search';
								placeholder: label;
								id: html lastId;
								onKeyUp:
									(html jQuery ajax
										callback: [ :filt | self filter: filt ] value: (JSStream on: 'event.target.value');
										onComplete:
											((html jQuery id: 'queryResult') load
												html: [ :r | self renderQueryResultContentOn: r ];
												onComplete: 'salvattore.registerGrid(document.getElementById("queryResult"))' js));
								tbsFormControl;
								value: self filter ] ] ].
						  