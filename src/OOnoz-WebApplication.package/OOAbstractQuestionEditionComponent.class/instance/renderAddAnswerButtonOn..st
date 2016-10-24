rendering
renderAddAnswerButtonOn: html
	self shouldRenderAddAnswerButton ifTrue: [ ^ self ].
	
	html tbsButton
		bePrimary;
		beOutline;
		bePush;
		onClick:
			((html jQuery id: self answersId) load
				html: [ :r | 
					self question addEmptyAnswer.
					self renderAnswersOn: html ]);
		with: 'Ajouter une réponse'