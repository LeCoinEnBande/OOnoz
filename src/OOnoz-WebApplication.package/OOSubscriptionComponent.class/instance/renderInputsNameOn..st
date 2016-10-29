rendering
renderInputsNameOn: html
	html
		tbsRow: [ html tbsColumn
				mediumSize: 6;
				mediumOffset: 0;
				with: [ html
						tbsFormGroup: [ | id label |
							label := 'Prenom'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html textInput
								tbsFormControl;
								id: id;
								required;
								pattern: '[a-zA-Z0-9]{3,20}';
								placeholder: label;
								callback: [ :firstName | self user firstName: firstName ];
								value: self user firstName ] ].
			html tbsColumn
				mediumSize: 6;
				mediumOffset: 0;
				with: [ html
						tbsFormGroup: [ | id label |
							label := 'Nom'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html textInput
								tbsFormControl;
								id: id;
								required;
								pattern: '[a-zA-Z0-9]{3,20}';
								placeholder: label;
								callback: [ :lastName | self user lastName: lastName ];
								value: self user lastName ] ] ]