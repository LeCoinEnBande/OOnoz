javascript
refreshAnswersDoing: aBlock on: html
	^ (html jQuery id: self answersId) load
		html: [ :r | 
			aBlock value.
			self renderAnswersOn: r ];
		onComplete: self initScript