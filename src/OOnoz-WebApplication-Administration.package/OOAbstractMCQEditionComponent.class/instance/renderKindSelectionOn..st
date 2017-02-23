rendering
renderKindSelectionOn: html
	html
		tbsColumn: [ html
				section: [ | group |
					group := html radioGroup.
					html div
						class: #radio;
						with: [ group radioButton
								id: html nextId;
								selected: self mcq class kind = 'E-learning';
								attributeAt: 'data-toggle' put: 'collapse';
								attributeAt: 'data-target' put: '#challengeOption.in';
								onClick:
									((html jQuery id: 'creation-challenge') load
										html: [ :r | 
											self challengeComponent desactivateChallenge.
											r render: self challengeComponent ];
										onComplete: '$("input.slider").slider();' js).
							html label
								for: html lastId;
								with: 'E-learning' ].
					html div
						class: #radio;
						with: [ group radioButton
								id: html nextId;
								selected: self mcq class kind = 'Challenge';
								attributeAt: 'data-toggle' put: 'collapse';
								attributeAt: 'data-target' put: '#challengeOption:not(.in)';
								onClick:
									((html jQuery id: 'creation-challenge') load
										html: [ :r | 
											self challengeComponent activateChallenge.
											r render: self challengeComponent ];
										onComplete: '$("input.slider").slider();' js).
							html label
								for: html lastId;
								with: 'Challenge' ] ] ]
		mediumSize: 4