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
						callback:
								[ aComponent resetAnswers.	"We do this because of the ajax we can have two callback called."
							aComponent resultAt: answer put: true ];
						onChange:
							(html jQuery ajax
								serializeThis;
								onSuccess:
									((html jQuery id: aComponent badgeId) load
										html: [ :r | aComponent renderBadgesOn: r ])).
					html label
						for: html lastId;
						with: answer text ] ]