"
An OOBinaryAnswerStrategyTest is a test class for testing the behavior of OOBinaryAnswerStrategy
"
Class {
	#name : #OOBinaryQuestionTest,
	#superclass : #OOAbstractQuestionTest,
	#category : 'OOnoz-Tests-Model-MCQ'
}

{ #category : #accessing }
OOBinaryQuestionTest >> actualClass [
	^ OOBinaryQuestion
]

{ #category : #helpers }
OOBinaryQuestionTest >> maxNumberOfRightAnswers [
	^ 1
]

{ #category : #helpers }
OOBinaryQuestionTest >> minNumberOfRightAnswers [
	^ 1
]
