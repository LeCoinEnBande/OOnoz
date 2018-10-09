"
An OOGiftTest is a test class for testing the behavior of OOGift
"
Class {
	#name : #OOGiftTest,
	#superclass : #OOAbstractGiftTest,
	#category : 'OOnoz-Tests-Model-MCQ'
}

{ #category : #accessing }
OOGiftTest >> actualClass [
	^ OOGift 
]

{ #category : #tests }
OOGiftTest >> testEquals [
	| instance2 |
	instance2 := self newInstance.
	self assert: gift = instance2 description: 'The two intances should be equal.'.
	self assert: gift copy = gift description: 'The two instances should be equal'.
	instance2 description: 'Foo'.
	self deny: gift = instance2.
	instance2 := self newInstance
		number: 100;
		yourself.
	self deny: gift = instance2
]

{ #category : #tests }
OOGiftTest >> testRemainingGifts [
	gift number: 100.
	gift stub winners willReturn: (Array new: 23).
	self assert: gift remainingGifts equals: 77
]
