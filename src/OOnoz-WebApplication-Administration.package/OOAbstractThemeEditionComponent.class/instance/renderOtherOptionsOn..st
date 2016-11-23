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
						callback: [ :url | self theme mediaLink: url ];
						value: self theme mediaLink;
						rows: 1 ] ]