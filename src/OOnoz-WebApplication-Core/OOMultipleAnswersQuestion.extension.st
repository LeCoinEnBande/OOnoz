Extension { #name : #OOMultipleAnswersQuestion }

{ #category : #'*OOnoz-WebApplication-Core' }
OOMultipleAnswersQuestion class >> description [
	^ String
		streamContents: [ :s | 
			s
				<<
					'Question à réponse multiple: Cette question peut avoir plusieurs réponses possibles. Entre ';
				<< self minNumberOfRightAnswers;
				<< ' et ';
				<< self maxNumberOfRightAnswers;
				<< ' bonne réponse possible.' ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOMultipleAnswersQuestion class >> label [
	^ 'Réponses multiples'
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOMultipleAnswersQuestion >> renderAnswersFrom: aComponent on: html [
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
												onSuccess: (aComponent refreshBadgeOn: html));
										callback: [ :confirmation | answer isRight: confirmation ].
									self renderLabelFor: answer id: html lastId on: html ].
							self renderTextInputFor: answer from: aComponent on: html.
							self renderDeleteButtonFor: answer from: aComponent on: html ] ] ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOMultipleAnswersQuestion >> uiDescription [
	^ String
		streamContents: [ :s | 
			s
				<< 'Entre ';
				<< self minNumberOfRightAnswers;
				<< ' et ';
				<< self maxNumberOfRightAnswers;
				<< ' réponses possibles.' ]
]
