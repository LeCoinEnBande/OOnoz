rendering
renderMCQOrdererSelectionOn: html
	html text: 'Ordre des questions'.
	^ html tbsFormGroup
		with: [ | group |
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
								with: class label ] ] ]