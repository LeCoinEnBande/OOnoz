rendering
renderCancelModalOn: html
	| titleId |
	html tbsModal
		beFade;
		tabIndex: -1;
		role: 'dialog';
		ariaLabelledBy: (titleId := html nextId);
		id: self modalId;
		with: [ html tbsModalDialog
				role: 'document';
				class: #'modal-sm';
				with: [ html
						tbsModalContent: [ html
								tbsModalHeader: [ html tbsModalCloseIcon ariaLabel: #Close.
									html tbsModalTitle
										level: 4;
										id: titleId;
										with: 'Voulez vous vraiment annuler ?' ].
							html
								tbsModalFooter: [ html tbsAnchor
										callback: [ self cancel ];
										beSuccess;
										with: 'Oui'.
									html tbsButton
										dataDismiss: 'modal';
										beDanger;
										bePush;
										with: 'Non' ] ] ] ]