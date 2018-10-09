Extension { #name : #OOBinaryQuestion }

{ #category : #'*OOnoz-WebApplication-Core' }
OOBinaryQuestion class >> description [
	^ 'Question binaire: Cette question nécessite une unique réponse.'
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOBinaryQuestion class >> label [
	^ 'Question binaire'
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOBinaryQuestion >> renderAnswersFrom: aComponent on: html [
	| radioGroup |
	radioGroup := html radioGroup.
	self sortedAnswers
		do: [ :answer | 
			html
				tbsFormGroup: [ html
						tbsInputGroup: [ html tbsInputGroupAddOn
								class: 'checkbox';
								with: [ radioGroup radioButton
										checked: answer isRight;
										id: html nextId;
										onChange:
											(html jQuery ajax
												serializeThis;
												onSuccess: (aComponent refreshBadgeOn: html));
										callback: [ self answers do: #beWrong.
											answer beRight ].
									self renderLabelFor: answer id: html lastId on: html ].
							self renderTextInputFor: answer from: aComponent on: html ] ] ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOBinaryQuestion >> uiDescription [
	^ 'Une seule réponse possible'
]
