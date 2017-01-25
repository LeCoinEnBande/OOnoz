rendering
renderLoginDialogOn: html
	self isLogged
		ifTrue: [ ^ self ].
		
	html tbsNavItem
		style: 'cursor: pointer;';
		onClickUpdateRootDialogWith: [ :canvas | (self rootComponent instanceOf: OOWelcomePage) renderLoginModalOn: canvas ];
		with: 'Connexion'