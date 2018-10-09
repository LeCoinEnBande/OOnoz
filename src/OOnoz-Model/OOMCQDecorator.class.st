Class {
	#name : #OOMCQDecorator,
	#superclass : #OOAbstractMCQ,
	#instVars : [
		'mcq'
	],
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #'instance creation' }
OOMCQDecorator class >> decorate: aMCQ [
	^ self new
		mcq: aMCQ;
		yourself
]

{ #category : #testing }
OOMCQDecorator class >> isAbstract [
	^ self = OOMCQDecorator
]

{ #category : #adding }
OOMCQDecorator >> addQuestion: aQuestion [
	^ self mcq ifNotNil: [ :m | m addQuestion: aQuestion ]
]

{ #category : #accessing }
OOMCQDecorator >> backgroundPath [
	^ self mcq ifNotNil: #backgroundPath
]

{ #category : #accessing }
OOMCQDecorator >> backgroundPath: anObject [
	self mcq ifNotNil: [ :m | m backgroundPath: anObject ]
]

{ #category : #accessing }
OOMCQDecorator >> description [
	^ self mcq ifNotNil: #description
]

{ #category : #accessing }
OOMCQDecorator >> description: aString [
	^ self mcq ifNotNil: [ :m | m description: aString ]
]

{ #category : #accessing }
OOMCQDecorator >> imagePath [
	^ self mcq ifNotNil: #imagePath
]

{ #category : #accessing }
OOMCQDecorator >> imagePath: anObject [
	self mcq ifNotNil: [ :m | m imagePath: anObject ]
]

{ #category : #accessing }
OOMCQDecorator >> isActivated [
	^ self mcq ifNotNil: #isActivated
]

{ #category : #accessing }
OOMCQDecorator >> level [
	^ self mcq ifNotNil: #level
]

{ #category : #accessing }
OOMCQDecorator >> level: anObject [
	self mcq ifNotNil: [ :m | m level: anObject ]
]

{ #category : #accessing }
OOMCQDecorator >> markingScheme [
	^ self mcq ifNotNil: #markingScheme
]

{ #category : #accessing }
OOMCQDecorator >> markingScheme: aClass [
	^ self mcq ifNotNil: [ :m | m markingScheme: aClass ]
]

{ #category : #accessing }
OOMCQDecorator >> mcq [
	^ mcq
]

{ #category : #accessing }
OOMCQDecorator >> mcq: anObject [
	mcq := anObject
]

{ #category : #accessing }
OOMCQDecorator >> orderedQuestions [
	^ self mcq ifNotNil: #orderedQuestions
]

{ #category : #accessing }
OOMCQDecorator >> orderer [
	^ self mcq ifNotNil: #orderer
]

{ #category : #accessing }
OOMCQDecorator >> orderer: anOrderer [
	^ self mcq ifNotNil: [ :m | m orderer: anOrderer ]
]

{ #category : #copying }
OOMCQDecorator >> postCopy [
	super postCopy.
	self mcq: self mcq copy
]

{ #category : #accessing }
OOMCQDecorator >> price [
	^ self mcq ifNotNil: #price
]

{ #category : #accessing }
OOMCQDecorator >> price: anInteger [
	^ self mcq ifNotNil: [ :m | m price: anInteger ]
]

{ #category : #accessing }
OOMCQDecorator >> questions [
	^ self mcq ifNotNil: #questions
]

{ #category : #accessing }
OOMCQDecorator >> questions: aCollection [
	^ self mcq ifNotNil: [ :m | m questions: aCollection ]
]

{ #category : #removing }
OOMCQDecorator >> removeQuestion: aQuestion [
	^ self mcq ifNotNil: [ :m | m removeQuestion: aQuestion ]
]

{ #category : #accessing }
OOMCQDecorator >> state [
	^ self mcq state
]

{ #category : #accessing }
OOMCQDecorator >> state: aState [
	self mcq state: aState
]

{ #category : #accessing }
OOMCQDecorator >> subThemes [
	^ self mcq ifNotNil: #subThemes
]

{ #category : #accessing }
OOMCQDecorator >> subThemes: aCollection [
	^ self mcq ifNotNil: [ :m | m subThemes: aCollection ]
]

{ #category : #accessing }
OOMCQDecorator >> title [
	^ self mcq ifNotNil: #title
]

{ #category : #accessing }
OOMCQDecorator >> title: aString [
	^ self mcq ifNotNil: [ :m | m title: aString ]
]

{ #category : #validation }
OOMCQDecorator >> validate [
	^ self mcq ifNotNil: [ :m | m validate ]
]

{ #category : #validation }
OOMCQDecorator >> validateMCQ [
	^ self mcq ifNotNil: [ :m | m validateMCQ ]
]
