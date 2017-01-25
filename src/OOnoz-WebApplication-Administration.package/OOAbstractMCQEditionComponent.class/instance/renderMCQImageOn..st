rendering
renderMCQImageOn: html
	html
		tbsRow: [ html
				tbsColumn: [ html
						header: [ html heading
								level3;
								with: 'Image d''illustration' ].
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
								callback: [ :url | self mcq imagePath: (url ifEmpty: [ nil ]) ];
								value: self theme mediaLink;
								onChange:
									(html jQuery ajax
										serializeThis;
										onComplete: ((html jQuery id: #MCQImage) load html: [ :r | self renderImageOn: r ])) ] ]
					mediumSize: 6;
				tbsColumn: [ html section
						id: #MCQImage;
						with: [ self renderImageOn: html ] ]
					mediumSize: 6 ]