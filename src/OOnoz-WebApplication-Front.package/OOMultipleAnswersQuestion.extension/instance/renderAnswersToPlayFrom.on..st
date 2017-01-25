*OOnoz-WebApplication-Front
renderAnswersToPlayFrom: aComponent on: html
	self orderedAnswers
		do: [ :answer | 
			html div
				class: #checkbox;
				with: [ html checkbox
						id: html nextId;
						value: (aComponent resultAt: answer);
						callback: [ :isChecked | aComponent resultAt: answer put: isChecked ];
						onChange:
							(html jQuery ajax
								serializeThisCheckbox;
								onSuccess: (aComponent refreshBadgeScriptOn: html)).
					html label
						for: html lastId;
						with: answer text ] ]