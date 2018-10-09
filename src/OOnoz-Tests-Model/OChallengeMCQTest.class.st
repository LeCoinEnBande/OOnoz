Class {
	#name : #OChallengeMCQTest,
	#superclass : #OOMCQDecoratorTest,
	#category : 'OOnoz-Tests-Model-MCQ'
}

{ #category : #accessing }
OChallengeMCQTest >> actualClass [
	^ OOChallengeMCQ
]

{ #category : #tests }
OChallengeMCQTest >> testEquals [
	| instance2 |
	super testEquals.
	instance2 := self newMCQInstance
		gift: (OOGift description: 'test');
		yourself.
	self deny: mcq = instance2 description: 'The two intances should not be equal because the second is different.'
]

{ #category : #tests }
OChallengeMCQTest >> testHasGift [
	mcq giftDescription: 'A gift'.
	self assert: mcq hasGift.
	mcq resetGift.
	self deny: mcq hasGift
]

{ #category : #tests }
OChallengeMCQTest >> testIsChallenge [
	self assert: self actualClass new isChallenge
]

{ #category : #tests }
OChallengeMCQTest >> testPostCopy [
	| aGift |
	mcq gift: (aGift := OOGift description: 'blabla').
	mcq postCopy.
	self assert: mcq gift equals: aGift.
	self deny: mcq gift == aGift
]
