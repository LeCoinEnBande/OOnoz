rendering
renderContentOn: html
	html tbsAnchor
		callback: [ self page call: (OOPlayComponent mcq: self scope atRandom) ];
		bePrimary;
		class: '';
		with: [ html span class: 'fa fa-random'.
			html text: ' QCM Aléatoire' ]