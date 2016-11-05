*OOnoz-WebApplication
renderAnswersToPlayFrom: aComponent on: html
	| group |
	group := html radioGroup.
	self orderedAnswers
		do: [ :answer | 
			html div
				class: 'radio';
				with: [ group radioButton
						selected: (aComponent resultAt: answer);
						id: html nextId;
						callback: [ aComponent resultAt: answer put: true ].
					html label
						for: html lastId;
						with: answer text ] ]