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
								value: self theme description;
								rows: 1 ].
					html
						tbsFormGroup: [ subThemesComponents do: [ :subTheme | subTheme renderThemeFormsOn: html ] ].
					html tbsButton
						beDefault;
						callback: [ self addSubTheme ];
						with: 'Ajouter un sous-thème' ] ]