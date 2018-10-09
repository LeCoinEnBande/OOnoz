"
An OOAbstractGiftTest is a test class for testing the behavior of OOAbstractGift
"
Class {
	#name : #OOAbstractGiftTest,
	#superclass : #TestCase,
	#instVars : [
		'gift'
	],
	#category : 'OOnoz-Tests-Model-MCQ'
}

{ #category : #testing }
OOAbstractGiftTest class >> isAbstract [
	^ self = OOAbstractGiftTest
]

{ #category : #accessing }
OOAbstractGiftTest >> actualClass [
	^ self subclassResponsibility 
]

{ #category : #'instance creation' }
OOAbstractGiftTest >> newInstance [
	^ self actualClass new
]

{ #category : #initialization }
OOAbstractGiftTest >> setUp [
	super setUp.
	gift := self newInstance
]

{ #category : #tests }
OOAbstractGiftTest >> testEquals [
	| instance2 |
	instance2 := self newInstance.
	self assert: gift = instance2 description: 'The two intances should be equal.'.
	self assert: gift copy = gift description: 'The two instances should be equal'
]
