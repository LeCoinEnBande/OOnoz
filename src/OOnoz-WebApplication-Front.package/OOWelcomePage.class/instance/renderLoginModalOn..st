rendering
renderLoginModalOn: canvas
	canvas
		tbsModalHeader: [ canvas tbsModalCloseIcon ariaLabel: #Close.
			canvas tbsModalTitle
				level: 4;
				with: 'Connexion' ].
	^ canvas tbsModalBody: [ canvas render: self loginComp ]