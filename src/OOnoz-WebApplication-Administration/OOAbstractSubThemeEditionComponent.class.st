Class {
	#name : #OOAbstractSubThemeEditionComponent,
	#superclass : #OOPage,
	#instVars : [
		'subTheme',
		'subThemeComponent',
		'hasBeenValidated'
	],
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #accessing }
OOAbstractSubThemeEditionComponent >> breadcrumpLabel [
	^ #Communautés
]

{ #category : #actions }
OOAbstractSubThemeEditionComponent >> cancel [
	"hook"

	self answer: false
]

{ #category : #actions }
OOAbstractSubThemeEditionComponent >> checkValidity [
	self subTheme validate.
	self subTheme checkDisponibility
]

{ #category : #hooks }
OOAbstractSubThemeEditionComponent >> children [
	^ Array with: self subThemeComponent
]

{ #category : #accessing }
OOAbstractSubThemeEditionComponent >> description [
	^ 'Cet utilitaire vous permet de créer un sous thème qui pourra être utilisé pour catégoriser les questionnaires.'
]

{ #category : #accessing }
OOAbstractSubThemeEditionComponent >> hasBeenValidated [
	^ hasBeenValidated
]

{ #category : #accessing }
OOAbstractSubThemeEditionComponent >> hasBeenValidated: anObject [
	hasBeenValidated := anObject
]

{ #category : #initialization }
OOAbstractSubThemeEditionComponent >> initialize [
	super initialize.
	self subThemeComponent: (OOSubThemeComponent subTheme: [ self subTheme ]).
	self hasBeenValidated: false
]

{ #category : #hooks }
OOAbstractSubThemeEditionComponent >> modalId [
	^ #closeModal
]

{ #category : #accessing }
OOAbstractSubThemeEditionComponent >> moduleName [
	^ #theme
]

{ #category : #rendering }
OOAbstractSubThemeEditionComponent >> renderButtonsOn: html [
	html tbsButton
		beSuccess;
		beSubmit;
		callback: [ self save ];
		with: 'Publier le sous thème'.
	html space.
	html tbsButton
		beWarning;
		beReset;
		with: 'Réinitialiser'.
	html space
]

{ #category : #rendering }
OOAbstractSubThemeEditionComponent >> renderCancelModalOn: html [
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
]

{ #category : #rendering }
OOAbstractSubThemeEditionComponent >> renderComponentOn: html [
	html
		tbsContainer: [ html
				form: [ html
						article: [ self renderErrorOn: html.
							html render: self subThemeComponent.
							html div
								tbsPullRight;
								style: 'margin: 20px;';
								with: [ self renderButtonsOn: html.
									html tbsButton
										bePush;
										beDanger;
										dataToggle: 'modal';
										dataTarget: '#' , self modalId;
										with: 'Annuler' ] ] ].
			self renderCancelModalOn: html ]
]

{ #category : #rendering }
OOAbstractSubThemeEditionComponent >> renderErrorOn: html [
	self hasBeenValidated
		ifFalse: [ ^ self ].
	[ self checkValidity ]
		on: OOInvalidSubTheme , OOUnavailableSubTheme
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'Le sous thème n''est pas valide ! '.
					html text: e reason ] ]
]

{ #category : #actions }
OOAbstractSubThemeEditionComponent >> save [
	self subclassResponsibility
]

{ #category : #accessing }
OOAbstractSubThemeEditionComponent >> subTheme [
	^ subTheme
]

{ #category : #accessing }
OOAbstractSubThemeEditionComponent >> subTheme: aSubTheme [ 
	subTheme := aSubTheme 
]

{ #category : #accessing }
OOAbstractSubThemeEditionComponent >> subThemeComponent [
	^ subThemeComponent
]

{ #category : #accessing }
OOAbstractSubThemeEditionComponent >> subThemeComponent: aSubThemeComponent [ 
	subThemeComponent := aSubThemeComponent
]
