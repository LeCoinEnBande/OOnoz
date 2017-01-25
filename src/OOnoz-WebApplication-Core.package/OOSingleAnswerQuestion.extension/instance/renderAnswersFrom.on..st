*OOnoz-WebApplication-Core
renderAnswersFrom: aComponent on: html
	| radioGroup |
	radioGroup := html radioGroup.
	self sortedAnswers
		do: [ :answer | 
			html
				tbsFormGroup: [ html
						tbsInputGroup: [ html tbsInputGroupAddOn
								class: #checkbox;
								with: [ radioGroup radioButton
										id: html nextId;
										onChange:
											(html jQuery ajax
												serializeThis;
												onSuccess: (aComponent refreshBadgeOn: html));
										checked: answer isRight;
										callback: [ self answers do: #beWrong.
											answer beRight ].
									self renderLabelFor: answer id: html lastId on: html ].
							self renderTextInputFor: answer from: aComponent on: html.
							self renderDeleteButtonFor: answer from: aComponent on: html ] ] ]