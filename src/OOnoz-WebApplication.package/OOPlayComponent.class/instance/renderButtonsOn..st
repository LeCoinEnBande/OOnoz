rendering
renderButtonsOn: html
	html
		section: [ html tbsAnchor
				bePrimary;
				tbsPullRight;
				callback: [ self call: (OOPlayMCQComponent mcq: self mcq) ];
				with: #Jouer ]