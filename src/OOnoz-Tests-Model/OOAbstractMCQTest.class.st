"
An OOAbstractMCQTest is a test class for testing the behavior of OOAbstractMCQ
"
Class {
	#name : #OOAbstractMCQTest,
	#superclass : #TestCase,
	#instVars : [
		'mcq'
	],
	#category : 'OOnoz-Tests-Model-MCQ'
}

{ #category : #testing }
OOAbstractMCQTest class >> isAbstract [
	^ OOAbstractMCQTest = self
]

{ #category : #accessing }
OOAbstractMCQTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #helpers }
OOAbstractMCQTest >> generate: anInteger questionValid: aBoolean [
	^ (1 to: anInteger)
		inject: Set new
		into: [ :coll :ind | 
			| mock |
			mock := Mock named: 'Question' , ind asString.
			mock stub index willReturn: ind.
			aBoolean
				ifTrue: [ mock stub validate willReturn: true ]
				ifFalse: [ mock stub validate willRaise: (OOInvalidQuestion modelObject: mock) ].
			coll add: mock.
			coll ]
]

{ #category : #'instance creation' }
OOAbstractMCQTest >> newMCQInstance [
	^ self subclassResponsibility
]

{ #category : #running }
OOAbstractMCQTest >> setUp [
	mcq := self newMCQInstance
]

{ #category : #tests }
OOAbstractMCQTest >> testAddQuestion [
	| size |
	size := mcq questions size.
	mcq
		addQuestion:
			(OOAbstractQuestion
				description: 'I am another question'
				answers: (Set with: (OOAnswer text: 'I am an answer' isRight: true))).
	self assert: mcq questions size equals: size + 1
]

{ #category : #tests }
OOAbstractMCQTest >> testCannotGetTwoTimesTheSameQuestion [
	| size question |
	size := mcq questions size.
	question := OOAbstractQuestion description: 'I am another question' answers: (Set with: (OOAnswer text: 'I am an answer' isRight: true)).
	mcq addQuestion: question.
	self assert: mcq questions size equals: size + 1.
	mcq addQuestion: question.
	self assert: mcq questions size equals: size + 1
]

{ #category : #tests }
OOAbstractMCQTest >> testCreateMemento [
	| copy |
	copy := mcq createMemento.
	self assert: copy equals: mcq.
	self deny: copy == mcq.
	mcq title: 'Other'.
	self deny: copy = mcq
]

{ #category : #tests }
OOAbstractMCQTest >> testDefaultLevel [
	self assert: self newMCQInstance level equals: 1
]

{ #category : #tests }
OOAbstractMCQTest >> testDefaultState [
	self assert: self newMCQInstance state equals: #inactive
]

{ #category : #tests }
OOAbstractMCQTest >> testEquals [
	| instance2 |
	instance2 := self newMCQInstance.
	self assert: mcq = instance2 description: 'The two intances should be equal.'.
	self assert: mcq copy = mcq description: 'The two instances should be equal'.
	instance2 title: 'Another title'.
	self deny: mcq = instance2 description: 'The two intances should not be equal because the second is different.'.
	instance2 := self newMCQInstance
		level: 2;
		yourself.
	self deny: mcq = instance2 description: 'The two intances should not be equal because the second is different.'.
	instance2 := self newMCQInstance
		state: #active;
		yourself.
	self deny: mcq = instance2 description: 'The two intances should not be equal because the second is different.'.
	instance2 := self newMCQInstance
		imagePath: 'a/Path/To/Image.png';
		yourself.
	self deny: mcq = instance2 description: 'The two intances should not be equal because the second is different.'.
	instance2 := self newMCQInstance
		backgroundPath: 'another/Path.png';
		yourself.
	self deny: mcq = instance2 description: 'The two intances should not be equal because the second is different.'
]

{ #category : #tests }
OOAbstractMCQTest >> testInvalidateMCQWithEmptyTitle [
	mcq questions: (self generate: self actualClass minimumNumberOfQuestions questionValid: true).
	mcq title: ''.
	self should: [ mcq validate ] raise: OOInvalidMCQ description: 'The MCQ should have a title non empty to be valid.'
]

{ #category : #tests }
OOAbstractMCQTest >> testInvalidateMCQWithInvalidQuestions [
	mcq questions: (self generate: self actualClass minimumNumberOfQuestions questionValid: false).
	self
		should: [ mcq validate ]
		raise: OOInvalidQuestion
		description: 'A MCQ should not be valid if the questions are not valid.'
]

{ #category : #tests }
OOAbstractMCQTest >> testInvalidateMCQWithNotEnoughtQuestions [
	mcq questions: (self generate: self actualClass minimumNumberOfQuestions - 1 questionValid: true).
	self
		should: [ mcq validate ]
		raise: OOInvalidMCQ
		description: 'A MCQ should have a minimum number of questions to be valide.'
]

{ #category : #tests }
OOAbstractMCQTest >> testInvalidateMCQWithTooMuchQuestions [
	mcq questions: (self generate: self actualClass maximumNumberOfQuestions + 1 questionValid: true).
	self
		should: [ mcq validate ]
		raise: OOInvalidMCQ
		description: 'A MCQ should have a maximum number of questions to be valide.'
]

{ #category : #tests }
OOAbstractMCQTest >> testInvalidateMCQWithoutMarkingScheme [
	mcq questions: (self generate: self actualClass minimumNumberOfQuestions questionValid: true).
	mcq markingScheme: nil.
	self should: [ mcq validate ] raise: OOInvalidMCQ description: 'The MCQ should have a marking scheme to be valid.'
]

{ #category : #tests }
OOAbstractMCQTest >> testInvalidateMCQWithoutTitle [
	mcq questions: (self generate: self actualClass minimumNumberOfQuestions questionValid: true).
	mcq title: nil.
	self should: [ mcq validate ] raise: OOInvalidMCQ description: 'The MCQ should have a title to be valid.'
]

{ #category : #tests }
OOAbstractMCQTest >> testIsChallenge [
	self deny: self actualClass new isChallenge
]

{ #category : #tests }
OOAbstractMCQTest >> testIsFree [
	mcq price: 30.
	self deny: mcq isFree.
	mcq price: 0.
	self assert: mcq isFree
]

{ #category : #tests }
OOAbstractMCQTest >> testOrderedQuestions [
	mcq questions: (self generate: 20 questionValid: true).
	mcq orderedQuestions doWithIndex: [ :each :index | self assert: each index equals: index ].
	mcq randomOrderer.
	self
		assert:
			(mcq orderedQuestions
				collectWithIndex: [ :each :index | 
					each index = index
						ifTrue: [ 1 ]
						ifFalse: [ 0 ] ]) sum < 20.
	mcq defaultOrderer.
	mcq orderedQuestions doWithIndex: [ :each :index | self assert: each index equals: index ]
]

{ #category : #tests }
OOAbstractMCQTest >> testPrintPrice [
	| mcqTest |
	mcqTest := self newMCQInstance price: 15.
	self assert: mcqTest printPrice equals: '15C'
]

{ #category : #tests }
OOAbstractMCQTest >> testRemoveQuestion [
	| aQuestion sizeBeforeRemoval |
	aQuestion := OOBinaryQuestion description: 'test' answers: (Set with: (OOAnswer text: 'test' isRight: true)).
	mcq addQuestion: aQuestion.
	sizeBeforeRemoval := mcq questions size.
	mcq removeQuestion: aQuestion.
	self assert: mcq questions size equals: sizeBeforeRemoval - 1
]

{ #category : #tests }
OOAbstractMCQTest >> testRestoreFromMemento [
	| copy |
	copy := mcq createMemento.
	mcq title: 'mon super titre'.
	
	self deny: copy = mcq.
	mcq restoreFromMemento: copy.
	
	self assert: copy equals: mcq.

]

{ #category : #tests }
OOAbstractMCQTest >> testValidation [
	mcq questions: (self generate: OOMCQ minimumNumberOfQuestions - 1 questionValid: true).
	self
		should: [ mcq validate ]
		raise: OOInvalidMCQ
		description: 'A MCQ should have a minimum number of questions to be valide.'.
	mcq questions: (self generate: OOMCQ maximumNumberOfQuestions + 1 questionValid: true).
	self
		should: [ mcq validate ]
		raise: OOInvalidMCQ
		description: 'A MCQ should have a maximum number of questions to be valide.'.
	mcq questions: (self generate: OOMCQ minimumNumberOfQuestions questionValid: true).
	self shouldnt: [ mcq validate ] raise: OOInvalidMCQ description: 'The question should be valid.'.
	mcq questions: (self generate: OOMCQ minimumNumberOfQuestions questionValid: false).
	self
		should: [ mcq validate ]
		raise: OOInvalidQuestion
		description: 'A MCQ should not be valid if the questions are not valid.'
]
