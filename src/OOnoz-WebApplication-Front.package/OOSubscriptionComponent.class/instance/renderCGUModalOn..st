rendering
renderCGUModalOn: html
	html
		tbsModalHeader: [ html tbsModalCloseIcon ariaLabel: 'Close'.
			html tbsModalTitle level3 with: 'Conditions générales d''utilisation' ].
	html tbsModalBody: [ html text: 'à remplir' ].
	html
		tbsModalFooter: [ html tbsButton
				dataDismiss: 'modal';
				bePush;
				with: 'Fermer' ]