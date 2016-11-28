rendering
renderExplanationInputOn: html
	self question hasCorrection
		ifFalse: [ ^ self ].
	html
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
								with: [ html tbsGlyphIcon iconTrash ] ] ] ]