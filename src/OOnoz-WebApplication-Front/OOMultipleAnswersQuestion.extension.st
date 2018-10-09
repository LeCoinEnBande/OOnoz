Extension { #name : #OOMultipleAnswersQuestion }

{ #category : #'*OOnoz-WebApplication-Front' }
OOMultipleAnswersQuestion >> renderAnswersResultFrom: aComponent on: html [
	self sortedAnswers
		do: [ :answer | 
			| userA |
			userA := aComponent resultAt: answer.
			html div
				class: 'checkbox';
				class: #'checkbox-success' if: (userA and: [ answer isRight ]);
				class: #'checkbox-danger' if: ((userA and: [ answer isWrong ]) or: [ userA not and: [ answer isRight ] ]);
				with: [ html checkbox
						id: html nextId;
						disabled;
						value: userA.
					html label
						for: html lastId;
						with: answer text ] ]
]

{ #category : #'*OOnoz-WebApplication-Front' }
OOMultipleAnswersQuestion >> renderAnswersSolutionFrom: aComponent on: html [
	self sortedAnswers
		do: [ :answer | 
			html div
				class: 'checkbox';
				class: #'checkbox-success' if: answer isRight;
				with: [ html checkbox
						id: html nextId;
						disabled;
						value: answer isRight.
					html label
						for: html lastId;
						with: answer text ] ]
]

{ #category : #'*OOnoz-WebApplication-Front' }
OOMultipleAnswersQuestion >> renderAnswersToPlayFrom: aComponent on: html [
	self orderedAnswers
		do: [ :answer | 
			html div
				class: #checkbox;
				with: [ html checkbox
						id: html nextId;
						value: (aComponent resultAt: answer);
						callback: [ :isChecked | aComponent resultAt: answer put: isChecked ];
						onChange:
							(html jQuery ajax
								serializeThisCheckbox;
								onSuccess: (aComponent refreshBadgeScriptOn: html)).
					html label
						for: html lastId;
						with: answer text ] ]
]
