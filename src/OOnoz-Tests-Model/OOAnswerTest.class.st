Class {
	#name : #OOAnswerTest,
	#superclass : #TestCase,
	#instVars : [
		'answer'
	],
	#category : 'OOnoz-Tests-Model-MCQ'
}

{ #category : #'instance creation' }
OOAnswerTest >> newAnswerInstance [
	^ OOAnswer text: 'I am an answer' isRight: true
]

{ #category : #running }
OOAnswerTest >> setUp [
	super setUp.
	answer := self newAnswerInstance
]

{ #category : #'as yet unclassified' }
OOAnswerTest >> testBeRight [
	answer beRight.
	self assert: answer isRight
]

{ #category : #tests }
OOAnswerTest >> testBeWrong [
	answer beWrong.
	self assert: answer isWrong 
]

{ #category : #tests }
OOAnswerTest >> testEquals [
	| instance2 |
	instance2 := self newAnswerInstance.
	self assert: answer = instance2 description: 'The two intances should be equal.'.
	self assert: answer copy = answer description: 'The two instances should be equal'.
	instance2 isRight: false.
	self
		deny: answer = instance2
		description: 'The two intances should not be equal because one is right and the other wrong.'
]

{ #category : #tests }
OOAnswerTest >> testInferior [
	| a1 a2 |
	a1 := OOAnswer text: 'aaa' isRight: true.
	a2 := OOAnswer text: 'zzz' isRight: true.
	self assert: a1 < a2
]

{ #category : #tests }
OOAnswerTest >> testPrintOn [
	answer isRight: true.
	answer index: 1.
	self assert: ((String streamContents: [ :s | answer printOn: s ]) includesSubstring: '(true-1)')
]
