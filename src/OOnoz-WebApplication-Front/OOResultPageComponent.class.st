Class {
	#name : #OOResultPageComponent,
	#superclass : #OOPage,
	#instVars : [
		'mcqResult',
		'questions'
	],
	#category : 'OOnoz-WebApplication-Front-Pages'
}

{ #category : #'instance creation' }
OOResultPageComponent class >> result: aResult [
	^ self new
		mcqResult: aResult;
		yourself
]

{ #category : #accessing }
OOResultPageComponent >> breadcrumpLabel [
	^ #Résltats
]

{ #category : #accessing }
OOResultPageComponent >> description [
	^ ''
]

{ #category : #initialization }
OOResultPageComponent >> finish [
	self answer: true
]

{ #category : #javascript }
OOResultPageComponent >> initCheckboxesJs [
	^ '$(".checkbox").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)})' js
]

{ #category : #initialization }
OOResultPageComponent >> initQuestions [
	self questions: (Array new: self mcqResult questionResults size).
	self mcqResult questionResults
		doWithIndex:
			[ :q :i | self questions at: i put: (OOQuestionResultComponent result: q index: i) ]
]

{ #category : #accessing }
OOResultPageComponent >> mcqResult [
	^ mcqResult
]

{ #category : #accessing }
OOResultPageComponent >> mcqResult: anObject [
	mcqResult := anObject.
	self initQuestions
]

{ #category : #accessing }
OOResultPageComponent >> moduleName [
	^ #play
]

{ #category : #accessing }
OOResultPageComponent >> questions [
	^ questions
]

{ #category : #accessing }
OOResultPageComponent >> questions: anObject [
	questions := anObject
]

{ #category : #rendering }
OOResultPageComponent >> renderButtonsOn: html [
	html div
		style: 'margin: 10px;';
		with: [ html tbsAnchor
				bePrimary;
				dataToggle: 'modal';
				dataTarget: '#' , html nextId;
				with: 'Finir'.
			self renderCancelModalFor: html lastId on: html ]
]

{ #category : #rendering }
OOResultPageComponent >> renderCancelModalFor: id on: html [
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
										with: 'Voulez vous vraiment finir ?' ].
							html
								tbsModalFooter: [ html tbsAnchor
										callback: [ self finish ];
										bePrimary;
										with: 'Oui'.
									html tbsButton
										dataDismiss: 'modal';
										beDanger;
										bePush;
										with: 'Non' ] ] ] ]
]

{ #category : #rendering }
OOResultPageComponent >> renderComponentOn: html [
	html tbsContainer: [ html render: (OOMCQHeaderComponent mcq: self mcqResult mcq) ].
	html
		tbsContainer: [ self renderTitleAndDescriptionOn: html.
			self renderGlobalInfosOn: html.
			self renderRatingOn: html.
			self renderQuestionsResultsOn: html ]
]

{ #category : #rendering }
OOResultPageComponent >> renderGiftAlertOn: html [
	self mcqResult mcq hasGift
		ifFalse: [ ^ self ].
	html tbsAlert
		beInfo;
		beDismissible;
		role: #alert;
		with: [ html tbsDismissAlertButton.
			html
				strong: 'Vos réponses ont bien étés prises en compte pour le gain du cadeau. Si vous avez gagnés vous serez contactés sous peu.' ]
]

{ #category : #rendering }
OOResultPageComponent >> renderGlobalInfosOn: html [
	html
		section: [ html tbsRow
				class: #'text-center';
				with: [ html
						tbsColumn: [ html heading
								level2;
								with:
									(String
										streamContents: [ :s | 
											s << 'Score: '.
											self mcqResult printResultOn: s ]) ]
						mediumSize: 4.
					html
						tbsColumn: [ html heading
								level2;
								with: self mcqResult printDetailedResult ]
						mediumSize: 4.
					html
						tbsColumn: [ html heading
								level2;
								with:
									(String
										streamContents: [ :s | 
											| results |
											results := OOMCQResult selectMany: [ :result | result isFinished and: [ result mcq = self mcqResult mcq ] ].
											s
												<< 'Rang: ';
												<<
													((results
														select: [ :r | r result >= self mcqResult result and: [ r dateEnd < self mcqResult dateEnd ] ])
														size + 1);
												<< ' sur ';
												<< results size ]) ]
						mediumSize: 4 ] ]
]

{ #category : #rendering }
OOResultPageComponent >> renderQuestionsResultsOn: html [
	self renderGiftAlertOn: html.
	html
		tbsPanelGroupId: #questionsList
		with: [ self mcqResult mcq isChallenge
				ifTrue:
					[ html text: 'Les réponses ne sont pas disponnibles en mode challenge.' ]
				ifFalse: [ self questions do: [ :q | html render: q ] ].
			html document addLoadScript: self initCheckboxesJs.
			html
				section: [ html div
						tbsPullRight;
						with: [ self renderButtonsOn: html ] ] ]
]

{ #category : #rendering }
OOResultPageComponent >> renderRatingOn: html [
	html
		tbsRow: [ html
				tbsColMs: 8 mo: 2
				with: [ html
						form: [ html label
								for: html nextId;
								with: 'Votre note: '.
							html space.
							html hiddenInput
								class: #rating;
								id: html lastId;
								callback: [ :rate | 
									(OOMCQRate rateObjectOf: self currentUser for: self mcqResult mcq)
										rate: rate asNumber;
										save ];
								onChange: html jQuery ajax serializeThis;
								attributeAt: 'data-fractions' put: 2;
								value: (OOMCQRate rateObjectOf: self currentUser for: self mcqResult mcq) rate ] ] ]
]

{ #category : #rendering }
OOResultPageComponent >> renderTitleAndDescriptionOn: html [
	html div
		class: #'text-center';
		with: [ html heading: self title.
			html tbsRow: [ html tbsColMs: 8 mo: 2 with: [ html paragraph: 'Résultat du QCM.' ] ] ]
]

{ #category : #accessing }
OOResultPageComponent >> title [
	^ 'Résultats'
]
