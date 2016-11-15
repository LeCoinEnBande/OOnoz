rendering
renderCancelModalFor: id on: html
	html tbsModal
		beFade;
		tabIndex: -1;
		role: 'dialog';
		ariaLabelledBy: html nextId;
		id: id;
		with: [ html tbsModalDialog
				role: 'document';
				class: #'modal-sm';
				with: [ html
						tbsModalContent: [ html
								tbsModalHeader: [ html tbsModalCloseIcon ariaLabel: #Close.
									html tbsModalTitle
										level: 4;
										id: html lastId;
										with: 'Voulez vous vraiment annuler ?' ].
							html
								tbsModalFooter: [ html tbsAnchor
										callback: [ self cancel ];
										beOutline;
										beSuccess;
										with: 'Oui'.
									html tbsButton
										dataDismiss: 'modal';
										beOutline;
										beDanger;
										bePush;
										with: 'Non' ] ] ] ]