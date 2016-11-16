rendering
renderPostalAdresseOn: html
	html
		tbsRow: [ html tbsColumn
				mediumSize: 6;
				mediumOffset: 0;
				with: [ html
						tbsFormGroup: [ | id label |
							label := 'Pays'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html select
								id: id;
								required;
								list: self countries;
								callback: [ :country | self user country: country ];
								selected: self user country ] ].
			html tbsColumn
				mediumSize: 6;
				mediumOffset: 0;
				with: [ html
						tbsFormGroup: [ | id label |
							label := 'Région'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html select
								id: id;
								required;
								list: self statesList;
								callback: [ :state | self user state: state ];
								selected: self user state ] ] ].
	html
		tbsRow: [ html tbsColumn
				mediumSize: 6;
				mediumOffset: 0;
				with: [ html
						tbsFormGroup: [ | id label |
							label := 'Ville'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html textInput
								tbsFormControl;
								id: id;
								required;
								pattern: '[a-zA-Z0-9]{2,30}';
								placeholder: label;
								callback: [ :city | self user city: city ];
								value: self user city ] ].
			html tbsColumn
				mediumSize: 6;
				mediumOffset: 0;
				with: [ html
						tbsFormGroup: [ | id label |
							label := 'Code Postal'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html textInput
								tbsFormControl;
								id: id;
								required;
								pattern: '\d{2}[ ]?\d{3}';
								placeholder: label;
								callback: [ :zip | self user zip: zip ];
								value: self user zip ] ] ].
	html
		tbsFormGroup: [ | id label |
			label := 'Adresse'.
			html label
				for: (id := html nextId);
				tbsScreenReaderOnly;
				with: label.
			html textInput
				tbsFormControl;
				id: id;
				required;
				placeholder: label;
				callback: [ :address | self user address: address ];
				value: self user address ]