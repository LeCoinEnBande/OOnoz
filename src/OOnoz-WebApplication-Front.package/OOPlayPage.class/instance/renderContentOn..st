rendering
renderContentOn: html
	html
		tbsContainer: [ html text: 'Soon more...'.
			html hr.
			OOAbstractMCQ selectAll
				do: [ :mcq | 
					html text: mcq title.
					html tbsAnchor
						beSuccess;
						callback: [ self call: (OOPlayComponent mcq: mcq) ];
						with: 'Jouer' ] ]