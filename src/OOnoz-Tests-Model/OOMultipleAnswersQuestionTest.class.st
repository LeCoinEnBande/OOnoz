"
An OOMultipleAnswersStrategyTest is a test class for testing the behavior of OOMultipleAnswersStrategy
"
Class {
	#name : #OOMultipleAnswersQuestionTest,
	#superclass : #OOAbstractQuestionTest,
	#category : 'OOnoz-Tests-Model-MCQ'
}

{ #category : #accessing }
OOMultipleAnswersQuestionTest >> actualClass [
	^ OOMultipleAnswersQuestion
]

{ #category : #helpers }
OOMultipleAnswersQuestionTest >> maxNumberOfRightAnswers [
	^ self actualClass maxNumberOfRightAnswers
]

{ #category : #helpers }
OOMultipleAnswersQuestionTest >> minNumberOfRightAnswers [
	^ self actualClass minNumberOfRightAnswers 
]
