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
		class: 'label-difficulty-' , mcq level asString;
		with: mcq level asString ].
	[ html anchor
		callback: [ (self call: (OOMCQEditionComponent mcq: mcq))
				ifTrue: [ self message: 'QCM édité.' ] ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Éditer';
				iconEdit ] ].
	[ html anchor
		callback: [ mcq
				state: #active;
				save ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Activer';
				iconOk ].
	html space.
	html anchor
		style: 'color: red; margin-left: 10px;';
		callback: [ mcq
				state: #inactive;
				save ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Désactiver';
				iconRemove ] ]}