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
	[ html tbsLabel
		beSuccess;
		with: 'TODO' ].
	[ html anchor
		callback: [ (self call: (OOThemeEditionComponent theme: theme))
				ifTrue: [ self message: 'Thème modifié.' ] ];
		with: [ html tbsGlyphIcon iconEdit ].
	html space.
	html anchor
		callback: [ self delete: theme ];
		with: [ html tbsGlyphIcon iconTrash ] ]}