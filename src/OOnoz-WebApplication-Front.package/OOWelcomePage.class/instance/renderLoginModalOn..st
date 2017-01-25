rendering
renderLoginModalOn: html
	html
		tbsModalHeader: [ html tbsModalCloseIcon ariaLabel: #Close.
			html tbsModalTitle
				level: 4;
				with: 'Connexion' ].
	html tbsModalBody: [ html render: self loginComp ]