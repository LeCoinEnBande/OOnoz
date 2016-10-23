rendering
renderAddAnswerButtonFor: question at: anInteger answers: answers on: html
	question class maximumNumberOfAnswers = answers size ifTrue: [ ^ self ].
	
	html tbsButton
		bePrimary;
		beOutline;
		bePush;
		onClick:
			((html jQuery id: (self answersIdFor: anInteger)) load
				html: [ :r | 
					(self answersAt: anInteger) add: OOAnswer new.
					self renderAnswersFor: anInteger on: html ]);
		with: 'Ajouter une réponse'