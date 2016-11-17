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
										onChange: html jQuery ajax serializeThis;
										checked: (self shouldCheck: answer);
										callback: [ answer beRight ] ].
							self renderTextInputFor: answer from: aComponent on: html.
							self renderDeleteButtonFor: answer from: aComponent on: html ] ] ]