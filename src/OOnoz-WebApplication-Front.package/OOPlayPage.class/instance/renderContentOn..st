rendering
renderContentOn: html
	html
		tbsContainer: [ html text: 'Soon more...'.
			html hr.
			html tbsAnchor
				beSuccess;
				callback: [ self call: OOPlayComponent new ];
				with: 'Jouer' ]