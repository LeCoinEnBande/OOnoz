rendering
renderEmptyGenericDialogOn: html
	html tbsModal
		beFade;
		tabIndex: -1;
		role: 'dialog';
		id: self rootDialogOpenId;
		with: [ html tbsModalDialog
				role: #document;
				with: [ html tbsModalContent id: self rootDialogId ] ]