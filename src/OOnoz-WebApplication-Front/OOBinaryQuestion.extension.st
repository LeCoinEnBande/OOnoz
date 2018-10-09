Extension { #name : #OOBinaryQuestion }

{ #category : #'*OOnoz-WebApplication-Front' }
OOBinaryQuestion >> renderAnswersResultFrom: aComponent on: html [
	| group |
	group := html radioGroup.
	self sortedAnswers
		do: [ :answer | 
			| userA |
			userA := aComponent resultAt: answer.
			html div
				class: 'checkbox';
				class: #'checkbox-success' if: (userA and: [ answer isRight ]);
				class: #'checkbox-danger' if: ((userA and: [ answer isWrong ]) or: [ userA not and: [ answer isRight ] ]);
				with: [ group radioButton
						selected: userA;
						id: html nextId;
						disabled.
					html label
						for: html lastId;
						with: answer text ] ]
]

{ #category : #'*OOnoz-WebApplication-Front' }
OOBinaryQuestion >> renderAnswersSolutionFrom: aComponent on: html [
	| group |
	group := html radioGroup.
	self sortedAnswers
		do: [ :answer | 
			html div
				class: 'checkbox';
				class: #'checkbox-success' if: answer isRight;
				with: [ group radioButton
						selected: answer isRight;
						id: html nextId;
						disabled.
					html label
						for: html lastId;
						with: answer text ] ]
]

{ #category : #'*OOnoz-WebApplication-Front' }
OOBinaryQuestion >> renderAnswersToPlayFrom: aComponent on: html [
	| group |
	group := html radioGroup.
	self orderedAnswers
		do: [ :answer | 
			html div
				class: 'checkbox';
				with: [ group radioButton
						checked: (aComponent resultAt: answer);
						id: html nextId;
						callback: [ aComponent resetAnswers.	"We do this because of the ajax we can have two callback called."
							aComponent resultAt: answer put: true ];
						onChange:
							(html jQuery ajax
								serializeThis;
								onSuccess: (aComponent refreshBadgeScriptOn: html)).
					html label
						for: html lastId;
						with: answer text ] ]
]
