*OOnoz-WebApplication-Core
renderDeleteButtonFor: anAnswer from: aComponent on: html
	self answers size > self questionClass minimumNumberOfAnswers ifFalse: [ ^ self ].
	
	html
		tbsInputGroupButton: [ html tbsButton
				bePush;
				beDanger;
				beLink;
				onClick:
					((html jQuery id: (aComponent answersId)) load
						html: [ :r | 
							self removeAnswer: anAnswer.
							aComponent renderAnswersOn: r ]);
				with: [ html tbsGlyphIcon iconTrash ] ]