"
I am an abstract class describing a Question.

Description
---------------------

A Question has a description and a list of answer. The number of answers and of right answers will depend of my subclasses.
I might have an explanation and a media.

I should be held by a OOMCQ and I contains OOAnswer.

Public API and Key Messages
---------------------

- #validate 				If the question is not right, it should raise an error.
- #randomizedAnswers 	Return a collection of answers in random order. 
 
Internal Representation and Key Implementation Points.
---------------------

    Instance Variables
	answers:		<aSet>				A set of answers for the question.
	description:		<aString>			A description for the question.
	explanation:		<anExplanation>		An optional explanation.
	media:			<???>


"
Class {
	#name : #OOAbstractQuestion,
	#superclass : #OOObject,
	#instVars : [
		'description',
		'answers',
		'media',
		'explanation',
		'index'
	],
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #'instance creation' }
OOAbstractQuestion class >> description: aString answers: aCollection [
	^ self new
		description: aString;
		answers: aCollection;
		yourself
]

{ #category : #testing }
OOAbstractQuestion class >> isAbstract [
	^ self = OOAbstractQuestion
]

{ #category : #magicNumbers }
OOAbstractQuestion class >> maxNumberOfRightAnswers [
	^ self subclassResponsibility
]

{ #category : #magicNumbers }
OOAbstractQuestion class >> maximumNumberOfAnswers [
	^ self subclassResponsibility
]

{ #category : #magicNumbers }
OOAbstractQuestion class >> minNumberOfRightAnswers [
	^ self subclassResponsibility
]

{ #category : #magicNumbers }
OOAbstractQuestion class >> minimumNumberOfAnswers [
	^ self subclassResponsibility
]

{ #category : #comparing }
OOAbstractQuestion >> = anObject [
	^ self species = anObject species
		and: [ self description = anObject description
				and: [ self sortedAnswers = anObject sortedAnswers
						and: [ self explanation = anObject explanation
								and: [ self index = anObject index and: [ self media = anObject media ] ] ] ] ]
]

{ #category : #adding }
OOAbstractQuestion >> addAnswer: anAnswer [
	self answers add: anAnswer 
]

{ #category : #accessing }
OOAbstractQuestion >> answers [
	^ answers
]

{ #category : #accessing }
OOAbstractQuestion >> answers: anObject [
	answers := anObject
]

{ #category : #accessing }
OOAbstractQuestion >> correction [
	^ self explanation explanation
]

{ #category : #accessing }
OOAbstractQuestion >> correction: aString [
	aString isEmptyOrNil
		ifFalse: [ self explanation: (OOExplanation explanation: aString) ]
]

{ #category : #momento }
OOAbstractQuestion >> createMemento [
	"I am used for the memento pattern. My goal is to save my current state in a memento of me."

	^ self copy
]

{ #category : #accessing }
OOAbstractQuestion >> description [
	^ description
]

{ #category : #accessing }
OOAbstractQuestion >> description: anObject [
	description := anObject
]

{ #category : #accessing }
OOAbstractQuestion >> explanation [
	^ explanation
]

{ #category : #accessing }
OOAbstractQuestion >> explanation: anObject [
	explanation := anObject
]

{ #category : #testing }
OOAbstractQuestion >> hasCorrection [
	^ self explanation hasExplanation
]

{ #category : #accessing }
OOAbstractQuestion >> index [
	^ index
]

{ #category : #accessing }
OOAbstractQuestion >> index: anObject [
	index := anObject
]

{ #category : #initialization }
OOAbstractQuestion >> initialize [
	super initialize.
	self explanation: OONilExplanation new.
	self answers: Set new
]

{ #category : #'error handing' }
OOAbstractQuestion >> invalidate: aString [
	(OOInvalidQuestion modelObject: self reason: aString) signal
]

{ #category : #accessing }
OOAbstractQuestion >> maxNumberOfRightAnswers [
	^ self questionClass maxNumberOfRightAnswers
]

{ #category : #accessing }
OOAbstractQuestion >> media [
	^ media
]

{ #category : #accessing }
OOAbstractQuestion >> media: anObject [
	media := anObject
]

{ #category : #accessing }
OOAbstractQuestion >> minNumberOfRightAnswers [
	^ self questionClass minNumberOfRightAnswers
]

{ #category : #accessing }
OOAbstractQuestion >> orderedAnswers [
	^ OORandomOrder order: self answers
]

{ #category : #copying }
OOAbstractQuestion >> postCopy [
	super postCopy.
	self answers: (self answers collect: #copy)
]

{ #category : #accessing }
OOAbstractQuestion >> questionClass [
	^ self class
]

{ #category : #removing }
OOAbstractQuestion >> removeAnswer: anAnswer [
	self answers remove: anAnswer 
]

{ #category : #removing }
OOAbstractQuestion >> removeCorrection [
	self explanation: OONilExplanation new.
]

{ #category : #momento }
OOAbstractQuestion >> restoreFromMemento: aMemento [
	"I am used for the memento pattern. My goal is to set my state to the set of the memento.
	I let the questions manage their own memento."

	self description: aMemento description.
	self answers: aMemento answers.
	self explanation: aMemento explanation
]

{ #category : #accessing }
OOAbstractQuestion >> sortedAnswers [
	^ self answers asArray sort: [ :a :b | a index < b index ]
]

{ #category : #validation }
OOAbstractQuestion >> validate [
	self description isEmptyOrNil
		ifTrue: [ self invalidate: 'Une question doit avoir une description.' ].
	(self answers size
		between: self questionClass minimumNumberOfAnswers
		and: self questionClass maximumNumberOfAnswers)
		ifFalse: [ self
				invalidate:
					(String
						streamContents: [ :s | 
							s
								<< 'Le nombre de réponses doit être compris entre ';
								<< self questionClass minimumNumberOfAnswers;
								<< ' et ';
								<< self questionClass maximumNumberOfAnswers;
								<< $. ]) ].
	((self answers select: #isRight) size
		between: self questionClass minNumberOfRightAnswers
		and: self questionClass maxNumberOfRightAnswers)
		ifFalse: [ self
				invalidate:
					(String
						streamContents: [ :s | 
							s
								<< 'Le nombre de réponses valides doit être compris entre ';
								<< self questionClass minNumberOfRightAnswers;
								<< ' et ';
								<< self questionClass maxNumberOfRightAnswers;
								<< $. ]) ].
	self answers
		do: [ :a | 
			a text isEmptyOrNil
				ifTrue: [ self invalidate: 'Une réponse doit avoir un texte.' ] ]
]
