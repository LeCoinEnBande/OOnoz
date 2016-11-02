*OOnoz-WebApplication
renderAnswersToPlayFrom: aComponent on: html
	self orderedAnswers
		do: [ :answer | 
			html div
				class: #checkbox;
				with: [ | id |
					html checkbox
						value: (aComponent result at: answer);
						id: (id := html nextId);
						callback: [ :isChecked | aComponent at: answer put: isChecked ].
					html label
						for: id;
						with: answer text ] ]