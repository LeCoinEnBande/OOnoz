rendering
renderInfosOn: html
	html
		section: [ html
				tbsRow: [ html tbsColumn: [  ] mediumSize: 4.
					html
						tbsColumn: [ html article: [ html header: [ html heading: self mcq title ] ].
							html
								section: [ html
										paragraph:
											(self mcq description isEmptyOrNil
												ifTrue: [ 'Le créateur du QCM n''a pas fourni de descrption pour ce QCM.' ]) ] ]
						mediumSize: 8 ] ]