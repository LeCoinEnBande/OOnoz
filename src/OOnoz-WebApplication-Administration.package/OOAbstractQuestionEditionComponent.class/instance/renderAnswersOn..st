rendering
renderAnswersOn: html
	self question class isAbstract
		ifTrue: [ ^ self ].
	html tbsFormGroup: [ self question renderAnswersFrom: self on: html ].
	html
		tbsFormGroup: [ self renderAddAnswerButtonOn: html.
			self question hasCorrection
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
						with: 'Ajouter une correction' ] ].
	self renderExplanationInputOn: html