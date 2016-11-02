*OOnoz-WebApplication
renderAnswersToPlayFrom: aComponent on: html
	| group |
	group := html radioGroup.
	self orderedAnswers
		do: [ :answer | 
			html div
				class: 'radio';
				with: [ | id |
					group radioButton
						selected: (aComponent result at: answer);
						id: (id := html nextId);
						callback: [ aComponent result at: answer put: true ].
					html label
						for: id;
						with: answer text ] ]