Class {
	#name : #OOChallengeMCQ,
	#superclass : #OOMCQDecorator,
	#instVars : [
		'timeByQuestion',
		'gift'
	],
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #comparing }
OOChallengeMCQ >> = anObject [
	^ super = anObject and: [ self gift = anObject gift and: [ self timeByQuestion = anObject timeByQuestion ] ]
]

{ #category : #accessing }
OOChallengeMCQ >> gift [
	^ gift
]

{ #category : #accessing }
OOChallengeMCQ >> gift: anObject [
	gift := anObject
]

{ #category : #accessing }
OOChallengeMCQ >> giftDescription [
	^ self gift description
]

{ #category : #accessing }
OOChallengeMCQ >> giftDescription: aString [
	self gift: (OOGift description: aString)
]

{ #category : #testing }
OOChallengeMCQ >> hasGift [
	^ self gift hasGift
]

{ #category : #initialization }
OOChallengeMCQ >> initialize [
	super initialize.
	self timeByQuestion: (Duration seconds: 90).
	self resetGift
]

{ #category : #testing }
OOChallengeMCQ >> isChallenge [
	^ true
]

{ #category : #copying }
OOChallengeMCQ >> postCopy [
	super postCopy.
	self gift: self gift copy
]

{ #category : #initialization }
OOChallengeMCQ >> resetGift [
	self gift: OONilGift new
]

{ #category : #accessing }
OOChallengeMCQ >> timeByQuestion [
	^ timeByQuestion
]

{ #category : #accessing }
OOChallengeMCQ >> timeByQuestion: anObject [
	timeByQuestion := anObject
]
