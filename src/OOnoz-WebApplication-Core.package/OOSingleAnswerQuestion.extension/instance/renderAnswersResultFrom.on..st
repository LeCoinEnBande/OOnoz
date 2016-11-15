*OOnoz-WebApplication-Core
renderAnswersResultFrom: aComponent on: html
	| group |
	group := html radioGroup.
	self orderedAnswers
		do: [ :answer | 
			html div
				class: 'radio';
				class: #'checkbox-success' if: answer isRight;
				class: #'checkbox-danger' if: ((aComponent resultAt: answer) and: [ answer isRight not ]);
				with: [ group radioButton
						selected: (aComponent resultAt: answer);
						id: html nextId;
						disabled.
					html label
						for: html lastId;
						with: answer text ] ]