rendering
renderWarningModalOn: html
	| titleId |
	html tbsModal
		beFade;
		tabIndex: -1;
		role: 'dialog';
		id: html lastId;
		ariaLabelledBy: (titleId := html nextId);
		with: [ html tbsModalDialog
				role: 'document';
				class: #'modal-sm';
				with: [ html
						tbsModalContent: [ html
								tbsModalHeader: [ html tbsModalCloseIcon ariaLabel: #Close.
									html tbsModalTitle
										level: 4;
										id: titleId;
										with: 'Voulez vous vraiment jouer ?' ].
							html tbsModalBody: 'Il ne reste plus de cadeaux à gagner.'.
							html
								tbsModalFooter: [ self renderPlayButtonOn: html.
									html tbsButton
										dataDismiss: 'modal';
										beDanger;
										bePush;
										with: 'Annuler' ] ] ] ]