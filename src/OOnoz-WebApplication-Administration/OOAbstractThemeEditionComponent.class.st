Class {
	#name : #OOAbstractThemeEditionComponent,
	#superclass : #OOPage,
	#instVars : [
		'theme',
		'hasBeenValidated'
	],
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #accessing }
OOAbstractThemeEditionComponent >> breadcrumpLabel [
	^ #Communautés
]

{ #category : #hooks }
OOAbstractThemeEditionComponent >> cancel [
	"hook"

	self answer: false
]

{ #category : #actions }
OOAbstractThemeEditionComponent >> checkValidity [
	| subThemes |
	self theme validate.
	self theme checkDisponibility.
	subThemes := self theme subThemes collect: [ :s | s title ].
	subThemes size = subThemes asSet size
		ifFalse: [ OOUnavailableSubTheme signal ]
]

{ #category : #accessing }
OOAbstractThemeEditionComponent >> description [
	^ 'Cet utilitaire vous permet de créer un thème qui pourra être utilisé pour catégoriser les questionnaires.'
]

{ #category : #accessing }
OOAbstractThemeEditionComponent >> hasBeenValidated [
	^ hasBeenValidated
]

{ #category : #accessing }
OOAbstractThemeEditionComponent >> hasBeenValidated: anObject [
	hasBeenValidated := anObject
]

{ #category : #initialization }
OOAbstractThemeEditionComponent >> initialize [
	super initialize.
	self hasBeenValidated: false
]

{ #category : #hooks }
OOAbstractThemeEditionComponent >> modalId [
	^ #closeModal
]

{ #category : #accessing }
OOAbstractThemeEditionComponent >> moduleName [
	^ #theme
]

{ #category : #rendering }
OOAbstractThemeEditionComponent >> renderButtonsOn: html [
	html tbsButton
		beSuccess;
		beSubmit;
		callback: [ self save ];
		with: 'Publier le thème'.
	html space.
	html tbsButton
		beWarning;
		beReset;
		with: 'Réinitialiser'.
	html space
]

{ #category : #rendering }
OOAbstractThemeEditionComponent >> renderCancelModalOn: html [
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
OOAbstractThemeEditionComponent >> renderComponentOn: html [
	html
		tbsContainer: [ html
				form: [ html
						article: [ self renderErrorOn: html.
							html
								tbsRow: [ html
										tbsColumn: [ self renderGlobalConfigurationOn: html.
											self renderOtherOptionsOn: html ]
										mediumSize: 8.
									html
										tbsColumn: [ html
												header: [ html heading
														level3;
														with: 'Image d''illustration' ].
											html section
												id: #themeImage;
												with: [ self renderImageOn: html ] ]
										mediumSize: 4 ].
							html
								tbsRow: [ html tbsColumn
										id: #subThemes;
										mediumSize: 10;
										mediumOffset: 2;
										with: [ self renderSubThemesOn: html ] ].
							html tbsButton
								bePush;
								beSuccess;
								onClick:
									((html jQuery id: #subThemes) load
										html: [ :r | 
											self theme addSubTheme: OOSubTheme new.
											self renderSubThemesOn: r ]);
								with: 'Ajouter un sous-thème'.
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
OOAbstractThemeEditionComponent >> renderErrorOn: html [
	self hasBeenValidated
		ifFalse: [ ^ self ].
	[ [ self checkValidity ]
		on: OOInvalidTheme , OOUnavailableTheme
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'Le thème n''est pas valide ! '.
					html text: e reason ] ] ]
		on: OOInvalidSubTheme , OOUnavailableSubTheme
		do: [ :e | "bad" ]
]

{ #category : #rendering }
OOAbstractThemeEditionComponent >> renderGlobalConfigurationOn: html [
	html
		header: [ html heading
				level3;
				with: 'Configuration globale' ].
	html
		section: [ html
				tbsFormGroup: [ | label |
					label := 'Titre du thème'.
					html label
						for: html nextId;
						tbsScreenReaderOnly;
						with: label.
					html textInput
						tbsFormControl;
						required;
						id: html lastId;
						placeholder: label;
						callback: [ :title | self theme title: title ];
						value: self theme title ].
			html
				tbsFormGroup: [ | label |
					label := 'Description du thème'.
					html label
						for: html nextId;
						tbsScreenReaderOnly;
						with: label.
					html textArea
						tbsFormControl;
						id: html lastId;
						placeholder: label;
						callback: [ :description | self theme description: description ];
						value: self theme description;
						rows: 1 ] ]
]

{ #category : #rendering }
OOAbstractThemeEditionComponent >> renderImageOn: html [
	html image
		class: 'img-responsive';
		url:
			(self theme mediaLink isEmptyOrNil
				ifTrue: [ self theme class defaultMediaLink ]
				ifFalse: [ self theme mediaLink ])
]

{ #category : #rendering }
OOAbstractThemeEditionComponent >> renderOtherOptionsOn: html [
	html
		section: [ html heading
				level3;
				with: 'Autres options'.
			html
				tbsFormGroup: [ | label |
					label := 'URL d''une image d''illustration'.
					html label
						for: html nextId;
						tbsScreenReaderOnly;
						with: label.
					html textInput
						tbsFormControl;
						id: html lastId;
						placeholder: label;
						callback: [ :url | self theme mediaLink: url ];
						value: self theme mediaLink;
						onChange:
							(html jQuery ajax
								serializeThis;
								onComplete: ((html jQuery id: #themeImage) load html: [ :r | self renderImageOn: r ])) ] ]
]

{ #category : #rendering }
OOAbstractThemeEditionComponent >> renderSubThemesOn: html [
	self theme subThemes
		doWithIndex: [ :subTheme :i | 
			html heading
				level2;
				with: 'Sous thème ' , i greaseString.
			self hasBeenValidated
				ifTrue: [ [ subTheme validate.
					((self theme subThemes collect: #title) select: [ :s | s = subTheme title ]) size = 1
						ifFalse: [ (OOUnavailableSubTheme modelObject: subTheme reason: 'Il y a deux sous thèmes avec le même titre.') signal ] ]
						on: OOInvalidSubTheme , OOUnavailableSubTheme
						do: [ :e | 
							html tbsAlert
								beDanger;
								with: [ html strong: 'Le sous thème n''est pas valide ! '.
									html text: e reason ] ] ].
			html
				render:
					((OOSubThemeComponent subTheme: subTheme)
						noThemeSelection;
						index: i;
						yourself).
			html tbsButton
				bePush;
				beDanger;
				onClick:
					((html jQuery id: #subThemes) load
						html: [ :r | 
							self theme removeSubTheme: subTheme.
							self renderSubThemesOn: r ]);
				with: 'Supprimer'.
			html hr ]
]

{ #category : #action }
OOAbstractThemeEditionComponent >> save [
	self subclassResponsibility
]

{ #category : #accessing }
OOAbstractThemeEditionComponent >> theme [
	^ theme
]

{ #category : #accessing }
OOAbstractThemeEditionComponent >> theme: anObject [
	theme := anObject
]
