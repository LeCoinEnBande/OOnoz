rendering
renderButtonsOn: html
	| modeNot |
	self selectedTheme
		ifNotNil: [ html tbsAnchor
				beDanger;
				callback: [ self selectedTheme: nil ];
				with: 'Retour aux thèmes' ]
		ifNil: [ super renderButtonsOn: html ].
	html space.
	modeNot := self mode = #thèmes
		ifTrue: [ #fournisseur ]
		ifFalse: [ #thèmes ].
	html tbsAnchor
		bePrimary;
		callback: [ self mode: modeNot.
			self selectedTheme: nil ];
		with: 'Répartition par ' , modeNot