rendering
renderButtonOn: html
	html tbsButton
		bePrimary;
		bePush;
		onClick:
			(html jQuery ajax
				serializeForm;
				callback: [ self login ];
				onComplete: ((html jQuery id: 'connection') load html: [ :r | self renderComponentOn: r ]));
		with: 'Connexion'