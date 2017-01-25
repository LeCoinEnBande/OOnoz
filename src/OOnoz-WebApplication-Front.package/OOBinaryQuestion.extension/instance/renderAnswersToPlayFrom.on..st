*OOnoz-WebApplication-Front
renderAnswersToPlayFrom: aComponent on: html
	| group |
	group := html radioGroup.
	self orderedAnswers
		do: [ :answer | 
			html div
				class: 'checkbox';
				with: [ group radioButton
						checked: (aComponent resultAt: answer);
						id: html nextId;
						callback: [ aComponent resetAnswers.	"We do this because of the ajax we can have two callback called."
							aComponent resultAt: answer put: true ];
						onChange:
							(html jQuery ajax
								serializeThis;
								onSuccess: (aComponent refreshBadgeScriptOn: html)).
					html label
						for: html lastId;
						with: answer text ] ]