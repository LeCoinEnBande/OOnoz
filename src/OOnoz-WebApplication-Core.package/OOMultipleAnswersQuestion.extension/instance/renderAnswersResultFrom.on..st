*OOnoz-WebApplication-Core
renderAnswersResultFrom: aComponent on: html
	self orderedAnswers
		do: [ :answer | 
			html div
				class: 'checkbox';
				class: #'checkbox-success' if: answer isRight;
				class: #'checkbox-danger' if: ((aComponent resultAt: answer) and: [ answer isRight not ]);
				with: [ html checkbox
						id: html nextId;
						disabled;
						value: (aComponent resultAt: answer).
					html label
						for: html lastId;
						with: answer text ] ]