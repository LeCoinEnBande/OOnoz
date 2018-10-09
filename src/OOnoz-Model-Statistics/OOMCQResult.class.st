Class {
	#name : #OOMCQResult,
	#superclass : #OOObject,
	#instVars : [
		'mcq',
		'user',
		'questionResults',
		'isFinished',
		'dateBegin',
		'dateEnd'
	],
	#category : 'OOnoz-Model-Statistics-Core'
}

{ #category : #voyage }
OOMCQResult class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
OOMCQResult class >> user: aUser mcq: aMCQ [
	^ self new
		user: aUser;
		mcq: aMCQ;
		yourself
]

{ #category : #comparing }
OOMCQResult >> = anObject [
	^ self species = anObject species
		and: [ self user = anObject user and: [ self mcq = anObject mcq and: [ self dateBegin = anObject dateBegin ] ] ]
]

{ #category : #accessing }
OOMCQResult >> dateBegin [
	^ dateBegin
]

{ #category : #accessing }
OOMCQResult >> dateBegin: anObject [
	dateBegin := anObject
]

{ #category : #accessing }
OOMCQResult >> dateEnd [
	^ dateEnd
]

{ #category : #accessing }
OOMCQResult >> dateEnd: anObject [
	dateEnd := anObject
]

{ #category : #accessing }
OOMCQResult >> duration [
	(self dateBegin isNil or: [ self dateEnd isNil or: [ self dateBegin > self dateEnd ] ])
		ifTrue: [ OOError signal: 'Wrong dates' ].
		
	^ (self dateEnd - self dateBegin) asDuration
]

{ #category : #accessing }
OOMCQResult >> finishAndSetEndTime [
	self finished.
	self dateEnd: DateAndTime now
]

{ #category : #accessing }
OOMCQResult >> finished [
	self isFinished: true
]

{ #category : #initialization }
OOMCQResult >> initialize [
	super initialize.
	self notFinished.
	self questionResults: OrderedCollection new.
	self dateBegin: DateAndTime now
]

{ #category : #testing }
OOMCQResult >> isAllRight [
	^ self questionResults
		detect: [ :q | q isCorrect not ]
		ifFound: [ false ]
		ifNone: [ true ]
]

{ #category : #accessing }
OOMCQResult >> isFinished [
	^ isFinished
]

{ #category : #accessing }
OOMCQResult >> isFinished: aBoolean [
	isFinished := aBoolean
]

{ #category : #accessing }
OOMCQResult >> markingScheme [
	^ self mcq markingScheme
]

{ #category : #accessing }
OOMCQResult >> mcq [
	^ mcq
]

{ #category : #accessing }
OOMCQResult >> mcq: aMCQ [
	mcq := aMCQ.
	self questionResults addAll: (aMCQ questions collect: [ :question | OOQuestionResult owner: self question: question ])
]

{ #category : #accessing }
OOMCQResult >> notFinished [
	self isFinished: false
]

{ #category : #accessing }
OOMCQResult >> numberOfCorrectQuestions [
	^ (self questionResults select: #isCorrect) size
]

{ #category : #printing }
OOMCQResult >> printResultOn: aStream [
	aStream
		<< (self result printShowingMaxDecimalPlaces: 2);
		<< $/;
		<< self questionResults size
]

{ #category : #accessing }
OOMCQResult >> questionResults [
	^ questionResults
]

{ #category : #accessing }
OOMCQResult >> questionResults: anObject [
	questionResults := anObject
]

{ #category : #'error handling' }
OOMCQResult >> raiseNotFinishException [
	OOMCQNotFinished signal
]

{ #category : #accessing }
OOMCQResult >> result [
	self isFinished ifFalse: [ self raiseNotFinishException ].
	
	^ (self questionResults collect: #result) sum
]

{ #category : #accessing }
OOMCQResult >> user [
	^ user
]

{ #category : #accessing }
OOMCQResult >> user: anObject [
	user := anObject
]
