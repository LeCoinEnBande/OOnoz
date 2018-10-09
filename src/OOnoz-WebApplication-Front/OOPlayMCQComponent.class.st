Class {
	#name : #OOPlayMCQComponent,
	#superclass : #OOPage,
	#instVars : [
		'result',
		'questions'
	],
	#category : 'OOnoz-WebApplication-Front-Pages'
}

{ #category : #'instance creation' }
OOPlayMCQComponent class >> mcq: aMCQ [
	^ self new
		mcq: aMCQ;
		yourself
]

{ #category : #action }
OOPlayMCQComponent >> activateQuestionAt: anInteger [
	(self questions at: anInteger) activate
]

{ #category : #accessing }
OOPlayMCQComponent >> breadcrumpLabel [
	^ #Jouer
]

{ #category : #action }
OOPlayMCQComponent >> cancel [
	self questions do: #desactivate.	"Ensure last question played is correctly set in statistics."
	self result save.
	self answer: false
]

{ #category : #hooks }
OOPlayMCQComponent >> children [
	^ self questions asArray
]

{ #category : #accessing }
OOPlayMCQComponent >> description [
	^ ''
]

{ #category : #action }
OOPlayMCQComponent >> finish [
	self questions do: #desactivate.	"Ensure last question played is correctly set in statistics."
	self result finishAndSetEndTime.
	self result save.
	self answer: (self call: (OOResultPageComponent result: self result))
]

{ #category : #javascript }
OOPlayMCQComponent >> initCheckboxesJs [
	^ '$(".checkbox").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)})' js
]

{ #category : #initialization }
OOPlayMCQComponent >> initQuestions [
	self questions: (Array new: self mcq questions size).
	self mcq orderedQuestions
		doWithIndex:
			[ :q :i | self questions at: i put: (OOPlayQuestionComponent owner: self result: (self result questionResultFor: q) index: i) ].
	self questions first activate
]

{ #category : #accessing }
OOPlayMCQComponent >> mcq [
	^ self result mcq
]

{ #category : #accessing }
OOPlayMCQComponent >> mcq: aMCQ [
	self result: (OOMCQResult user: self currentUser mcq: aMCQ).
	self initQuestions
]

{ #category : #accessing }
OOPlayMCQComponent >> moduleName [
	^ #play
]

{ #category : #accessing }
OOPlayMCQComponent >> questions [
	^ questions
]

{ #category : #accessing }
OOPlayMCQComponent >> questions: anObject [
	questions := anObject
]

{ #category : #rendering }
OOPlayMCQComponent >> renderButtonsOn: html [
	html div
		style: 'margin: 10px;';
		with: [ html tbsAnchor
				beDanger;
				dataToggle: 'modal';
				dataTarget: '#' , html nextId;
				with: 'Quitter'.
			self renderCancelModalFor: html lastId on: html.
			html space.
			html tbsButton
				bePrimary;
				beSubmit;
				class: #question20;
				callback: [ self finish ];
				with: 'Envoyer mes réponses' ]
]

{ #category : #rendering }
OOPlayMCQComponent >> renderCancelModalFor: id on: html [
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
										beSuccess;
										with: 'Oui'.
									html tbsButton
										dataDismiss: 'modal';
										beDanger;
										bePush;
										with: 'Non' ] ] ] ]
]

{ #category : #rendering }
OOPlayMCQComponent >> renderComponentOn: html [
	(self currentUser alreadyPlayedTo: self mcq)
		ifFalse: [ self result save.
			self renderPageOn: html ]
		ifTrue: [ self mcq isChallenge
				ifTrue: [ self renderErrorOn: html ]
				ifFalse: [ self renderPageOn: html ] ]
]

{ #category : #rendering }
OOPlayMCQComponent >> renderErrorOn: html [
	html text: 'QCM déjà joué.'.
	html tbsAnchor
		callback: [ self answer: false ];
		beSuccess;
		with: 'Retour'
]

{ #category : #rendering }
OOPlayMCQComponent >> renderPageOn: html [
	html
		tbsContainer: [ html render: (OOMCQHeaderComponent mcq: self mcq) ].
	html
		tbsContainer: [ html form
				role: #form;
				with: [ html
						tbsPanelGroupId: #questionsList
						with: [ self questions do: [ :q | html render: q ] ].
					html document addLoadScript: self initCheckboxesJs.
					html
						section: [ html div
								tbsPullRight;
								with: [ self renderButtonsOn: html ] ] ] ].
	self mcq isChallenge
		ifTrue: [ html document addLoadScript: 'initalizeClock();launchClock(1);' js ]
]

{ #category : #accessing }
OOPlayMCQComponent >> result [
	^ result
]

{ #category : #accessing }
OOPlayMCQComponent >> result: anObject [
	result := anObject
]

{ #category : #accessing }
OOPlayMCQComponent >> title [
	^ #Jouer
]
