Class {
	#name : #OOPlayComponent,
	#superclass : #OOPage,
	#instVars : [
		'mcq'
	],
	#category : 'OOnoz-WebApplication-Front-Pages'
}

{ #category : #'instance creation' }
OOPlayComponent class >> mcq: aMCQ [
	^ self new
		mcq: aMCQ;
		yourself
]

{ #category : #accessing }
OOPlayComponent >> breadcrumpLabel [
	^ #Jouer
]

{ #category : #accessing }
OOPlayComponent >> description [
	^ 'Vous trouverez ici toutes les informations sur le questionnaire auquel vous vous appretez à jouer.'
]

{ #category : #accessing }
OOPlayComponent >> mcq [
	^ mcq
]

{ #category : #accessing }
OOPlayComponent >> mcq: anObject [
	mcq := anObject
]

{ #category : #accessing }
OOPlayComponent >> moduleName [
	^ #play
]

{ #category : #rendering }
OOPlayComponent >> renderButtonsOn: html [
	html section
		tbsPullRight;
		with: [ (self mcq hasGift and: [ self mcq gift remainingGifts = 0 ])
				ifTrue: [ html tbsButton
						bePrimary;
						dataToggle: 'modal';
						dataTarget: '#' , html nextId;
						disabled: ((self mcq isChallenge and: [ self currentUser alreadyPlayedTo: self mcq ]) or: [ self currentUser credits < self mcq price ]);
						with: #Jouer.
					self renderWarningModalOn: html ]
				ifFalse: [ self renderPlayButtonOn: html ].
			html space.
			html tbsAnchor
				beDanger;
				callback: [ self answer ];
				with: #Retour ]
]

{ #category : #rendering }
OOPlayComponent >> renderComponentOn: html [
	html
		tbsContainer: [ self renderInfosOn: html.
			self renderRulesOn: html.
			self renderButtonsOn: html ]
]

{ #category : #rendering }
OOPlayComponent >> renderInfosOn: html [
	html
		section: [ html
				tbsRow: [ html tbsColumn
						extraSmallSize: 3;
						with: [ html image
								class: #'img-responsive';
								url: self mcq themeMediaUrl ].
					html tbsColumn
						extraSmallSize: 9;
						with: [ html article: [ html render: (OOMCQHeaderComponent mcq: self mcq) ].
							html
								section: [ html
										paragraph:
											(self mcq description isEmptyOrNil
												ifTrue: [ 'Le créateur du QCM n''a pas fourni de descrption pour ce QCM.' ]
												ifFalse: [ self mcq description ]) ] ] ] ]
]

{ #category : #rendering }
OOPlayComponent >> renderPlayButtonOn: html [
	html tbsAnchor
		bePrimary;
		callback: [ (self mcq isChallenge and: [ self currentUser alreadyPlayedTo: self mcq ])
				ifFalse: [ self currentUser credits: self currentUser credits - self mcq price ].
			self call: (OOPlayMCQComponent mcq: self mcq) ];
		disabled: ((self mcq isChallenge and: [ self currentUser alreadyPlayedTo: self mcq ]) or: [ self currentUser credits < self mcq price ]);
		with: #Jouer
]

{ #category : #rendering }
OOPlayComponent >> renderRulesOn: html [
	html
		section: [ html
				tbsRow: [ self rulesAndDescriptions
						keysAndValuesDo: [ :title :description | 
							html
								tbsColumn: [ html
										article: [ html
												header: [ html heading
														level3;
														with: title ].
											html section: description ] ]
								mediumSize: 4 ] ] ]
]

{ #category : #rendering }
OOPlayComponent >> renderWarningModalOn: html [
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
]

{ #category : #accessing }
OOPlayComponent >> rulesAndDescriptions [
	^ OrderedDictionary
		with: self mcq markingScheme label -> self mcq markingScheme description
		with: self mcq class kind -> self mcq class kindDescription
		with: self mcq gift label -> self mcq gift labelDescription
]

{ #category : #accessing }
OOPlayComponent >> title [
	^ 'Présentation du questionnaire'
]
