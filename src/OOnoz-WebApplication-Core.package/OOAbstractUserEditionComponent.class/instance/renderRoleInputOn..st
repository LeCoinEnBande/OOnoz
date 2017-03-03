rendering
renderRoleInputOn: html
	self currentUser can setRole
		ifFalse: [ ^ self ].
	html
		tbsColumn: [ html
				section: [ html heading
						level5;
						with: 'Role de l''utilisateur'.
					html
						section: [ | group |
							group := html radioGroup.
							OOAbstractRole
								allSubclassesDo: [ :role | 
									html div
										class: #radio;
										with: [ group radioButton
												id: html nextId;
												selected: self user role = role;
												callback: [ self user role: role ].
											html label
												for: html lastId;
												with: role displayName ] ] ] ] ]
		mediumSize: 6