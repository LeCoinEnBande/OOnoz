rendering
renderContentOn: html
	html
		tbsJumbotron: [ html tbsContainer
				class: 'jumbotron-content';
				with: [ self message
						ifNotNil: [ :m | 
							html tbsAlert
								beSuccess;
								with: m.
							self message: nil ].
					html heading: 'Le slogand d''OOnoz ici'.
					html paragraph: 'OOnoz est une plateform de QCM en ligne.'.
					self renderPlayButtonOn: html ] ]