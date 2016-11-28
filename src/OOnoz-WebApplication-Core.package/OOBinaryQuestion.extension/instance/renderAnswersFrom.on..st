*OOnoz-WebApplication-Core
renderAnswersFrom: aComponent on: html
	| radioGroup |
	radioGroup := html radioGroup.
	self sortedAnswers
		do: [ :answer | 
			html
				tbsFormGroup: [ html
						tbsInputGroup: [ html
								tbsInputGroupAddOn: [ radioGroup radioButton
										checked: (self shouldCheck: answer);
										onChange: html jQuery ajax serializeThis;
										callback: [ self answers do: #beWrong.
											answer beRight ] ].
							self renderTextInputFor: answer from: aComponent on: html ] ] ]