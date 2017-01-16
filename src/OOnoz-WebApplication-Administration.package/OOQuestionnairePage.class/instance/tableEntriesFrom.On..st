rendering
tableEntriesFrom: mcq On: html
	^ {mcq title.
	[ mcq renderThemeAndSubThemesOn: html ].
	mcq class kind.
	[ html tbsLabel
		beInfoIf: mcq price > 0;
		beDefaultIf: mcq price = 0;
		with: mcq printPrice ].
	[ | times |
	times := (OOMCQResult selectMany: [ :result | result mcq = mcq and: [ result isFinished ] ]) size.
	html tbsLabel
		beInfoIf: times > 0;
		beDangerIf: times = 0;
		with: times asString , ' fois' ].
	[ html tbsLabel
		beSuccess;
		with: 'TODO' ].
	(OOMCQRate displayRateOf: mcq).
	[ html form
		class: 'material-switch';
		with: [ html checkbox
				id: html nextId;
				callback: [ :bool | 
					mcq
						isActivated: bool;
						save ];
				onChange: html jQuery ajax serializeThisCheckbox;
				value: mcq isActivated.
			html label
				for: html lastId;
				class: 'label-success' ] ].
	[ html anchor
		callback: [ (self call: (OOMCQEditionComponent mcq: mcq))
				ifTrue: [ self message: 'QCM édité.' ] ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Éditer';
				iconEdit ] ]}