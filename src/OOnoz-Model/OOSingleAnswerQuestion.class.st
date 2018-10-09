"
I am a question with only one right answer. I can have between 2 and 6 answers.
"
Class {
	#name : #OOSingleAnswerQuestion,
	#superclass : #OOAbstractQuestion,
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #magicNumbers }
OOSingleAnswerQuestion class >> maxNumberOfRightAnswers [
	^ 1
]

{ #category : #magicNumbers }
OOSingleAnswerQuestion class >> maximumNumberOfAnswers [
	^ 6
]

{ #category : #magicNumbers }
OOSingleAnswerQuestion class >> minNumberOfRightAnswers [
	^ 1
]

{ #category : #magicNumbers }
OOSingleAnswerQuestion class >> minimumNumberOfAnswers [
	^ 2
]
