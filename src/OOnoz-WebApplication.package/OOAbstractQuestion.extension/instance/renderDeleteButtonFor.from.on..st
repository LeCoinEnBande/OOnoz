*OOnoz-WebApplication
renderDeleteButtonFor: anAnswer from: aComponent on: html
	self answers size > self questionClass minimumNumberOfAnswers ifFalse: [ ^ self ].
	
	html
		tbsInputGroupButton: [ html tbsButton
				bePush;
				beDefault;
				onClick:
					((html jQuery id: (aComponent answersId)) load
						html: [ :r | 
							self removeAnswer: anAnswer.
							aComponent renderAnswersOn: r ]);
				with: [ html tbsGlyphIcon iconRemove ] ]