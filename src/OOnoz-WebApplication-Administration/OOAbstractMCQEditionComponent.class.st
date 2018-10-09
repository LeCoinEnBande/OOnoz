Class {
	#name : #OOAbstractMCQEditionComponent,
	#superclass : #OOPage,
	#instVars : [
		'mcq',
		'questionComponents',
		'hasBeenValidated',
		'challengeComponent',
		'theme'
	],
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #action }
OOAbstractMCQEditionComponent >> activateQuestionAt: anInteger [
	(self questionComponents at: anInteger) activate
]

{ #category : #accessing }
OOAbstractMCQEditionComponent >> breadcrumpLabel [
	^ #Questionnaires
]

{ #category : #hooks }
OOAbstractMCQEditionComponent >> cancel [
	"hook"

	self answer: false
]

{ #category : #accessing }
OOAbstractMCQEditionComponent >> challengeComponent [
	^ challengeComponent
]

{ #category : #accessing }
OOAbstractMCQEditionComponent >> challengeComponent: aComponent [ 
	challengeComponent := aComponent
]

{ #category : #hooks }
OOAbstractMCQEditionComponent >> children [
	| res |
	res := OrderedCollection withAll: self questionComponents.
	res add: self challengeComponent.
	^ res asArray
]

{ #category : #accessing }
OOAbstractMCQEditionComponent >> description [
	^ 'Cet utilitaire vous permet de créer un nouveau questionnaire. D''abord, choisissez votre configuration globale, comme le prix, le type, puis  créez les 20 questions associées.'
]

{ #category : #accessing }
OOAbstractMCQEditionComponent >> hasBeenValidated [
	^ hasBeenValidated
]

{ #category : #accessing }
OOAbstractMCQEditionComponent >> hasBeenValidated: anObject [
	hasBeenValidated := anObject
]

{ #category : #javascript }
OOAbstractMCQEditionComponent >> initQuestionsScript [
	^ '$(".checkbox").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)}); autosize($(''textarea''));' js
]

{ #category : #initialization }
OOAbstractMCQEditionComponent >> initialize [
	super initialize.
	self hasBeenValidated: false.
	self challengeComponent: (OOChallengeEditionComponent owner: self)
]

{ #category : #testing }
OOAbstractMCQEditionComponent >> isActive [
	^ self questionComponents detect: [ :c | c isActive ] ifFound: [ false ] ifNone: [ true ]
]

{ #category : #testing }
OOAbstractMCQEditionComponent >> isValid [
	[ self mcq validateMCQ ]
		on: OOInvalidMCQ
		do: [ ^ false ].
	^ true
]

{ #category : #accessing }
OOAbstractMCQEditionComponent >> markingSchemes [
	^ OOAbstractMarkingSchemeStrategy allSubclasses reject: #isAbstract
]

{ #category : #accessing }
OOAbstractMCQEditionComponent >> mcq [
	^ mcq
]

{ #category : #accessing }
OOAbstractMCQEditionComponent >> mcq: anObject [
	mcq := anObject
]

{ #category : #hooks }
OOAbstractMCQEditionComponent >> modalId [
	^ #closeModal
]

{ #category : #accessing }
OOAbstractMCQEditionComponent >> moduleName [
	^ #mcq
]

{ #category : #accessing }
OOAbstractMCQEditionComponent >> orderers [
	^ OOAbstractOrder allSubclasses reject: #isAbstract
]

{ #category : #accessing }
OOAbstractMCQEditionComponent >> questionComponents [
	^ questionComponents
]

{ #category : #accessing }
OOAbstractMCQEditionComponent >> questionComponents: anObject [
	questionComponents := anObject
]

{ #category : #javascript }
OOAbstractMCQEditionComponent >> refreshBadgeOn: html [
	^ (html jQuery id: #badge) load html: [ :r | self renderValidationBadgeOn: r ]
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderBackgroundOn: html [
	^ html image
		class: 'img-responsive';
		url: self mcq backgroundMediaUrl
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderButtonsOn: html [
	html section
		tbsPullRight;
		style: 'margin: 20px;';
		with: [ self currentUser isAdmin
				ifTrue: [ html tbsButton
						beSuccess;
						beSubmit;
						callback: [ self mcq state: #active.
							self save ];
						with: 'Publier le questionnaire' ]
				ifFalse: [ html tbsButton
						beSuccess;
						beSubmit;
						callback: [ self mcq state: #undefined.
							self save ];
						with: 'Soumettre le questionnaire' ].
			html space.
			html tbsButton
				beWarning;
				beReset;
				with: 'Réinitialiser'.
			html space.
			html tbsButton
				bePush;
				beDanger;
				dataToggle: 'modal';
				dataTarget: '#' , self modalId;
				with: #Annuler ]
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderCancelModalOn: html [
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
OOAbstractMCQEditionComponent >> renderComponentOn: html [
	html
		tbsContainer: [ html
				tbsRow: [ html
						tbsColMs: 10
						mo: 1
						with: [ html
								form: [ html
										tbsPanelGroupId: #mcqCreation
										with: [ self renderMCQFormsOn: html.
											self questionComponents asArray sort do: [ :comp | html render: comp ].
											self renderButtonsOn: html ] ] ] ] ].
	self renderCancelModalOn: html.
	html document addLoadScript: '$("input.slider").slider();' js.
	html document addLoadScript: self initQuestionsScript
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderFooterOn: html [
	html
		tbsArticlePanelFooter: [ html tbsAnchor
				role: #button;
				url: '#question1';
				attributeAt: #'data-toggle' put: #collapse;
				attributeAt: #'data-parent' put: #'#mcqCreation';
				bePrimary;
				onClick: (html jQuery ajax callback: [ self activateQuestionAt: 1 ]);
				with: 'Suivant' ]
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderImageOn: html [
	^ html image
		class: 'img-responsive';
		url: self mcq themeMediaUrl
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderKindSelectionOn: html [
	html
		tbsColumn: [ html
				section: [ | group |
					group := html radioGroup.
					html div
						class: #radio;
						with: [ group radioButton
								id: html nextId;
								selected: self mcq class kind = 'E-learning';
								attributeAt: 'data-toggle' put: 'collapse';
								attributeAt: 'data-target' put: '#challengeOption.in';
								onClick:
									((html jQuery id: 'creation-challenge') load
										html: [ :r | 
											self challengeComponent desactivateChallenge.
											r render: self challengeComponent ];
										onComplete: '$("input.slider").slider();' js).
							html label
								for: html lastId;
								with: 'E-learning' ].
					html div
						class: #radio;
						with: [ group radioButton
								id: html nextId;
								selected: self mcq class kind = 'Challenge';
								attributeAt: 'data-toggle' put: 'collapse';
								attributeAt: 'data-target' put: '#challengeOption:not(.in)';
								onClick:
									((html jQuery id: 'creation-challenge') load
										html: [ :r | 
											self challengeComponent activateChallenge.
											r render: self challengeComponent ];
										onComplete: '$("input.slider").slider();' js).
							html label
								for: html lastId;
								with: 'Challenge' ] ] ]
		mediumSize: 4
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderMCQBackgroundOn: html [
	html
		tbsRow: [ html
				tbsColumn: [ html
						header: [ html heading
								level3;
								with: 'Image de fond' ].
					html
						tbsFormGroup: [ | label |
							label := 'URL d''un fond d''illustration'.
							html label
								for: html nextId;
								tbsScreenReaderOnly;
								with: label.
							html textInput
								tbsFormControl;
								id: html lastId;
								placeholder: label;
								callback: [ :url | self mcq backgroundPath: (url ifEmpty: [ nil ]) ];
								value: (self theme ifNotNil: #mediaLink);
								onChange:
									(html jQuery ajax
										serializeThis;
										onComplete: ((html jQuery id: #MCQBackground) load html: [ :r | self renderBackgroundOn: r ])) ] ]
					mediumSize: 6;
				tbsColumn: [ html section
						id: #MCQBackground;
						with: [ self renderBackgroundOn: html ] ]
					mediumSize: 6 ]
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderMCQErrorOn: html [
	self hasBeenValidated
		ifFalse: [ ^ self ].
	[ self mcq validateMCQ ]
		on: OOInvalidMCQ
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'Le QCM n''est pas valide ! '.
					html text: e reason ] ]
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderMCQFormsOn: html [
	html tbsArticlePanel
		beDefault;
		with: [ html tbsArticlePanelHeader
				id: #configurationTitle;
				parent: #'#mcqCreation';
				toggle: #collapse;
				target: 'configuration';
				ariaExpanded: true;
				ariaControles: #configuration;
				with: [ html tbsPanelTitle
						level2;
						with: [ html text: #Configuration.
							html div
								tbsPullRight;
								class: #'accordion-status';
								id: #badge;
								with: [ self renderValidationBadgeOn: html ] ] ].
			self renderMCQErrorOn: html.
			html div
				id: #configuration;
				class: #'panel-collapse';
				class: #collapse;
				class: #in if: self isActive;
				role: #tabpanel;
				with: [ html section
						class: #'panel-body';
						with: [ self renderMCQTitleAndDescriptionInputOn: html.
							self renderThemeSelectionOn: html.
							self renderMCQPriceOn: html.
							self renderMCQImageOn: html.
							self renderMCQBackgroundOn: html.
							html tbsRow: [ self renderMCQLevelOn: html ].
							html
								tbsRow: [ self renderMarkingSchemeSelectionOn: html.
									self renderMCQOrdererSelectionOn: html.
									self renderKindSelectionOn: html ].
							html
								tbsRow: [ html tbsColumn
										extraSmallSize: 12;
										with: [ html div
												id: #challengeOption;
												class: 'collapse';
												class: 'in' if: self mcq isChallenge;
												with: [ html section
														class: 'well';
														with: [ html heading
																level6;
																with: 'Options du challenge'.
															html tbsFormGroup
																id: #'creation-challenge';
																beCentered;
																with: [ html render: self challengeComponent ] ] ] ] ] ].
					self renderFooterOn: html ] ]
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderMCQImageOn: html [
	html
		tbsRow: [ html
				tbsColumn: [ html
						header: [ html heading
								level3;
								with: 'Image d''illustration' ].
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
								callback: [ :url | self mcq imagePath: (url ifEmpty: [ nil ]) ];
								value: (self theme ifNotNil: #mediaLink);
								onChange:
									(html jQuery ajax
										serializeThis;
										onComplete: ((html jQuery id: #MCQImage) load html: [ :r | self renderImageOn: r ])) ] ]
					mediumSize: 6;
				tbsColumn: [ html section
						id: #MCQImage;
						with: [ self renderImageOn: html ] ]
					mediumSize: 6 ]
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderMCQLevelOn: html [
	html
		tbsColMs: 6
		mo: 4
		with: [ html
				section: [ html heading
						level3;
						with: 'Difficulté'.
					html
						section: [ html
								tbsFormGroup: [ html textInput
										tbsFormControl;
										class: #slider;
										callback: [ :level | self mcq level: level asInteger ];
										attributeAt: 'data-provide' put: 'slider';
										attributeAt: 'data-slider-id' put: html lastId;
										attributeAt: 'data-slider-min' put: '1';
										attributeAt: 'data-slider-max' put: '5';
										attributeAt: 'data-slider-ticks' put: '[1,2,3,4,5]';
										attributeAt: 'data-slider-ticks-labels' put: '["1","2","3","4","5"]';
										attributeAt: 'data-slider-step' put: '1';
										attributeAt: 'data-slider-value' put: self mcq level asString ] ] ] ]
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderMCQOrdererSelectionOn: html [
	html
		tbsColumn: [ html
				section: [ | group |
					group := html radioGroup.
					self orderers
						do: [ :class | 
							html div
								class: #radio;
								with: [ group radioButton
										id: html nextId;
										selected: self mcq orderer = class;
										callback: [ self mcq orderer: class ].
									html label
										for: html lastId;
										with: class label ] ] ] ]
		mediumSize: 4
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderMCQPriceOn: html [
	html
		tbsFormGroup: [ | label |
			label := 'Prix (en crédit)'.
			html label
				for: html nextId;
				tbsScreenReaderOnly;
				with: label.
			html numberInput
				tbsFormControl;
				id: html lastId;
				placeholder: label;
				required;
				callback: [ :price | self mcq price: price asInteger ];
				min: 0;
				max: 20;
				value: self mcq price asString ]
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderMCQTitleAndDescriptionInputOn: html [
	html
		tbsFormGroup: [ | label |
			label := 'Titre du questionnaire'.
			html label
				for: html nextId;
				tbsScreenReaderOnly;
				with: label.
			html textInput
				tbsFormControl;
				id: html lastId;
				required;
				placeholder: label;
				callback: [ :title | self mcq title: title ];
				onChange:
					(html jQuery ajax
						serializeThis;
						onSuccess: (self refreshBadgeOn: html));
				value: self mcq title ].
	html
		tbsFormGroup: [ | label |
			label := 'Description du questionnaire'.
			html label
				for: html nextId;
				tbsScreenReaderOnly;
				with: label.
			html textArea
				tbsFormControl;
				id: html lastId;
				placeholder: label;
				callback: [ :descr | self mcq description: descr ];
				onChange:
					(html jQuery ajax
						serializeThis;
						onSuccess: (self refreshBadgeOn: html));
				value: self mcq description;
				rows: 3 ]
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderMarkingSchemeSelectionOn: html [
	html
		tbsColumn: [ html
				section: [ | group |
					group := html radioGroup.
					self markingSchemes
						do: [ :class | 
							html div
								class: #radio;
								with: [ group radioButton
										id: html nextId;
										selected: self mcq markingScheme = class;
										callback: [ self mcq markingScheme: class ].
									html label
										tbsTooltip: class description;
										for: html lastId;
										with: class label ] ] ] ]
		mediumSize: 4
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderSubThemeSelectionOn: html [
	self theme ifNil: [ ^ self ].
	html
		tbsFormGroup: [ html multiSelect
				title: 'Sous thèmes';
				required;
				class: #selectpicker;
				attributeAt: 'data-width' put: '100%';
				list: self theme subThemes;
				labels: [ :t | t title ];
				callback: [ :t | self mcq subThemes: t ];
				onChange:
					(html jQuery ajax
						serializeThisWithHidden;
						onSuccess: (self refreshBadgeOn: html));
				selected: self mcq subThemes ]
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderThemeSelectionOn: html [
	html
		tbsRow: [ html
				tbsColumn: [ html
						tbsFormGroup: [ html select
								title: 'Thème';
								required;
								class: #selectpicker;
								attributeAt: 'data-width' put: '100%';
								list: OOTheme selectAll;
								labels: [ :t | t title ];
								callback: [ :t | 
									self mcq resetSubThemes.
									self theme: t ];
								onChange:
									(html jQuery ajax
										serializeThis;
										onComplete:
											((html jQuery id: #subThemes) load
												html: [ :r | self renderSubThemeSelectionOn: r ];
												onComplete: '$(".selectpicker").selectpicker("show")' js));
								selected: self theme ] ]
				mediumSize: 6.
			html tbsColumn
				id: #subThemes;
				mediumSize: 6;
				with: [ self renderSubThemeSelectionOn: html ] ]
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderTitleOn: html [
	html
		tbsContainer: [ html
				tbsPageHeader: [ html
						tbsRow: [ html
								tbsColMs: 10
								mo: 1
								with: [ html heading
										beCentered;
										with: self title.
									html paragraph: self description ] ] ] ]
]

{ #category : #rendering }
OOAbstractMCQEditionComponent >> renderValidationBadgeOn: html [
	html div
		class: 'text-success' if: self isValid;
		class: 'text-danger' if: self isValid not;
		with: [ (html tag: 'i')
				class: 'fa';
				class: 'fa-lg';
				class:
					(self isValid
						ifTrue: [ 'fa-check-circle-o' ]
						ifFalse: [ 'fa-times-circle-o' ]) ]
]

{ #category : #action }
OOAbstractMCQEditionComponent >> save [
	self subclassResponsibility
]

{ #category : #accessing }
OOAbstractMCQEditionComponent >> theme [
	^ self mcq theme ifNil: [ theme ]
]

{ #category : #accessing }
OOAbstractMCQEditionComponent >> theme: aTheme [ 
	theme := aTheme
]
