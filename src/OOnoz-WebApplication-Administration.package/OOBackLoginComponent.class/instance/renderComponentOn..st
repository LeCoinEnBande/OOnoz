rendering
renderComponentOn: html
	html
		article: [ html
				header: [ html heading
						beCentered;
						level: 3;
						with: 'Connexion' ].
			self renderFormOn: html ]