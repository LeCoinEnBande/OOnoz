"
I am a question with only two choices. Only one of those two choices is right. 
"
Class {
	#name : #OOBinaryQuestion,
	#superclass : #OOAbstractQuestion,
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #magicNumbers }
OOBinaryQuestion class >> maxNumberOfRightAnswers [
	^ 1
]

{ #category : #magicNumbers }
OOBinaryQuestion class >> maximumNumberOfAnswers [
	^ 2
]

{ #category : #magicNumbers }
OOBinaryQuestion class >> minNumberOfRightAnswers [
	^ 1
]

{ #category : #magicNumbers }
OOBinaryQuestion class >> minimumNumberOfAnswers [
	^ 2
]
