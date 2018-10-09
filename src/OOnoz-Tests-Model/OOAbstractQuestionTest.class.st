Class {
	#name : #OOAbstractQuestionTest,
	#superclass : #TestCase,
	#instVars : [
		'question'
	],
	#category : 'OOnoz-Tests-Model-MCQ'
}

{ #category : #testing }
OOAbstractQuestionTest class >> isAbstract [
	^ self = OOAbstractQuestionTest
]

{ #category : #accessing }
OOAbstractQuestionTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #helpers }
OOAbstractQuestionTest >> generateAnswersUpTo: anInteger rights: aSecondInteger [
	| numbersOfRightAnswersLeft |
	numbersOfRightAnswersLeft := aSecondInteger.
	^ (1 to: anInteger)
		inject: Set new
		into: [ :coll :ind | 
			| mock |
			mock := Mock named: 'Answer' , ind asString.
			mock stub index willReturn: ind.
			numbersOfRightAnswersLeft > 0
				ifTrue: [ numbersOfRightAnswersLeft := numbersOfRightAnswersLeft - 1.
					mock stub isRight willReturn: true ]
				ifFalse: [ mock stub isRight willReturn: false ].
			coll add: mock.
			coll ]
]

{ #category : #helpers }
OOAbstractQuestionTest >> maxNumberOfRightAnswers [
	^ self subclassResponsibility
]

{ #category : #helpers }
OOAbstractQuestionTest >> minNumberOfRightAnswers [
	^ self subclassResponsibility
]

{ #category : #helpers }
OOAbstractQuestionTest >> newQuestionInstance [
	^ self actualClass description: 'I am a description' answers: Set new
]

{ #category : #helpers }
OOAbstractQuestionTest >> rightNumberOfAnswers [
	"Hook"

	^ 1
]

{ #category : #running }
OOAbstractQuestionTest >> setUp [
	question := self newQuestionInstance
]

{ #category : #tests }
OOAbstractQuestionTest >> testAddAnswer [
	| size |
	size := question answers size.
	question addAnswer: (OOAnswer text: 'toto' isRight: true).
	self assert: question answers size equals: size + 1
]

{ #category : #tests }
OOAbstractQuestionTest >> testCannotGetTwoTimesTheSameAnswer [
	| size answer |
	size := question answers size.
	answer := OOAnswer text: 'toto' isRight: true.
	question addAnswer: answer.
	self assert: question answers size equals: size + 1.
	question addAnswer: answer.
	self assert: question answers size equals: size + 1
]

{ #category : #tests }
OOAbstractQuestionTest >> testCorrection [
	self deny: question hasCorrection.
	question explanation: (OOExplanation explanation: 'explication').
	self assert: question hasCorrection.
	self assert: question correction equals: 'explication'
]

{ #category : #tests }
OOAbstractQuestionTest >> testCreateMemento [
	| copy |
	copy := question createMemento.
	self assert: copy equals: question.
	self deny: copy == question
]

{ #category : #tests }
OOAbstractQuestionTest >> testEquals [
	| instance2 |
	instance2 := self newQuestionInstance.
	self assert: question = instance2 description: 'The two intances should be equal.'.
	self assert: question copy = question description: 'The two instances should be equal'.
	instance2 media: 'Add a media'.
	self deny: question = instance2 description: 'The two intances should not be equal because the second one has one more answer.'
]

{ #category : #tests }
OOAbstractQuestionTest >> testHasCorrection [
	self deny: question hasCorrection.
	question correction: 'explication'.
	self assert: question hasCorrection
]

{ #category : #tests }
OOAbstractQuestionTest >> testInvalidateQuestionWithBadDescription [
	question answers: (self generateAnswersUpTo: self validAssociation key rights: self validAssociation value).
	question description: nil.
	self should: [ question validate ] raise: OOInvalidQuestion description: 'A Question should have a description to be valide.'
]

{ #category : #tests }
OOAbstractQuestionTest >> testInvalidateQuestionWithEmptyDescription [
	question answers: (self generateAnswersUpTo: self validAssociation key rights: self validAssociation value).
	question description: ''.
	self should: [ question validate ] raise: OOInvalidQuestion description: 'A Question should have a description to be valide.'
]

{ #category : #tests }
OOAbstractQuestionTest >> testInvalidateQuestionWithTooManyAnswers [
	question answers: (self generateAnswersUpTo: self actualClass maximumNumberOfAnswers + 1 rights: 0).
	self
		should: [ question validate ]
		raise: OOInvalidQuestion
		description: 'A Question should have a maximum number of answers to be valide.'
]

{ #category : #tests }
OOAbstractQuestionTest >> testInvalidateQuestionWithoutEnoughtAnswers [
	question answers: (self generateAnswersUpTo: self actualClass minimumNumberOfAnswers - 1 rights: 0).
	self
		should: [ question validate ]
		raise: OOInvalidQuestion
		description: 'A Question should have a minimum number of answers to be valide.'
]

{ #category : #tests }
OOAbstractQuestionTest >> testNotEnoughRightAnswers [
	question answers: (self generateAnswersUpTo: self actualClass minimumNumberOfAnswers rights: self minNumberOfRightAnswers - 1).
	self
		should: [ question validate ]
		raise: OOInvalidQuestion
		description: 'There is not enough right answer for this kind of question.'
]

{ #category : #tests }
OOAbstractQuestionTest >> testOrderedAnswers [
	question answers: (self generateAnswersUpTo: 10 rights: 2).
	self
		assert:
			(question orderedAnswers
				collectWithIndex: [ :each :index | 
					each index = index
						ifTrue: [ 1 ]
						ifFalse: [ 0 ] ]) sum < 10
]

{ #category : #tests }
OOAbstractQuestionTest >> testRemoveAnswer [
	question answers: #('a1' 'a2') asSet.
	self assert: question answers size equals: 2.
	question removeAnswer: 'a1'.
	self assert: question answers size equals: 1
]

{ #category : #tests }
OOAbstractQuestionTest >> testRemoveCorrection [
	question correction: 'correction'.
	self assert: question hasCorrection.
	question removeCorrection.
	self deny: question hasCorrection
]

{ #category : #tests }
OOAbstractQuestionTest >> testRestoreFromMemento [
	| copy |
	copy := question createMemento.
	self assert: copy equals: question.
	question description: 'new desc'.
	self deny: question = copy.
	question restoreFromMemento: copy.
	self assert: copy equals: question
]

{ #category : #tests }
OOAbstractQuestionTest >> testSortedAnswers [
	| answers |
	question answers: (self generateAnswersUpTo: 10 rights: 2).
	answers := question sortedAnswers.
	1 to: 10 do: [ :i | self assert: (answers at: i) index equals: i ]
]

{ #category : #tests }
OOAbstractQuestionTest >> testTooManyRightAnswers [
	question answers: (self generateAnswersUpTo: self actualClass maximumNumberOfAnswers rights: self maxNumberOfRightAnswers + 1).
	self should: [ question validate ] raise: OOInvalidQuestion description: 'There is too many right answer for this kind of question.'
]

{ #category : #tests }
OOAbstractQuestionTest >> testValidAnswers [
	question answers: (self generateAnswersUpTo: self validAssociation key rights: self validAssociation value).
	self shouldnt: [ question validate ] raise: OOInvalidQuestion
]

{ #category : #helpers }
OOAbstractQuestionTest >> validAssociation [
	"I return an association. The key is a number of answer valid for this kind of question. The value is the number of right aswers needed to be valid."

	^ self actualClass minimumNumberOfAnswers -> self rightNumberOfAnswers
]
