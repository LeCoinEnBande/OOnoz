*OOnoz-WebApplication
renderAnswersResultFrom: aComponent on: html
	| group |
	group := html radioGroup.
	self orderedAnswers
		do: [ :answer | 
			html div
				class: 'radio';
				class: #'radio-success' if: (aComponent resultAt: answer) = answer isRight;
				class: #'radio-danger' if: (aComponent resultAt: answer) ~= answer isRight;
				with: [ group radioButton
						selected: answer isRight;
						id: html nextId;
						disabled.
					html label
						for: html lastId;
						with: answer text ] ]