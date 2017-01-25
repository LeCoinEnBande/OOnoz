rendering
renderContentOn: html
	html
		tbsContainer: [ "html
		tbsContainer: [ self isLogged
				ifTrue: [ html text: 'Logged Screen...'.
					html hr.
					html tbsAnchor
						beSuccess;
						callback: [ self logout ];
						with: 'Deconnexion' ]
				ifFalse: [ html
						tbsRow: [ html tbsColumn: [ html render: self subscriptionComp ] mediumSize: 6.
							html tbsColumn: [ html render: self loginComp ] mediumSize: 6 ] ] ]"
			html section
				class: 'jumbotron-content';
				with: [ html heading: 'Le slogand d''OOnoz ici'.
					html paragraph: 'OOnoz est une plateform de QCM en ligne.'.
					self renderPlayButtonOn: html ] ]