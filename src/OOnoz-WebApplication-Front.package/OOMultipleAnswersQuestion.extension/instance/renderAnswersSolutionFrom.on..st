*OOnoz-WebApplication-Front
renderAnswersSolutionFrom: aComponent on: html
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