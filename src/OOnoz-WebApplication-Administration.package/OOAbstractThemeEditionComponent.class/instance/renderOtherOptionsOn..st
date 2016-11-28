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
					html textInput
						tbsFormControl;
						id: html lastId;
						placeholder: label;
						callback: [ :url | self theme mediaLink: url ];
						value: self theme mediaLink;
						onChange:
							(html jQuery ajax
								serializeThis;
								onComplete: ((html jQuery id: #themeImage) load html: [ :r | self renderImageOn: r ])) ] ]