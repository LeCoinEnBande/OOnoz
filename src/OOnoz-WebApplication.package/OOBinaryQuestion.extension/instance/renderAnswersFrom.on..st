*OOnoz-WebApplication
renderAnswersFrom: aComponent on: html
	| radioGroup |
	radioGroup := html radioGroup.
	(self answers asArray sort: [ :a :b | a index < b index ])
		do: [ :answer | 
			html
				tbsFormGroup: [ html
						tbsInputGroup: [ html
								tbsInputGroupAddOn: [ radioGroup radioButton
										checked: (self shouldCheck: answer);
										onChange: html jQuery ajax serializeThis;
										callback: [ answer beRight ] ].
							self renderTextInputFor: answer from: aComponent on: html ] ] ]