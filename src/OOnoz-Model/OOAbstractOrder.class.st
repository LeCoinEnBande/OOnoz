"
I am an abstract representation of the order of the QCM's questions.
"
Class {
	#name : #OOAbstractOrder,
	#superclass : #OOObject,
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #testing }
OOAbstractOrder class >> isAbstract [
	^ self = OOAbstractOrder 
]

{ #category : #accessing }
OOAbstractOrder class >> order: aCollection [
	^ self subclassResponsibility
]
