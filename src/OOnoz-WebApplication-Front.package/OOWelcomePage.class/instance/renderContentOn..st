rendering
renderContentOn: html
	html
		tbsJumbotron: [ html tbsContainer
				class: 'jumbotron-content';
				with: [ html heading: 'Le slogand d''OOnoz ici'.
					html paragraph: 'OOnoz est une plateform de QCM en ligne.'.
					self renderPlayButtonOn: html ] ]