*OOnoz-WebApplication
renderAnswersResultFrom: aComponent on: html
	self orderedAnswers
		do: [ :answer | 
			html div
				class: #checkbox;
				class: #'checkbox-success' if: (aComponent resultAt: answer) = answer isRight;
				class: #'checkbox-danger' if: (aComponent resultAt: answer) ~= answer isRight;
				with: [ html checkbox
						id: html nextId;
						disabled;
						value: answer isRight.
					html label
						for: html lastId;
						with: answer text ] ]