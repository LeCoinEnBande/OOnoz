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
										onChange: html jQuery ajax serializeThis;
										checked: (answer isRight or: [ answer index = 1 and: [ self answers detect: [ :ans | ans isRight ] ifFound: [ false ] ifNone: [ true ] ] ]);
										callback: [ answer beRight ] ].
							self renderTextInputFor: answer from: aComponent on: html.
							self renderDeleteButtonFor: answer from: aComponent on: html ] ] ]