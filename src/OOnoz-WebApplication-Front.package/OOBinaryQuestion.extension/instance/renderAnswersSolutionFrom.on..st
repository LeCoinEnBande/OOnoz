*OOnoz-WebApplication-Front
renderAnswersSolutionFrom: aComponent on: html
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