"
An OOExplanationTest is a test class for testing the behavior of OOExplanation
"
Class {
	#name : #OOExplanationTest,
	#superclass : #OOAbstractExplanationTest,
	#category : 'OOnoz-Tests-Model-MCQ'
}

{ #category : #accessing }
OOExplanationTest >> actualClass [
	^ OOExplanation
]

{ #category : #'instance creation' }
OOExplanationTest >> newInstance [
	^ super newInstance
		explanation: 'An explanation';
		yourself
]

{ #category : #tests }
OOExplanationTest >> testEquals [
	| instance2 |
	instance2 := self newInstance.
	self assert: explanation = instance2 description: 'The two intances should be equal.'.
	self assert: explanation copy = explanation description: 'The two instances should be equal'.
	instance2 explanation: 'Another kind of explanation'.
	self deny: explanation = instance2 description: 'The two intances should not be equal.'
]
