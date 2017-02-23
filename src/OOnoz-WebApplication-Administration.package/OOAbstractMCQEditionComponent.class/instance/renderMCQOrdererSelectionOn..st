rendering
renderMCQOrdererSelectionOn: html
	html
		tbsColumn: [ html
				section: [ | group |
					group := html radioGroup.
					self orderers
						do: [ :class | 
							html div
								class: #radio;
								with: [ group radioButton
										id: html nextId;
										selected: self mcq orderer = class;
										callback: [ self mcq orderer: class ].
									html label
										for: html lastId;
										with: class label ] ] ] ]
		mediumSize: 4