rendering
renderKindSelectionOn: html
	html
		tbsColumn: [ html
				section: [ html heading
						level3;
						with: 'Type de questionnaire'.
					html
						section: [ | group |
							group := html radioGroup.
							(OrderedDictionary
								with: 'E-learning' -> [ self challengeComponent desactivateChallenge ]
								with: 'Challenge' -> [ self challengeComponent activateChallenge ])
								keysAndValuesDo: [ :label :block | 
									html div
										class: #radio;
										with: [ group radioButton
												id: html nextId;
												selected: self mcq class kind = label;
												onClick:
													((html jQuery id: 'creation-challenge') load
														html: [ :r | 
															block value.
															r render: self challengeComponent ];
														onComplete: '$("input.slider").slider();' js).
											html label
												for: html lastId;
												with: label ] ] ] ] ]
		mediumSize: 6