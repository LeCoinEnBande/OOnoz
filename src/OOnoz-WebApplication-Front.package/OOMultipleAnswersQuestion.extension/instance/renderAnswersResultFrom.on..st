*OOnoz-WebApplication-Front
renderAnswersResultFrom: aComponent on: html
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