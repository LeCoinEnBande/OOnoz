rendering
tableEntriesFrom: mcq On: html
	^ {mcq title.
	[ mcq renderThemeAndSubThemesOn: html ].
	mcq class kind.
	[ html tbsLabel
		beInfoIf: mcq price > 0;
		beDefaultIf: mcq price = 0;
		with: mcq printPrice ].
	[ html tbsLabel
		beDefault;
		class: 'difficulty-' , mcq level asString;
		with: mcq level asString ].
	[ | times |
	times := (OOMCQResult selectMany: [ :result | result mcq = mcq and: [ result isFinished ] ]) size.
	html tbsLabel
		beInfoIf: times > 0;
		beDangerIf: times = 0;
		with: times asString , ' fois' ].
	(OOMCQRate displayRateOf: mcq).
	[ html form
		class: 'material-switch';
		with: [ html checkbox
				id: html nextId;
				disabled: (self currentUser isAdmin not and: [ mcq state = #undefined ]);
				onTrue: [ mcq
						state: #active;
						save ]
					onFalse: [ mcq
							state: #inactive;
							save ];
				onChange: html jQuery ajax serializeThisCheckbox;
				value: mcq isActivated.
			html label
				for: html lastId;
				tbsTooltip: 'En attente de validation' if: (self currentUser isAdmin not and: [ mcq state = #undefined ]);
				class: 'label-success' ] ].
	[ html anchor
		callback: [ (self call: (OOMCQEditionComponent mcq: mcq))
				ifTrue: [ self message: 'QCM édité.' ] ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Éditer';
				iconEdit ] ]}