rendering
renderThemeFormsOn: html
	html
		tbsRow: [ html tbsColumn
				mediumSize: 6;
				mediumOffset: 3;
				with: [ html
						tbsFormGroup: [ | id label |
							label := 'Titre du thème'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html textArea
								tbsFormControl;
								id: id;
								placeholder: label;
								callback: [ :title | self theme title: title ];
								pattern: '.{5,}';
								value: self theme title;
								rows: 1 ].
					html
						tbsFormGroup: [ | id label |
							label := 'Description du thème'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html textArea
								tbsFormControl;
								id: id;
								placeholder: label;
								callback: [ :description | self theme description: description ];
								pattern: '.{5,}';
								value: self theme description;
								rows: 1 ] ] ]