Class {
	#name : #OOQuestionResult,
	#superclass : #OOObject,
	#instVars : [
		'owner',
		'question',
		'userAnswers',
		'duration'
	],
	#category : 'OOnoz-Model-Statistics-Core'
}

{ #category : #'as yet unclassified' }
OOQuestionResult class >> mongoQuestion [
	<mongoDescription>
	^ VOToOneDescription new
		attributeName: 'question';
		accessor: (MAPluggableAccessor read: [ :res | res question index ] write: [ :res :index | res question: (res owner mcq questions detect: [ :q | q index = index ]) ]);
		yourself
]

{ #category : #'as yet unclassified' }
OOQuestionResult class >> mongoUserAnswers [
	<mongoDescription>
	^ VOToOneDescription new
		attributeName: 'userAnswers';
		accessor:
			(MAPluggableAccessor
				read: [ :res | (res userAnswers associations collect: [ :asso | asso key index asString -> asso value ]) asDictionary ]
				write: [ :res :dico | res userAnswers: (dico associations collect: [ :asso | (self question answers detect: [ :a | a index asString = asso key ]) -> asso value ]) asDictionary ]);
		yourself
]

{ #category : #'instance creation' }
OOQuestionResult class >> owner: aMCQResult question: aQuestion [
	^ self new
		owner: aMCQResult;
		question: aQuestion;
		yourself
]

{ #category : #adding }
OOQuestionResult >> addToDuration: aDuration [
	self duration: self duration + aDuration
]

{ #category : #accessing }
OOQuestionResult >> at: anAnswer [
	^ self userAnswers at: anAnswer
]

{ #category : #accessing }
OOQuestionResult >> at: anAnswer put: aBoolean [
	self userAnswers
		at: anAnswer
		ifPresentPut: aBoolean
		ifAbsent: [ OOError signal: 'This answer is not in this question.' ]
]

{ #category : #accessing }
OOQuestionResult >> duration [
	^ duration
]

{ #category : #accessing }
OOQuestionResult >> duration: anObject [
	duration := anObject
]

{ #category : #initialization }
OOQuestionResult >> initUserAnswers [
	self
		userAnswers:
			(self question answers
				inject: Dictionary new
				into: [ :dico :answer | 
					dico add: answer -> false.
					dico ])
]

{ #category : #initialization }
OOQuestionResult >> initialize [
	super initialize.
	self duration: Duration zero
]

{ #category : #testing }
OOQuestionResult >> isCorrect [
	self userAnswers
		keysAndValuesDo: [ :k :v | 
			k isRight = v
				ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
OOQuestionResult >> markingScheme [
	^ self owner markingScheme
]

{ #category : #accessing }
OOQuestionResult >> owner [
	^ owner
]

{ #category : #accessing }
OOQuestionResult >> owner: anObject [
	owner := anObject
]

{ #category : #printing }
OOQuestionResult >> printResultOn: aStream [
	aStream
		<< (self result printShowingMaxDecimalPlaces: 2);
		<< '/1'
]

{ #category : #accessing }
OOQuestionResult >> question [
	^ question
]

{ #category : #accessing }
OOQuestionResult >> question: anObject [
	question := anObject.
	self initUserAnswers
]

{ #category : #accessing }
OOQuestionResult >> result [
	^ self markingScheme computeResultFrom: self userAnswers
]

{ #category : #accessing }
OOQuestionResult >> userAnswers [
	^ userAnswers
]

{ #category : #accessing }
OOQuestionResult >> userAnswers: aCollection [
	userAnswers := aCollection
]
