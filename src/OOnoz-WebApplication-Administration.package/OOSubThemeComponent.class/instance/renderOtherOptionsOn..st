rendering
renderOtherOptionsOn: html
	html
		section: [ html heading
				level3;
				with: 'Autres options'.
			html
				tbsFormGroup: [ | label |
					label := 'URL d''une image d''illustration'.
					html label
						for: html nextId;
						tbsScreenReaderOnly;
						with: label.
					html textArea
						tbsFormControl;
						id: html lastId;
						placeholder: label;
						callback: [ :url | self subTheme mediaLink: url ];
						value: self subTheme mediaLink;
						onChange: html jQuery ajax serializeThis;
						rows: 1 ] ]