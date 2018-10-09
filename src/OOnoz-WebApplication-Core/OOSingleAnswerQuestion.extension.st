Extension { #name : #OOSingleAnswerQuestion }

{ #category : #'*OOnoz-WebApplication-Core' }
OOSingleAnswerQuestion class >> description [
	^ 'Question à réponse unique: Cette question nécessite une seule réponse.'
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOSingleAnswerQuestion class >> label [
	^ 'Réponse unique'
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOSingleAnswerQuestion >> renderAnswersFrom: aComponent on: html [
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
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOSingleAnswerQuestion >> uiDescription [
	^ 'Une seule réponse possible'
]
