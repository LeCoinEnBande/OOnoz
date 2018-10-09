"
I am a concrete explanation of an OOQuestion
"
Class {
	#name : #OOExplanation,
	#superclass : #OOAbstractExplanation,
	#instVars : [
		'explanation'
	],
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #'instance creation' }
OOExplanation class >> explanation: aString [
	^ self new
		explanation: aString;
		yourself
]

{ #category : #comparing }
OOExplanation >> = anObject [
	^ super = anObject and: [ self explanation = anObject explanation ]
]

{ #category : #accessing }
OOExplanation >> explanation [
	^ explanation
]

{ #category : #accessing }
OOExplanation >> explanation: anObject [
	explanation := anObject
]

{ #category : #comparing }
OOExplanation >> hash [
	^ (super hash + self explanation hash) hashMultiply
]
