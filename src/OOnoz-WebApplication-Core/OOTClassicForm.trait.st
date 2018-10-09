Trait {
	#name : #OOTClassicForm,
	#category : 'OOnoz-WebApplication-Core-Traits'
}

{ #category : #actions }
OOTClassicForm >> cancel [
	self explicitRequirement
]

{ #category : #rendering }
OOTClassicForm >> renderButtonsOn: html [
	| id |
	self renderSaveButtonOn: html.
	html space.
	self renderResetButtonOn: html.
	html space.
	id := self renderCancelButtonOn: html.
	self renderCancelModalFor: id on: html
]

{ #category : #rendering }
OOTClassicForm >> renderCancelButtonOn: html [
	| id |
	html tbsButton
		bePush;
		beDanger;
		dataToggle: 'modal';
		dataTarget: '#' , (id := html nextId);
		with: 'Annuler'.
	^ id
]

{ #category : #rendering }
OOTClassicForm >> renderCancelModalFor: id on: html [
	| titleId |
	html tbsModal
		beFade;
		tabIndex: -1;
		role: 'dialog';
		ariaLabelledBy: (titleId := html nextId);
		id: id;
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
]

{ #category : #rendering }
OOTClassicForm >> renderResetButtonOn: html [
	html tbsButton
		beWarning;
		beReset;
		with: 'Réinitialiser'
]

{ #category : #rendering }
OOTClassicForm >> renderSaveButtonOn: html [
	html tbsButton
		bePrimary;
		beSubmit;
		callback: [ self save ];
		with: 'Valider'
]

{ #category : #actions }
OOTClassicForm >> save [
	self explicitRequirement
]
