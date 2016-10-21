rendering
renderAnswersFor: anInteger on: html
	| question answers |
	question := self questionAt: anInteger.
	answers := self answersAt: anInteger.
	question
		renderAnswers: answers
		ofQuestionAt: anInteger
		from: self
		on: html.
	question class maximumNumberOfAnswers = answers size
		ifFalse: [ html tbsButton
				bePrimary;
				beOutline;
				bePush;
				onClick:
					((html jQuery id: (self answersIdFor: anInteger)) load
						html: [ :r | 
							(self answersAt: anInteger) add: OOAnswer new.
							self renderAnswersFor: anInteger on: html ]);
				with: 'Ajouter une réponse' ].
	question hasCorrection
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
								callback: [ :explanation | question correction: explanation ];
								value: question correction;
								rows: 1.
							html
								tbsInputGroupButton: [ html tbsButton
										bePush;
										beDefault;
										onClick:
											((html jQuery id: (self answersIdFor: anInteger)) load
												html: [ :r | 
													question removeCorrection.
													self renderAnswersFor: anInteger on: html ]);
										with: [ html tbsGlyphIcon iconRemove ] ] ] ] ]
		ifFalse: [ html tbsButton
				bePrimary;
				beOutline;
				bePush;
				onClick:
					((html jQuery id: (self answersIdFor: anInteger)) load
						html: [ :r | 
							question correction: ''.
							self renderAnswersFor: anInteger on: html ]);
				with: 'Ajouter une correction' ]