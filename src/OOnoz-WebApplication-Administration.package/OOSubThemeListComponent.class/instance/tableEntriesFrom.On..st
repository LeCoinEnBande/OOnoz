rendering
tableEntriesFrom: subTheme On: html
	^ {subTheme title.
	subTheme description.
	[ html anchor
		callback: [ (self owner call: (OOSubThemeEditionComponent subTheme: subTheme))
				ifTrue: [ self owner message: 'Sous thème modifié.' ] ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Éditer';
				iconEdit ].
	html space.
	html anchor
		callback: [ self delete: subTheme ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Supprimer';
				iconTrash ] ]}