rendering
renderComponentOn: html
	html
		tbsContainer: [ html text: 'Soon more...'.
			html hr.
			html text: 'Aléatoire: '.
			html tbsAnchor
				beSuccess;
				callback: [ self call: (OOPlayComponent mcq: (OOAbstractMCQ allActivesPlayableBy: self currentUser) atRandom) ];
				with: 'Jouer'.
			html hr.
			html
				unorderedList: [ OOAbstractMCQ allActives
						do: [ :mcq | 
							html
								listItem: [ html tbsAnchor
										beSuccess;
										callback: [ self call: (OOPlayComponent mcq: mcq) ];
										with: 'Jouer'.
									html space.
									html text: mcq title ] ] ] ]