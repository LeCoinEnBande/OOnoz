rendering
renderAnswersOn: html
	self question class isAbstract
		ifTrue: [ ^ self ].
	self question renderAnswersFrom: self on: html.
	self renderAddAnswerButtonOn: html.
	self question hasCorrection
		ifTrue: [ html
				tbsFormGroup: [ html
						tbsInputGroup: [ | label |
							label := 'Explication de la réponse'.
							html label
								for: html nextId;
								tbsScreenReaderOnly;
								with: label.
							html textArea
								tbsFormControl;
								id: html lastId;
								placeholder: label;
								callback: [ :explanation | self question correction: explanation ];
								value: self question correction;
								rows: 1.
							html
								tbsInputGroupButton: [ html tbsButton
										bePush;
										beDanger;
										beLink;
										onClick:
											((html jQuery id: self answersId) load
												html: [ :r | 
													self question removeCorrection.
													self renderAnswersOn: html ]);
										with: [ html tbsGlyphIcon iconTrash ] ] ] ] ]
		ifFalse: [ html space.
			html tbsButton
				beInfo;
				bePush;
				onClick:
					((html jQuery id: self answersId) load
						html: [ :r | 
							self question correction: ''.
							self renderAnswersOn: html ];
						onComplete: 'autosize($(''textarea''));' js);
				with: 'Ajouter une correction' ]