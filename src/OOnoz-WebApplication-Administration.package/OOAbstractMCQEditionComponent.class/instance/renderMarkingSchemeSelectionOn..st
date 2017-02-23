rendering
renderMarkingSchemeSelectionOn: html
	html
		tbsColumn: [ html
				section: [ | group |
					group := html radioGroup.
					self markingSchemes
						do: [ :class | 
							html div
								class: #radio;
								with: [ group radioButton
										id: html nextId;
										selected: self mcq markingScheme = class;
										callback: [ self mcq markingScheme: class ].
									html label
										tbsTooltip: class description;
										for: html lastId;
										with: class label ] ] ] ]
		mediumSize: 4