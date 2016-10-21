*OOnoz-WebApplication
renderAnswers: aCollection ofQuestionAt: aQuestionId from: aComponent on: html
	| radioGroup |
	radioGroup := html radioGroup.
	aCollection
		doWithIndex: [ :answer :answerInd | 
			html
				tbsFormGroup: [ html
						tbsInputGroup: [ html
								tbsInputGroupAddOn: [ radioGroup radioButton
										onChange: html jQuery ajax serializeThis;
										checked: (answer isRight or: [ answerInd = 1 and: [ aCollection detect: [ :ans | ans isRight ] ifFound: [ false ] ifNone: [ true ] ] ]);
										callback: [ answer isRight: true ] ].
							self renderTextInputFor: answer at: answerInd on: html.
							self
								renderDeleteButtonAt: answerInd
								for: aQuestionId
								from: aComponent
								on: html ] ] ]