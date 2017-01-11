rendering
renderRoleInputOn: html
	self currentUser can setRole
		ifFalse: [ ^ self ].
	html
		tbsColumn: [ html
				section: [ html heading
						level3;
						with: 'Role de l''utilisateur'.
					html
						section: [ | group |
							group := html radioGroup.
							OOAbstractRole
								allSubclassesDo: [ :role | 
									html label
										class: #'radio-inline';
										with: [ group radioButton
												selected: self user role = role;
												callback: [ self user role: role ];
												with: role displayName ] ] ] ] ]