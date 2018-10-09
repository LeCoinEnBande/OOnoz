"
An OOAbstractMarkingSchemeStrategyTest is a test class for testing the behavior of OOAbstractMarkingSchemeStrategy
"
Class {
	#name : #OOAbstractMarkingSchemeStrategyTest,
	#superclass : #TestCase,
	#instVars : [
		'markingStrategy'
	],
	#category : 'OOnoz-Tests-Model-MarkingScheme'
}

{ #category : #testing }
OOAbstractMarkingSchemeStrategyTest class >> isAbstract [
	^ self = OOAbstractMarkingSchemeStrategyTest
]

{ #category : #accessing }
OOAbstractMarkingSchemeStrategyTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #helpers }
OOAbstractMarkingSchemeStrategyTest >> allCheckedResult [
	"This method should return the result for the case where all answers are checked for the testing answers"

	^ self subclassResponsibility
]

{ #category : #helpers }
OOAbstractMarkingSchemeStrategyTest >> allRightResult [
	"This is a Hook for the subclasses"

	^ 1
]

{ #category : #helpers }
OOAbstractMarkingSchemeStrategyTest >> allWrongResult [
	"This is a Hook for the subclasses"

	^ 0
]

{ #category : #helpers }
OOAbstractMarkingSchemeStrategyTest >> answers [
	^ {('Answer1' -> true).
	('Answer2' -> false).
	('Answer3' -> true).
	('Answer4' -> true).
	('Answer5' -> false)} collect: [ :asso | OOAnswer text: asso key isRight: asso value ]
]

{ #category : #helpers }
OOAbstractMarkingSchemeStrategyTest >> nothingCheckedResult [
	"This method should return the result for the case where no answer is checked for the testing answers"

	^ self subclassResponsibility
]

{ #category : #running }
OOAbstractMarkingSchemeStrategyTest >> setUp [
	super setUp.
	markingStrategy := self actualClass new
]

{ #category : #tests }
OOAbstractMarkingSchemeStrategyTest >> testAllChecked [
	| answerMap |
	answerMap := Dictionary new.
	self answers
		do: [ :answer | answerMap at: answer put: true ].
	self
		assert: (self actualClass computeResultFrom: answerMap)
		equals: self allCheckedResult
]

{ #category : #tests }
OOAbstractMarkingSchemeStrategyTest >> testAllFalseAnswers [
	| answerMap |
	answerMap := Dictionary new.
	self answers do: [ :answer | answerMap at: answer put: answer isRight not ].
	self assert: (self actualClass computeResultFrom: answerMap) equals: self allWrongResult
]

{ #category : #tests }
OOAbstractMarkingSchemeStrategyTest >> testAllRightAnswers [
	| answerMap |
	answerMap := Dictionary new.
	self answers
		do: [ :answer | answerMap at: answer put: answer isRight ].
	self
		assert: (self actualClass computeResultFrom: answerMap)
		equals: self allRightResult
]

{ #category : #tests }
OOAbstractMarkingSchemeStrategyTest >> testNothingAnswerd [
	| answerMap |
	answerMap := Dictionary new.
	self answers
		do: [ :answer | answerMap at: answer put: false ].
	self
		assert: (self actualClass computeResultFrom: answerMap)
		equals: self nothingCheckedResult
]
