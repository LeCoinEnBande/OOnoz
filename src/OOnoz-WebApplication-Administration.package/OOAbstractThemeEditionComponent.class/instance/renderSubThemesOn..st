rendering
renderSubThemesOn: html
	self theme subThemes
		doWithIndex: [ :subTheme :i | 
			html heading
				level2;
				with: 'Sous thème ' , i greaseString.
			self hasBeenValidated
				ifTrue: [ [ subTheme validate.
					((self theme subThemes collect: #title) select: [ :s | s = subTheme title ]) size = 1
						ifFalse: [ (OOIndisponibleSubTheme modelObject: subTheme reason: 'Il y a deux sous thèmes avec le même titre.') signal ] ]
						on: OOInvalidSubTheme , OOIndisponibleSubTheme
						do: [ :e | 
							html tbsAlert
								beDanger;
								with: [ html strong: 'Le sous thème n''est pas valide ! '.
									html text: e reason ] ] ].
			html
				render:
					((OOSubThemeComponent subTheme: subTheme)
						noThemeSelection;
						index: i;
						yourself).
			html tbsButton
				bePush;
				beDanger;
				onClick:
					((html jQuery id: #subThemes) load
						html: [ :r | 
							self theme removeSubTheme: subTheme.
							self renderSubThemesOn: r ]);
				with: 'Supprimer'.
			html hr ]