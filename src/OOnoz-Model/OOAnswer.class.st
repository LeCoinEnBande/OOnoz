"
I am the Answer of an OOQuestion.

Description
---------------------

I am a simple objet having the text to show to the user and knowing if I am right or wrong for the question.

I should be held by an OOQuestion.

Example
---------------------

	OOAnswer text: 'Answer D!' isRight: false
 
Internal Representation and Key Implementation Points.
---------------------

    Instance Variables
	isRight:		<aBoolean>		True if the answer is right for the question containing me.
	text:		<aString>		The text of the answer to show to the user.

"
Class {
	#name : #OOAnswer,
	#superclass : #OOObject,
	#instVars : [
		'text',
		'isRight',
		'index'
	],
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #'instance creation' }
OOAnswer class >> text: aString isRight: aBoolean [
	^ self new
		text: aString;
		isRight: aBoolean;
		yourself
]

{ #category : #comparing }
OOAnswer >> < anAnswer [
	^ self text < anAnswer text
]

{ #category : #comparing }
OOAnswer >> = anObject [
	^ self species = anObject species and: [ self text = anObject text and: [ self isRight = anObject isRight and: [ self index = anObject index ] ] ]
]

{ #category : #accessing }
OOAnswer >> beRight [
	self isRight: true
]

{ #category : #accessing }
OOAnswer >> beWrong [
	self isRight: false
]

{ #category : #accessing }
OOAnswer >> index [
	^ index
]

{ #category : #accessing }
OOAnswer >> index: anObject [
	index := anObject
]

{ #category : #initialization }
OOAnswer >> initialize [
	super initialize.
	self isRight: false
]

{ #category : #accessing }
OOAnswer >> isRight [
	^ isRight
]

{ #category : #accessing }
OOAnswer >> isRight: anObject [
	isRight := anObject
]

{ #category : #accessing }
OOAnswer >> isWrong [
	^ self isRight not
]

{ #category : #printing }
OOAnswer >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< $(;
		<< self isRight asString;
		<< '-';
		<< self index;
		<< $)
]

{ #category : #accessing }
OOAnswer >> text [
	^ text
]

{ #category : #accessing }
OOAnswer >> text: anObject [
	text := anObject
]
