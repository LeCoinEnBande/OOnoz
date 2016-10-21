*OOnoz-WebApplication
renderAnswers: aCollection ofQuestionAt: aQuestionId from: aComponent on: html
	aCollection
		doWithIndex: [ :answer :answerInd | 
			html
				tbsFormGroup: [ html
						tbsInputGroup: [ html
								tbsInputGroupAddOn: [ html checkbox
										value: answer isRight;
										onChange: html jQuery ajax serializeThisWithHidden;
										callback: [ :confirmation | answer isRight: confirmation ] ].
							self renderTextInputFor: answer at: answerInd on: html.
							self
								renderDeleteButtonAt: answerInd
								for: aQuestionId
								from: aComponent
								on: html ] ] ]