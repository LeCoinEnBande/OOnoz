Class {
	#name : #OOChallengeEditionComponent,
	#superclass : #OOComponent,
	#instVars : [
		'owner',
		'giftComponent'
	],
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #'instance creation' }
OOChallengeEditionComponent class >> owner: aComponent [
	^ self new
		owner: aComponent;
		yourself
]

{ #category : #action }
OOChallengeEditionComponent >> activateChallenge [
	self mcq isChallenge
		ifFalse: [ self mcq: (OOChallengeMCQ decorate: self mcq) ]
]

{ #category : #hooks }
OOChallengeEditionComponent >> children [
	^ Array with: self giftComponent
]

{ #category : #action }
OOChallengeEditionComponent >> desactivateChallenge [
	self mcq isChallenge
		ifTrue: [ self mcq: self mcq mcq ]
]

{ #category : #accessing }
OOChallengeEditionComponent >> giftComponent [
	^ giftComponent
]

{ #category : #accessing }
OOChallengeEditionComponent >> giftComponent: anObject [
	giftComponent := anObject
]

{ #category : #initialization }
OOChallengeEditionComponent >> initialize [
	super initialize.
	self giftComponent: (OOGiftEditionComponent owner: self)
]

{ #category : #accessing }
OOChallengeEditionComponent >> mcq [
	^ self owner mcq
]

{ #category : #accessing }
OOChallengeEditionComponent >> mcq: aMCQ [
	^ self owner mcq: aMCQ
]

{ #category : #accessing }
OOChallengeEditionComponent >> owner [
	^ owner
]

{ #category : #accessing }
OOChallengeEditionComponent >> owner: anObject [
	owner := anObject
]

{ #category : #rendering }
OOChallengeEditionComponent >> renderContentOn: html [
	self mcq isChallenge
		ifFalse: [ ^ self ].
	html
		tbsFormGroup: [ html
				section: [ html heading
						level3;
						with: 'Temps par question'.
					html break.
					html textInput
						tbsFormControl;
						id: html lastId;
						class: #slider;
						callback: [ :time | self mcq timeByQuestion: (Duration seconds: time asInteger) ];
						attributeAt: 'data-provide' put: 'slider';
						attributeAt: 'data-slider-id' put: html nextId;
						attributeAt: 'data-slider-min' put: '30';
						attributeAt: 'data-slider-max' put: '600';
						attributeAt: 'data-slider-ticks' put: '[30,450,900,1350,1800]';
						attributeAt: 'data-slider-ticks-labels' put: '["30sec","7min30","15min","22min30","30min"]';
						attributeAt: 'data-slider-step' put: '30';
						attributeAt: 'data-slider-value' put: self mcq timeByQuestion asSeconds asString ] ].
	html render: self giftComponent
]
