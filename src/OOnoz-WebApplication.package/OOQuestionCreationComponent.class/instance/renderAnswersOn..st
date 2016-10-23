rendering
renderAnswersOn: html
	self question class isAbstract ifTrue: [ ^ self ].
	
	self question renderAnswersFrom: self on: html.
	self renderAddAnswerButtonOn: html.
	self question hasCorrection
		ifTrue: [ html
				tbsFormGroup: [ html
						tbsInputGroup: [ | id label |
							label := 'Explication de la réponse'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html textArea
								tbsFormControl;
								id: id;
								placeholder: label;
								callback: [ :explanation | self question correction: explanation ];
								value: self question correction;
								rows: 1.
							html
								tbsInputGroupButton: [ html tbsButton
										bePush;
										beDefault;
										onClick:
											((html jQuery id: (self answersId)) load
												html: [ :r | 
													self question removeCorrection.
													self renderAnswersOn: html ]);
										with: [ html tbsGlyphIcon iconRemove ] ] ] ] ]
		ifFalse: [ html tbsButton
				beInfo;
				beOutline;
				bePush;
				onClick:
					((html jQuery id: (self answersId)) load
						html: [ :r | 
							self question correction: ''.
							self renderAnswersOn: html ]);
				with: 'Ajouter une correction' ]