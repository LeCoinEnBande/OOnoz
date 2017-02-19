rendering
renderComponentOn: html
	html
		tbsContainer: [ html
				tbsRow: [ html
						tbsColMs: 10
						mo: 2
						with: [ html tbsLabel
								bePrimary;
								with: 'Nombre de crédits restant: ' , self currentUser credits asString ] ].
			html tbsRow: [ html tbsColMs: 10 mo: 2 with: [ self renderFormOn: html ] ] ]