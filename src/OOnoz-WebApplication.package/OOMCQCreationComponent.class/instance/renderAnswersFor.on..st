rendering
renderAnswersFor: aQuestion on: html
	aQuestion class isAbstract ifTrue: [ ^ self ].
	
	aQuestion renderAnswersFrom: self on: html.
	self renderAddAnswerButtonFor: aQuestion on: html.
	aQuestion hasCorrection
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
								callback: [ :explanation | aQuestion correction: explanation ];
								value: aQuestion correction;
								rows: 1.
							html
								tbsInputGroupButton: [ html tbsButton
										bePush;
										beDefault;
										onClick:
											((html jQuery id: (self answersIdFor: aQuestion)) load
												html: [ :r | 
													aQuestion removeCorrection.
													self renderAnswersFor: aQuestion on: html ]);
										with: [ html tbsGlyphIcon iconRemove ] ] ] ] ]
		ifFalse: [ html tbsButton
				beInfo;
				beOutline;
				bePush;
				onClick:
					((html jQuery id: (self answersIdFor: aQuestion)) load
						html: [ :r | 
							aQuestion correction: ''.
							self renderAnswersFor: aQuestion on: html ]);
				with: 'Ajouter une correction' ]