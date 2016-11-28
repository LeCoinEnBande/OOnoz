rendering
renderGlobalConfigurationOn: html
	html
		header: [ html heading
				level3;
				with: 'Configuration globale' ].
	html
		section: [ html
				tbsFormGroup: [ | label |
					label := 'Titre du thème'.
					html label
						for: html nextId;
						tbsScreenReaderOnly;
						with: label.
					html textInput
						tbsFormControl;
						required;
						id: html lastId;
						placeholder: label;
						callback: [ :title | self theme title: title ];
						value: self theme title ].
			html
				tbsFormGroup: [ | label |
					label := 'Description du thème'.
					html label
						for: html nextId;
						tbsScreenReaderOnly;
						with: label.
					html textArea
						tbsFormControl;
						id: html lastId;
						placeholder: label;
						callback: [ :description | self theme description: description ];
						value: self theme description;
						rows: 1 ] ]