*OOnoz-WebApplication
renderDeleteButtonFor: anAnswer from: aComponent on: html
	self answers size > self class minimumNumberOfAnswers ifFalse: [ ^ self ].
	
	html
		tbsInputGroupButton: [ html tbsButton
				bePush;
				beDefault;
				onClick:
					((html jQuery id: (aComponent answersIdFor: self)) load
						html: [ :r | 
							self removeAnswer: anAnswer.
							aComponent renderAnswersFor: self on: r ]);
				with: [ html tbsGlyphIcon iconRemove ] ]