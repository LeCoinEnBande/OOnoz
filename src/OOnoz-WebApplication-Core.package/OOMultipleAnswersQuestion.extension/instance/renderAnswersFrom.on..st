*OOnoz-WebApplication-Core
renderAnswersFrom: aComponent on: html
	self sortedAnswers
		do: [ :answer | 
			html
				tbsFormGroup: [ html
						tbsInputGroup: [ html
								tbsInputGroupAddOn: [ html checkbox
										value: answer isRight;
										onChange: html jQuery ajax serializeThisWithHidden;
										callback: [ :confirmation | answer isRight: confirmation ] ].
							self renderTextInputFor: answer from: aComponent on: html.
							self renderDeleteButtonFor: answer from: aComponent on: html ] ] ]