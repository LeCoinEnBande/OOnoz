rendering
renderRulesOn: html
	html
		section: [ html
				tbsRow: [ html
						tbsColumn: [ html
								article: [ html
										header: [ html heading
												level3;
												with: self mcq markingScheme label ].
									html section: [ html paragraph: '' ] ] ]
						mediumSize: 4.
					self flag: #todo.	"add kind"
					html
						tbsColumn: [ html
								article: [ html
										header: [ html heading
												level3;
												with: self mcq markingScheme label ].
									html section: [ html paragraph: '' ] ] ]
						mediumSize: 4.
					self flag: #todo.	"Have gift?"
					html
						tbsColumn: [ html
								article: [ html
										header: [ html heading
												level3;
												with: self mcq markingScheme label ].
									html section: [ html paragraph: (String loremIpsum: 500) ] ] ]
						mediumSize: 4 ] ].
	self flag: #todo	"Random question or ordered questions?"