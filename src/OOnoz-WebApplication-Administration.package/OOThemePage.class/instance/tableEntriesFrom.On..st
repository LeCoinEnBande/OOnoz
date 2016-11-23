rendering
tableEntriesFrom: theme On: html
	^ {theme title.
	theme description.
	[ theme subThemes
		do: [ :st | 
			html tbsLabel
				beDefault;
				with: st title.
			html space ] ].
	[ html anchor
		callback: [ (self call: (OOThemeEditionComponent theme: theme))
				ifTrue: [ self message: 'Thème modifié.' ] ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Éditer';
				iconEdit ].
	html space.
	html anchor
		callback: [ self delete: theme ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Supprimer';
				iconTrash ].
	html space.
	html tbsGlyphIcon
		class: #clickable;
		onClick:
			((html jQuery id: #'list-subthemes') load
				html: [ :r | 
					self subThemesComponent: (OOSubThemeListComponent theme: theme owner: self).
					r render: self subThemesComponent ];
				onComplete: '$("table").bootstrapTable();' js);
		tbsTooltip: 'Afficher les sous thèmes';
		iconList ]}