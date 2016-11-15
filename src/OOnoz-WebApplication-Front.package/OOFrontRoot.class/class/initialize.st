initialization
initialize
	<oonozApplication>
	| app |
	app := WAAdmin register: self asApplicationAt: 'OOnoz'.
	app preferenceAt: #sessionClass put: HeimdallSession.
	app configuration at: #maximumAbsoluteAge put: 0.
	app configuration at: #maximumRelativeAge put: self sessionDuration.
	app
		addLibrary: HeimdallFileLibrary;
		addLibrary: OOLibrary