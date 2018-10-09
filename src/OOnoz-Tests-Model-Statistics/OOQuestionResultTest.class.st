"
An OOQuestionResultTest is a test class for testing the behavior of OOQuestionResult
"
Class {
	#name : #OOQuestionResultTest,
	#superclass : #TestCase,
	#instVars : [
		'result'
	],
	#category : 'OOnoz-Tests-Model-Statistics'
}

{ #category : #accessing }
OOQuestionResultTest >> actualClass [
	^ OOQuestionResult
]

{ #category : #'instance creation' }
OOQuestionResultTest >> newInstance [
	^ self actualClass owner: Mock new question: Mock new
]

{ #category : #running }
OOQuestionResultTest >> setUp [
	result := self newInstance
]

{ #category : #helpers }
OOQuestionResultTest >> strictlyRightUserAnswers [
	^ Dictionary
		with: (OOAnswer text: 'answer1' isRight: true) -> true
		with: (OOAnswer text: 'answer2' isRight: false) -> false
]

{ #category : #tests }
OOQuestionResultTest >> testAddToDuration [
	self assert: result duration equals: Duration zero.
	result addToDuration: (Duration milliSeconds: 10000).
	self assert: result duration equals: (Duration milliSeconds: 10000).
	result addToDuration: (Duration milliSeconds: 24000).
	self assert: result duration equals: (Duration milliSeconds: 34000)
]

{ #category : #tests }
OOQuestionResultTest >> testAt [
	| question answer |
	answer := OOAnswer text: 'test' isRight: true.
	question := Mock named: 'Question'.
	question stub answers
		willReturn: (Set with: answer with: (OOAnswer text: 'test2' isRight: false)).
	result question: question.
	self assert: (result at: answer) equals: false.
	result at: answer put: true.
	self assert: (result at: answer)
]

{ #category : #tests }
OOQuestionResultTest >> testAtPut [
	| question answer |
	answer := OOAnswer text: 'test' isRight: true.
	question := Mock named: 'Question'.
	question stub answers willReturn: (Set with: answer with: (OOAnswer text: 'test2' isRight: false)).
	result question: question.
	result at: answer put: true.
	self assert: (result userAnswers at: answer)
]

{ #category : #tests }
OOQuestionResultTest >> testAtPutWithNonExistingAnswer [
	| question answer |
	answer := OOAnswer text: 'test' isRight: true.
	question := Mock named: 'Question'.
	question stub answers willReturn: (Set with: answer with: (OOAnswer text: 'test2' isRight: false)).
	result question: question.
	self should: [ result at: (OOAnswer text: 'test that does not exist' isRight: true) put: true ] raise: OOError
]

{ #category : #tests }
OOQuestionResultTest >> testIsCorrect [
	| answer |
	result userAnswers: self strictlyRightUserAnswers.
	self assert: result isCorrect.
	answer := result userAnswers keys first.
	result at: answer put: (result at: answer) not.
	self deny: result isCorrect
]

{ #category : #tests }
OOQuestionResultTest >> testPrintResultOn [
	result userAnswers: self strictlyRightUserAnswers.
	result stub markingScheme willReturn: OOStrictScheme.
	self assert: (String streamContents: [ :s | result printResultOn: s ]) equals: '1/1'
]

{ #category : #tests }
OOQuestionResultTest >> testQuestion [
	| question |
	question := Mock named: 'Question'.
	question stub answers willReturn: (Set with: (OOAnswer text: 'test' isRight: true) with: (OOAnswer text: 'test2' isRight: false)).
	result question: question.
	self assert: result userAnswers size equals: 2
]

{ #category : #tests }
OOQuestionResultTest >> testResult [
	| mcqResult |
	result userAnswers: self strictlyRightUserAnswers.
	mcqResult := Mock named: 'result'.
	mcqResult stub markingScheme willReturn: OOStrictScheme.
	result owner: mcqResult.
	self assert: result result equals: 1
]
