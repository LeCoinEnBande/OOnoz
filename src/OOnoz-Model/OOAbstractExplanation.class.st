"
I am an abstract explanation of a question.
"
Class {
	#name : #OOAbstractExplanation,
	#superclass : #OOObject,
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #comparing }
OOAbstractExplanation >> = anObject [
	^ self species = anObject species
]

{ #category : #accessing }
OOAbstractExplanation >> explanation [
	^ self subclassResponsibility 
]

{ #category : #testing }
OOAbstractExplanation >> hasExplanation [
	"Hook"

	^ true
]

{ #category : #comparing }
OOAbstractExplanation >> hash [
	^ self species hash hashMultiply
]
