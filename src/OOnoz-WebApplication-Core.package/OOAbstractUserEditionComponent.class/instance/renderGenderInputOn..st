rendering
renderGenderInputOn: html
	html
		tbsColumn: [ html
				section: [ html heading
						level5;
						with: 'Genre de l''utilisateur'.
					html
						section: [ | group |
							group := html radioGroup.
							OOUser genders
								keysAndValuesDo: [ :gender :label | 
									html div
										class: #radio;
										with: [ group radioButton
												id: html nextId;
												selected: self user gender = gender;
												callback: [ self user gender: gender ].
											html label
												for: html lastId;
												with: label ] ] ] ] ]
		mediumSize:
			(self currentUser can setRole
				ifTrue: [ 6 ]
				ifFalse: [ 12 ])