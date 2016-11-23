rendering
renderThemeSelectionOn: html
	html
		tbsRow: [ html
				tbsColumn: [ html
						tbsFormGroup: [ html select
								title: 'Thème';
								required;
								class: #selectpicker;
								attributeAt: 'data-width' put: '100%';
								list: OOTheme selectAll;
								labels: [ :t | t title ];
								callback: [ :t | 
									self mcq resetSubThemes.
									self theme: t ];
								onChange:
									(html jQuery ajax
										serializeThis;
										onComplete:
											((html jQuery id: #subThemes) load
												html: [ :r | self renderSubThemeSelectionOn: r ];
												onComplete: '$(".selectpicker").selectpicker("show")' js));
								selected: self theme ] ]
				mediumSize: 6.
			html tbsColumn
				id: #subThemes;
				mediumSize: 6;
				with: [ self renderSubThemeSelectionOn: html ] ]