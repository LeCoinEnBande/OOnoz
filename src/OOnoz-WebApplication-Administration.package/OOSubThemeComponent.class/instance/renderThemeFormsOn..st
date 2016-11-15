rendering
renderThemeFormsOn: html
	html
		tbsRow: [ html tbsColumn
				mediumSize: 10;
				mediumOffset: 1;
				with: [  
					html heading level: 6; with: self subTheme title. 
					html tbsFormGroup: [ | id label |
							label := 'Titre du sous-thème'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html textArea
								tbsFormControl;
								id: id;
								placeholder: label;
								callback: [ :title | self subTheme title: title ];
								pattern: '.{5,}';
								value: self subTheme title;
								rows: 1 ].
					html
						tbsFormGroup: [ | id label |
							label := 'Description du sous-thème'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html textArea
								tbsFormControl;
								id: id;
								placeholder: label;
								callback: [ :description | self subTheme description: description ];
								pattern: '.{5,}';
								value: self subTheme description;
								rows: 1 ] ] ]