"
I am used as a Nil Object Pattern for explanations.
"
Class {
	#name : #OONilExplanation,
	#superclass : #OOAbstractExplanation,
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #accessing }
OONilExplanation >> explanation [
	^ 'Pas de correction fournie.'
]

{ #category : #testing }
OONilExplanation >> hasExplanation [
	^ false
]
