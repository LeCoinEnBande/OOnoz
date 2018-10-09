Class {
	#name : #OOAbstractUserEditionComponent,
	#superclass : #OOComponent,
	#traits : 'OOTClassicForm',
	#classTraits : 'OOTClassicForm classTrait',
	#instVars : [
		'hasBeenValidated',
		'user'
	],
	#category : 'OOnoz-WebApplication-Core-Components'
}

{ #category : #'instance creation' }
OOAbstractUserEditionComponent class >> user: aUser [
	^ self new
		user: aUser;
		yourself
]

{ #category : #actions }
OOAbstractUserEditionComponent >> cancel [
	self answer: false
]

{ #category : #accessing }
OOAbstractUserEditionComponent >> countries [
	^ #('France')
]

{ #category : #accessing }
OOAbstractUserEditionComponent >> hasBeenValidated [
	^ hasBeenValidated
]

{ #category : #accessing }
OOAbstractUserEditionComponent >> hasBeenValidated: anObject [
	hasBeenValidated := anObject
]

{ #category : #initialization }
OOAbstractUserEditionComponent >> initialize [
	super initialize.
	self hasBeenValidated: false
]

{ #category : #rendering }
OOAbstractUserEditionComponent >> renderBirthdayOn: html [
	html div
		class: #'input-group';
		class: #date;
		with: [ html
				tbsFormGroup: [ | id label |
					label := 'Date de naissance'.
					html label
						for: (id := html nextId);
						tbsScreenReaderOnly;
						with: label.
					html textInput
						tbsFormControl;
						id: id;
						required;
						placeholder: label;
						callback: [ :string | self user birthday: (Date fromDDMMYYY: string) ];
						value: (self user birthday ifNotNil: [ :date | date ddmmyyyy ]) ].
			html span
				class: #'input-group-addon';
				with: [ html tbsGlyphIcon class: 'glyphicon-th' ] ].
	html document
		addLoadScript:
			(JSStream
				on:
					(String
						streamContents: [ :s | 
							s
								<<
									'$(".input-group.date").datepicker({
    format: "dd/mm/yyyy",
    startDate: "01/01/1850",
    endDate: "';
								<< Date today ddmmyyyy;
								<<
									'",
    startView: 2,
    maxViewMode: 2,
    language: "fr",
    autoclose: true
});' ]))
]

{ #category : #rendering }
OOAbstractUserEditionComponent >> renderButtonsOn: html [
	html div
		tbsPullRight;
		style: 'margin: 20px;';
		with: [ | id |
			self renderSaveButtonOn: html.
			html space.
			self renderResetButtonOn: html.
			html space.
			id := self renderCancelButtonOn: html.
			self renderCancelModalFor: id on: html ]
]

{ #category : #rendering }
OOAbstractUserEditionComponent >> renderCancelButtonOn: html [
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
OOAbstractUserEditionComponent >> renderCancelModalFor: id on: html [
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
										bePrimary;
										with: 'Oui'.
									html tbsButton
										dataDismiss: 'modal';
										beDanger;
										bePush;
										with: 'Non' ] ] ] ]
]

{ #category : #rendering }
OOAbstractUserEditionComponent >> renderGenderInputOn: html [
	html
		tbsColumn: [ html
				section: [ html heading
						level5;
						with: 'Genre de l''utilisateur'.
					html
						section: [ | group |
							group := html radioGroup.
							OOUser genders
								keysAndValuesDo: [ :gender :label | 
									html div
										class: #radio;
										with: [ group radioButton
												id: html nextId;
												selected: self user gender = gender;
												callback: [ self user gender: gender ].
											html label
												for: html lastId;
												with: label ] ] ] ] ]
		mediumSize:
			(self currentUser can setRole
				ifTrue: [ 6 ]
				ifFalse: [ 12 ])
]

{ #category : #rendering }
OOAbstractUserEditionComponent >> renderInputsNameOn: html [
	html
		tbsRow: [ html
				tbsColMs: 6
				mo: 0
				with: [ html
						tbsFormGroup: [ | id label |
							label := 'Prenom'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html textInput
								tbsFormControl;
								id: id;
								required;
								pattern: '[a-zA-Z0-9]{3,20}';
								placeholder: label;
								callback: [ :firstName | self user firstName: firstName ];
								value: self user firstName ] ].
			html
				tbsColMs: 6
				mo: 0
				with: [ html
						tbsFormGroup: [ | id label |
							label := 'Nom'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html textInput
								tbsFormControl;
								id: id;
								required;
								pattern: '[a-zA-Z0-9]{3,20}';
								placeholder: label;
								callback: [ :lastName | self user lastName: lastName ];
								value: self user lastName ] ] ]
]

{ #category : #rendering }
OOAbstractUserEditionComponent >> renderPostalAdresseOn: html [
	html
		tbsRow: [ html
				tbsColMs: 6
				mo: 0
				with: [ html
						tbsFormGroup: [ | id label |
							label := 'Pays'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html select
								id: id;
								class: #selectpicker;
								attributeAt: 'data-width' put: '100%';
								required;
								list: self countries;
								callback: [ :country | self user country: country ];
								selected: self user country ] ].
			html
				tbsColMs: 6
				mo: 0
				with: [ html
						tbsFormGroup: [ | id label |
							label := 'Région'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html select
								id: id;
								class: #selectpicker;
								attributeAt: 'data-width' put: '100%';
								required;
								list: self statesList;
								callback: [ :state | self user state: state ];
								selected: self user state ] ] ].
	html
		tbsRow: [ html
				tbsColMs: 6
				mo: 0
				with: [ html
						tbsFormGroup: [ | id label |
							label := 'Ville'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html textInput
								tbsFormControl;
								id: id;
								required;
								pattern: '[a-zA-Z0-9]{2,30}';
								placeholder: label;
								callback: [ :city | self user city: city ];
								value: self user city ] ].
			html
				tbsColMs: 6
				mo: 0
				with: [ html
						tbsFormGroup: [ | id label |
							label := 'Code Postal'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html textInput
								tbsFormControl;
								id: id;
								required;
								pattern: '\d{2}[ ]?\d{3}';
								placeholder: label;
								callback: [ :zip | self user zip: zip ];
								value: self user zip ] ] ].
	html
		tbsFormGroup: [ | id label |
			label := 'Adresse'.
			html label
				for: (id := html nextId);
				tbsScreenReaderOnly;
				with: label.
			html textInput
				tbsFormControl;
				id: id;
				required;
				placeholder: label;
				callback: [ :address | self user address: address ];
				value: self user address ]
]

{ #category : #rendering }
OOAbstractUserEditionComponent >> renderResetButtonOn: html [
	html tbsButton
		beWarning;
		beReset;
		with: 'Réinitialiser'
]

{ #category : #rendering }
OOAbstractUserEditionComponent >> renderRoleInputOn: html [
	self currentUser can setRole
		ifFalse: [ ^ self ].
	html
		tbsColumn: [ html
				section: [ html heading
						level5;
						with: 'Role de l''utilisateur'.
					html
						section: [ | group |
							group := html radioGroup.
							OOAbstractRole
								allSubclassesDo: [ :role | 
									html div
										class: #radio;
										with: [ group radioButton
												id: html nextId;
												selected: self user role = role;
												callback: [ self user role: role ].
											html label
												for: html lastId;
												with: role displayName ] ] ] ] ]
		mediumSize: 6
]

{ #category : #rendering }
OOAbstractUserEditionComponent >> renderSaveButtonOn: html [
	html tbsButton
		bePrimary;
		beSubmit;
		callback: [ self save ];
		with: 'Valider'
]

{ #category : #actions }
OOAbstractUserEditionComponent >> save [
	self subclassResponsibility 
]

{ #category : #accessing }
OOAbstractUserEditionComponent >> statesList [
	^ #('Auvergne-Rhône-Alpes' 'Bourgogne-Franche-Comté' 'Bretagne' 'Centre-Val de Loire' 'Corse' 'Grand Est' 'Guadeloupe' 'Guyane' 'Hauts-de-France' 'Île-de-France' 'La Réunion' 'Martinique' 'Mayotte' 'Normandie' 'Nouvelle-Aquitaine' 'Occitanie' 'Pays de la Loire' 'Provence-Alpes-Côte d''Azur')
]

{ #category : #accessing }
OOAbstractUserEditionComponent >> user [
	^ user
]

{ #category : #accessing }
OOAbstractUserEditionComponent >> user: anObject [
	user := anObject
]
