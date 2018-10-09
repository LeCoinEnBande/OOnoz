"
An OOMCQResultTest is a test class for testing the behavior of OOMCQResult
"
Class {
	#name : #OOMCQResultTest,
	#superclass : #TestCase,
	#instVars : [
		'result'
	],
	#category : 'OOnoz-Tests-Model-Statistics'
}

{ #category : #accessing }
OOMCQResultTest >> actualClass [
	^ OOMCQResult
]

{ #category : #helpers }
OOMCQResultTest >> generateQuestionsResultWithCorrect: results [
	^ (1 to: 20)
		inject: OrderedCollection new
		into: [ :coll :ind | 
			| mock |
			mock := Mock named: 'QuestionResult' , ind asString.
			mock stub isCorrect willReturn: (results at: ind).
			coll add: mock.
			coll ]
]

{ #category : #helpers }
OOMCQResultTest >> generateQuestionsResultWithResults: results [
	^ (1 to: 20)
		inject: OrderedCollection new
		into: [ :coll :ind | 
			| mock |
			mock := Mock named: 'QuestionResult' , ind asString.
			mock stub result willReturn: (results at: ind).
			coll add: mock.
			coll ]
]

{ #category : #'instance creation' }
OOMCQResultTest >> newInstance [
	^ (self actualClass user: OOUser new mcq: OOMCQ new)
		finished;
		dateBegin:
			(DateAndTime
				year: 2016
				month: 10
				day: 26
				hour: 16
				minute: 18
				second: 0);
		dateEnd:
			(DateAndTime
				year: 2016
				month: 10
				day: 26
				hour: 17
				minute: 38
				second: 30);
		yourself
]

{ #category : #helpers }
OOMCQResultTest >> resultReturning5 [
	^ #(1 1 1 1 1 0 0 0 0 0 -1 -1 -1 -1 -1 1 1 1 1 1)
]

{ #category : #running }
OOMCQResultTest >> setUp [
	super setUp.
	result := self newInstance
]

{ #category : #tests }
OOMCQResultTest >> testDuration [
	self
		assert: result duration
		equals:
			(Duration
				days: 0
				hours: 1
				minutes: 20
				seconds: 30)
]

{ #category : #tests }
OOMCQResultTest >> testDurationWithError [
	result dateEnd: nil.
	self should: [ result duration ] raise: OOError
]

{ #category : #tests }
OOMCQResultTest >> testEquals [
	| instance2 |
	instance2 := self newInstance.
	self assert: result = instance2 description: 'The two intances should be equal.'.
	self assert: result copy = result description: 'The two instances should be equal'.
	instance2 user: OONilUser new.
	self deny: result = instance2 description: 'The two intances should not be equal.'.
]

{ #category : #tests }
OOMCQResultTest >> testFinishAndSetEndTime [
	| begin |
	begin := DateAndTime now.
	result notFinished.
	result finishAndSetEndTime.
	self assert: result isFinished.
	self assert: (result dateEnd between: begin and: DateAndTime now)
]

{ #category : #tests }
OOMCQResultTest >> testIsAllRight [
	result
		questionResults:
			((1 to: 20)
				collect: [ :element | 
					| mock |
					mock := Mock new.
					mock stub isCorrect willReturn: true.
					mock ]).
	self assert: result isAllRight.
	result questionResults anyOne stub isCorrect willReturn: false.
	self deny: result isAllRight
]

{ #category : #tests }
OOMCQResultTest >> testMarkingScheme [
	| mcq |
	mcq := Mock named: 'mcq'.
	mcq stub markingScheme willReturn: OOStrictScheme.
	mcq stub questions willReturn: Set new.
	result mcq: mcq.
	self assert: result markingScheme equals: OOStrictScheme
]

{ #category : #tests }
OOMCQResultTest >> testNumberOfCorrectQuestions [
	result
		questionResults:
			(self
				generateQuestionsResultWithCorrect: #(false false true true false false true false true false false false true true true false false false true true)).
	self assert: result numberOfCorrectQuestions equals: 9
]

{ #category : #tests }
OOMCQResultTest >> testPrintResultOn [
	result questionResults: (self generateQuestionsResultWithResults: self resultReturning5).
	self assert: (String streamContents: [ :s | result printResultOn: s ]) equals: '5/20'
]

{ #category : #tests }
OOMCQResultTest >> testResult [
	result questionResults: (self generateQuestionsResultWithResults: self resultReturning5).
	self assert: result result equals: 5
]

{ #category : #tests }
OOMCQResultTest >> testResultFromNonFinishedMCQ [
	result notFinished.
	self should: [ result result ] raise: OOMCQNotFinished
]
