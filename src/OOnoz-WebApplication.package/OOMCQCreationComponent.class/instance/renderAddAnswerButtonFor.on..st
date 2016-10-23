rendering
renderAddAnswerButtonFor: aQuestion on: html
	(aQuestion class isAbstract or: [ aQuestion class maximumNumberOfAnswers = aQuestion answers size ]) ifTrue: [ ^ self ].
	
	html tbsButton
		bePrimary;
		beOutline;
		bePush;
		onClick:
			((html jQuery id: (self answersIdFor: aQuestion)) load
				html: [ :r | 
					self addEmptyAnswerAt: aQuestion.
					self renderAnswersFor: aQuestion on: html ]);
		with: 'Ajouter une réponse'