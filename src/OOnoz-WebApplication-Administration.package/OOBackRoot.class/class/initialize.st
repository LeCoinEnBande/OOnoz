initialization
initialize
	<oonozApplication>
	| app |
	app := WAAdmin register: self asApplicationAt: 'OOnozAdministration'.
	app preferenceAt: #sessionClass put: OOSession.
	app configuration at: #maximumAbsoluteAge put: 0.
	app configuration at: #maximumRelativeAge put: self sessionDuration.
	app addLibrary: OOLibrary