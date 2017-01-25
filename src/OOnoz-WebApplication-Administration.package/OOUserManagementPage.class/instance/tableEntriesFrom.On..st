rendering
tableEntriesFrom: anUser On: html
	^ {anUser displayName.
	anUser role displayName.
	anUser address.
	anUser city.
	anUser state.
	anUser country.
	anUser mail.
	[ html form
		class: 'material-switch pull-right';
		with: [ html checkbox
				id: html nextId;
				callback: [ :bool | 
					anUser
						isActivated: bool;
						save ];
				onChange: html jQuery ajax serializeThisCheckbox;
				value: anUser isActivated.
			html label
				for: html lastId;
				class: 'label-success' ] ].
	[ html anchor
		callback: [ (self call: (OOProfileComponent user: anUser))
				ifTrue: [ self message: 'Utilisateur édité.' ] ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Éditer';
				iconEdit ] ]}