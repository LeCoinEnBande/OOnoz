Class {
	#name : #OOPlayQuestionComponent,
	#superclass : #OOComponent,
	#instVars : [
		'owner',
		'result',
		'index',
		'isActive',
		'timeOfActivation'
	],
	#category : 'OOnoz-WebApplication-Front-Components'
}

{ #category : #'instance creation' }
OOPlayQuestionComponent class >> owner: aComponent result: aQuestionResult index: anInteger [
	^ self new
		owner: aComponent;
		result: aQuestionResult;
		index: anInteger;
		yourself
]

{ #category : #action }
OOPlayQuestionComponent >> activate [
	self isActive: true.
	self timeOfActivation: DateAndTime now
]

{ #category : #accessing }
OOPlayQuestionComponent >> answersId [
	^ 'questionAnswers' , self index greaseString
]

{ #category : #accessing }
OOPlayQuestionComponent >> badgeId [
	^ 'QuestionBadge' , self index greaseString
]

{ #category : #action }
OOPlayQuestionComponent >> desactivate [
	self isActive: false.
	self timeOfActivation
		ifNotNil: [ :date | 
			self result addToDuration: (DateAndTime now - date) asDuration.
			self timeOfActivation: nil ]
]

{ #category : #action }
OOPlayQuestionComponent >> headerClickAction [
	self isActive ifTrue: [ ^ self ].
	
	self owner questions
		detect: #isActive
		ifFound: [ :q | 
			q desactivate.
			self activate ]
]

{ #category : #accessing }
OOPlayQuestionComponent >> id [
	^ 'question' , self index greaseString
]

{ #category : #accessing }
OOPlayQuestionComponent >> index [
	^ index
]

{ #category : #accessing }
OOPlayQuestionComponent >> index: anObject [
	index := anObject
]

{ #category : #initialization }
OOPlayQuestionComponent >> initialize [
	super initialize.
	self desactivate
]

{ #category : #accessing }
OOPlayQuestionComponent >> isActive [
	^ isActive
]

{ #category : #accessing }
OOPlayQuestionComponent >> isActive: anObject [
	isActive := anObject
]

{ #category : #testing }
OOPlayQuestionComponent >> isLast [
	^ self index = OOMCQ maximumNumberOfQuestions
]

{ #category : #accessing }
OOPlayQuestionComponent >> mcq [
	^ self owner mcq
]

{ #category : #accessing }
OOPlayQuestionComponent >> owner [
	^ owner
]

{ #category : #accessing }
OOPlayQuestionComponent >> owner: anObject [
	owner := anObject
]

{ #category : #accessing }
OOPlayQuestionComponent >> question [
	^ self result question
]

{ #category : #javascript }
OOPlayQuestionComponent >> refreshBadgeScriptOn: html [
	^ (html jQuery id: self badgeId) load
		html: [ :r | self renderValidationBadgeOn: r ]
]

{ #category : #rendering }
OOPlayQuestionComponent >> renderAnswersOn: html [
	self question renderAnswersToPlayFrom: self on: html
]

{ #category : #rendering }
OOPlayQuestionComponent >> renderBadgesOn: html [
	html div
		tbsPullRight;
		class: #'oonoz-badges';
		with: [ self renderTimerBadgeOn: html.
			html div
				id: self badgeId;
				with: [ self renderValidationBadgeOn: html ] ]
]

{ #category : #rendering }
OOPlayQuestionComponent >> renderContentOn: html [
	html tbsArticlePanel
		beDefault;
		with: [ self renderQuestionOn: html ]
]

{ #category : #rendering }
OOPlayQuestionComponent >> renderFooterOn: html [
	html
		tbsArticlePanelFooter: [ html tbsButton
				bePush;
				onClick:
					(html jQuery ajax
						callback: [ self resetAnswers ];
						onComplete:
							(self refreshBadgeScriptOn: html)
								,
									((html jQuery id: self answersId) load
										html: [ :r | self renderAnswersOn: r ];
										onComplete: self owner initCheckboxesJs));
				beWarning;
				with: 'Effacer'.
			self renderNextQuestionButtonOn: html ]
]

{ #category : #rendering }
OOPlayQuestionComponent >> renderHeaderOn: html [
	html tbsArticlePanelHeader
		id: self titleId;
		class: #'playing-question';
		parent: #'#questionsList' if: self mcq isChallenge not;
		toggle: #collapse if: self mcq isChallenge not;
		target: self id;
		ariaExpanded: self isActive;
		ariaControles: self id;
		onClick: (html jQuery ajax callback: [ self headerClickAction ]) if: self mcq isChallenge;
		with: [ html tbsPanelTitle
				level3;
				with: [ html text: 'Question ' , self index greaseString.
					self renderBadgesOn: html ] ]
]

{ #category : #rendering }
OOPlayQuestionComponent >> renderNextQuestionButtonOn: html [
	self isLast
		ifTrue: [ ^ self ].
	html space.
	html tbsAnchor
		role: #button;
		url: '#question' , (self index + 1) greaseString;
		class: self id;
		attributeAt: #'data-toggle' put: #collapse;
		attributeAt: #'data-parent' put: #'#questionsList';
		ariaExpanded: true;
		ariaControles: self id;
		bePrimary;
		onClick:
			(html jQuery ajax
				callback: [ self desactivate.
					self owner activateQuestionAt: self index + 1 ];
				onComplete: ('launchClock(' , (self index + 1) greaseString , ')') js);
		with: 'Question suivante'
]

{ #category : #rendering }
OOPlayQuestionComponent >> renderQuestionOn: html [
	self renderHeaderOn: html.
	html div
		id: self id;
		class: #'panel-collapse';
		class: #collapse;
		class: #in if: self isActive;
		role: #tabpanel;
		ariaLabelledBy: self titleId;
		with: [ html section
				class: #'panel-body';
				with: [ html heading
						level2;
						with: [ html text: self question description.
							html space.
							html small: self question uiDescription ].
					html div
						id: self answersId;
						with: [ self renderAnswersOn: html ].
					self renderFooterOn: html ] ]
]

{ #category : #rendering }
OOPlayQuestionComponent >> renderTimerBadgeOn: html [
	self mcq isChallenge ifFalse: [ ^ self ].
	
	html tbsBadge
		class: #'oonoz-timer';
		class: 'timer' , self index greaseString;
		attributeAt: 'data-time' put: self mcq timeByQuestion asSeconds.
	html space
]

{ #category : #rendering }
OOPlayQuestionComponent >> renderValidationBadgeOn: html [
	| checkedAnswers |
	checkedAnswers := (self result userAnswers values select: [ :r | r ])
		size.
	html tbsBadge
		beSuccessIf:
			(checkedAnswers
				between: self question minNumberOfRightAnswers
				and: self question maxNumberOfRightAnswers);
		beDangerIf:
			(checkedAnswers
				between: self question minNumberOfRightAnswers
				and: self question maxNumberOfRightAnswers) not;
		with: checkedAnswers greaseString
]

{ #category : #action }
OOPlayQuestionComponent >> resetAnswers [
	self result initUserAnswers
]

{ #category : #accessing }
OOPlayQuestionComponent >> result [
	^ result
]

{ #category : #accessing }
OOPlayQuestionComponent >> result: anObject [
	result := anObject
]

{ #category : #accessing }
OOPlayQuestionComponent >> resultAt: anAnswer [
	^ self result at: anAnswer
]

{ #category : #accessing }
OOPlayQuestionComponent >> resultAt: anAnswer put: aBoolean [
	self result at: anAnswer put: aBoolean
]

{ #category : #accessing }
OOPlayQuestionComponent >> timeOfActivation [
	^ timeOfActivation
]

{ #category : #accessing }
OOPlayQuestionComponent >> timeOfActivation: anObject [
	timeOfActivation := anObject
]

{ #category : #accessing }
OOPlayQuestionComponent >> titleId [
	^ 'QuestionTitle' , self index greaseString
]
