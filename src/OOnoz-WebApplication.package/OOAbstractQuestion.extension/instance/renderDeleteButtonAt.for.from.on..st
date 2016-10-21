*OOnoz-WebApplication
renderDeleteButtonAt: answerInd for: aQuestionId from: aComponent on: html
	(aComponent answersAt: aQuestionId) size > self class minimumNumberOfAnswers ifFalse: [ ^ self ].
	
	html
		tbsInputGroupButton: [ html tbsButton
				bePush;
				beDefault;
				onClick:
					((html jQuery id: (aComponent answersIdFor: aQuestionId)) load
						html: [ :r | 
							aComponent removeAnswerAt: answerInd for: aQuestionId.
							aComponent renderAnswersFor: aQuestionId on: r ]);
				with: [ html tbsGlyphIcon iconRemove ] ]