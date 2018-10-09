"
An OOAbstractExplanationTest is a test class for testing the behavior of OOAbstractExplanation
"
Class {
	#name : #OOAbstractExplanationTest,
	#superclass : #TestCase,
	#instVars : [
		'explanation'
	],
	#category : 'OOnoz-Tests-Model-MCQ'
}

{ #category : #testing }
OOAbstractExplanationTest class >> isAbstract [
	^ self = OOAbstractExplanationTest
]

{ #category : #accessing }
OOAbstractExplanationTest >> actualClass [
	^ self subclassResponsibility 
]

{ #category : #'instance creation' }
OOAbstractExplanationTest >> newInstance [
	^ self actualClass new
]

{ #category : #running }
OOAbstractExplanationTest >> setUp [
	super setUp.
	explanation := self newInstance
]

{ #category : #tests }
OOAbstractExplanationTest >> testEquals [
	| instance2 |
	instance2 := self newInstance.
	self assert: explanation = instance2 description: 'The two intances should be equal.'.
	self assert: explanation copy = explanation description: 'The two instances should be equal'
]

{ #category : #tests }
OOAbstractExplanationTest >> testHasExplanation [
	self shouldnt: [ explanation explanation ] raise: MessageNotUnderstood
]

{ #category : #tests }
OOAbstractExplanationTest >> testHash [
	| instance2 |
	instance2 := self newInstance.
	self assert: explanation hash equals: explanation copy hash.
	self assert: explanation hash equals: instance2 hash
]
