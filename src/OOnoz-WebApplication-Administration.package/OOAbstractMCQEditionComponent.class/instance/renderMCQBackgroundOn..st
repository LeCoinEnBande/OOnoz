rendering
renderMCQBackgroundOn: html
	html
		tbsRow: [ html
				tbsColumn: [ html
						header: [ html heading
								level3;
								with: 'Image de fond' ].
					html
						tbsFormGroup: [ | label |
							label := 'URL d''un fond d''illustration'.
							html label
								for: html nextId;
								tbsScreenReaderOnly;
								with: label.
							html textInput
								tbsFormControl;
								id: html lastId;
								placeholder: label;
								callback: [ :url | self mcq backgroundPath: (url ifEmpty: [ nil ]) ];
								value: (self theme ifNotNil: #mediaLink);
								onChange:
									(html jQuery ajax
										serializeThis;
										onComplete: ((html jQuery id: #MCQBackground) load html: [ :r | self renderBackgroundOn: r ])) ] ]
					mediumSize: 6;
				tbsColumn: [ html section
						id: #MCQBackground;
						with: [ self renderBackgroundOn: html ] ]
					mediumSize: 6 ]