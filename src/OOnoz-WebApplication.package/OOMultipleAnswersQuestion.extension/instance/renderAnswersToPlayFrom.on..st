*OOnoz-WebApplication
renderAnswersToPlayFrom: aComponent on: html
	self orderedAnswers
		do: [ :answer | 
			html div
				class: #checkbox;
				with: [ html checkbox
						id: html nextId;
						value: (aComponent resultAt: answer);
						callback: [ :isChecked | aComponent resultAt: answer put: isChecked ].
					html label
						for: html lastId;
						with: answer text ] ]