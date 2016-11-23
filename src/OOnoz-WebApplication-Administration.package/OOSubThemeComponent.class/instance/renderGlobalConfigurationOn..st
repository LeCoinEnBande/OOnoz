rendering
renderGlobalConfigurationOn: html
	html
		header: [ html heading
				level3;
				with: 'Configuration globale' ].
	html
		section: [ html
				tbsFormGroup: [ | label |
					label := 'Titre du sous thème'.
					html label
						for: html nextId;
						tbsScreenReaderOnly;
						with: label.
					html textInput
						tbsFormControl;
						required;
						id: html lastId;
						placeholder: label;
						callback: [ :title | self subTheme title: title ];
						onChange: html jQuery ajax serializeThis;
						value: self subTheme title ].
			self renderThemeSelectionOn: html.
			html
				tbsFormGroup: [ | label |
					label := 'Description du sous thème'.
					html label
						for: html nextId;
						tbsScreenReaderOnly;
						with: label.
					html textArea
						tbsFormControl;
						id: html lastId;
						placeholder: label;
						callback: [ :description | self subTheme description: description ];
						value: self subTheme description;
						onChange: html jQuery ajax serializeThis;
						rows: 1 ] ]