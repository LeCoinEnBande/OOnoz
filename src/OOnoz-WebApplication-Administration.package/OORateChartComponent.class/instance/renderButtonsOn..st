rendering
renderButtonsOn: html
	| modeNot |
	self selectedTheme
		ifNotNil: [ html tbsAnchor
				beDanger;
				callback: [ self selectedTheme: nil ];
				with: [ html span class: 'fa fa-arrow-up'.
					html text: ' Retour aux thèmes' ] ]
		ifNil: [ super renderButtonsOn: html ].
	html space.
	modeNot := self mode = #thèmes
		ifTrue: [ #fournisseurs ]
		ifFalse: [ #thèmes ].
	html tbsAnchor
		bePrimary;
		callback: [ self mode: modeNot.
			self selectedTheme: nil ];
		with: [ html span class: 'fa fa-repeat '.
			html text: ' Répartition par ' , modeNot ]