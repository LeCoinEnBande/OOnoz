*OOnoz-WebApplication-Front
renderAnswersResultFrom: aComponent on: html
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