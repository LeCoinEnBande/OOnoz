*OOnoz-WebApplication-Core
renderAnswersFrom: aComponent on: html
	self sortedAnswers
		do: [ :answer | 
			html
				tbsFormGroup: [ html
						tbsInputGroup: [ html tbsInputGroupAddOn
								class: #checkbox;
								with: [ html checkbox
										value: answer isRight;
										id: html nextId;
										onChange:
											(html jQuery ajax
												serializeThisCheckbox;
												onSuccess: (aComponent refreshBadgeScriptOn: html));
										callback: [ :confirmation | answer isRight: confirmation ].
									self renderLabelFor: answer id: html lastId on: html ].
							self renderTextInputFor: answer from: aComponent on: html.
							self renderDeleteButtonFor: answer from: aComponent on: html ] ] ]