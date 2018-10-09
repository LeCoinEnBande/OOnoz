"
I am the core of the model: the MCQ.

Description
---------------------

A MCQ is composed of a title and questions. I have a marking scheme to mark a user answers. 

I am composed of OOAbstractQuestion. 

Public API and Key Messages
---------------------

- #randowizedQuestion 	Return the questions in a random order.
- #validate 				If the MCQ is not valid, I will raise an error.

Example
---------------------
 
	OOMCQ new
		title: 'Title';
		markirgScheme: OOStrictMarkingScheme;
		addQuestion: aQuestion;
		yourself

Internal Representation and Key Implementation Points
---------------------

    Instance Variables
	markingScheme:		<aMarkingScheme> 	An object to mark a user answers
	questions:			<aSet>				A Set of questions
	title:				<aString>			The title of the MCQ

"
Class {
	#name : #OOMCQ,
	#superclass : #OOAbstractMCQ,
	#instVars : [
		'questions',
		'title',
		'description',
		'markingScheme',
		'orderer',
		'price',
		'subThemes',
		'level',
		'imagePath',
		'backgroundPath',
		'state'
	],
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #adding }
OOMCQ >> addQuestion: aQuestion [ 
	self questions add: aQuestion
]

{ #category : #accessing }
OOMCQ >> backgroundPath [
	^ backgroundPath
]

{ #category : #accessing }
OOMCQ >> backgroundPath: anObject [
	backgroundPath := anObject
]

{ #category : #accessing }
OOMCQ >> description [
	^ description
]

{ #category : #accessing }
OOMCQ >> description: anObject [
	description := anObject
]

{ #category : #accessing }
OOMCQ >> imagePath [
	^ imagePath
]

{ #category : #accessing }
OOMCQ >> imagePath: anObject [
	imagePath := anObject
]

{ #category : #initialization }
OOMCQ >> initialize [
	super initialize.
	self questions: Set new.
	self defaultOrderer.
	self markingScheme: OOStrictWithPenalityScheme.
	self resetSubThemes.
	self level: 1.
	self state: #inactive
]

{ #category : #accessing }
OOMCQ >> level [
	^ level ifNil: [ level := 1 ]
]

{ #category : #accessing }
OOMCQ >> level: anObject [
	level := anObject
]

{ #category : #accessing }
OOMCQ >> markingScheme [
	^ markingScheme
]

{ #category : #accessing }
OOMCQ >> markingScheme: anObject [
	markingScheme := anObject
]

{ #category : #accessing }
OOMCQ >> orderedQuestions [
	^ self orderer order: self questions
]

{ #category : #accessing }
OOMCQ >> orderer [
	^ orderer
]

{ #category : #accessing }
OOMCQ >> orderer: anObject [
	orderer := anObject
]

{ #category : #accessing }
OOMCQ >> price [
	^ price
]

{ #category : #accessing }
OOMCQ >> price: anInteger [
	price := anInteger
]

{ #category : #accessing }
OOMCQ >> questions [
	^ questions
]

{ #category : #accessing }
OOMCQ >> questions: anObject [
	questions := anObject
]

{ #category : #adding }
OOMCQ >> removeQuestion: aQuestion [
	self questions remove: aQuestion
]

{ #category : #accessing }
OOMCQ >> state [
	^ state ifNil: [ state := #active ]
]

{ #category : #accessing }
OOMCQ >> state: anObject [
	state := anObject
]

{ #category : #accessing }
OOMCQ >> subThemes [
	^ subThemes
]

{ #category : #accessing }
OOMCQ >> subThemes: anObject [
	subThemes := anObject
]

{ #category : #accessing }
OOMCQ >> title [
	^ title
]

{ #category : #accessing }
OOMCQ >> title: anObject [
	title := anObject
]

{ #category : #validate }
OOMCQ >> validate [
	self validateMCQ.
	self questions do: [ :each | each validate ]
]

{ #category : #validate }
OOMCQ >> validateMCQ [
	self title isEmptyOrNil
		ifTrue: [ self invalidate: 'Un QCM doit avoir un titre.' ].
	self markingScheme ifNil: [ self invalidate: 'Un QCM doit avoir un barème.' ].
	self subThemes ifEmpty: [ self invalidate: 'Un QCM doit avoir au moins un sous thème.' ].
	(self subThemes collect: #theme as: Set) size < 2
		ifFalse: [ self invalidate: 'Un QCM doit avoir des sous thèmes contenus dans un seul thème uniquement.' ].
	(self questions size between: self class minimumNumberOfQuestions and: self class maximumNumberOfQuestions)
		ifFalse: [ self
				invalidate:
					(String
						streamContents: [ :s | 
							s
								<< 'Le nombre de questions valides doit être de ';
								<< self class minimumNumberOfQuestions;
								<< $. ]) ]
]
