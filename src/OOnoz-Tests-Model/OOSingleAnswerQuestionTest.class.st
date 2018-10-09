"
An OOSingleAnswerStrategyTest is a test class for testing the behavior of OOSingleAnswerStrategy
"
Class {
	#name : #OOSingleAnswerQuestionTest,
	#superclass : #OOAbstractQuestionTest,
	#category : 'OOnoz-Tests-Model-MCQ'
}

{ #category : #accessing }
OOSingleAnswerQuestionTest >> actualClass [
	^ OOSingleAnswerQuestion
]

{ #category : #helpers }
OOSingleAnswerQuestionTest >> maxNumberOfRightAnswers [
	^ 1
]

{ #category : #helpers }
OOSingleAnswerQuestionTest >> minNumberOfRightAnswers [
	^ 1
]
