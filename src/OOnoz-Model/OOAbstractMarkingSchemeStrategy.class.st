"
I represent a marking scheme strategy.

I'm using by questions and I compute the results for them.
"
Class {
	#name : #OOAbstractMarkingSchemeStrategy,
	#superclass : #OOObject,
	#category : 'OOnoz-Model-MarkingScheme'
}

{ #category : #result }
OOAbstractMarkingSchemeStrategy class >> computeResultFrom: aDictionary [
	"I am the main method of the marking strategy. I take as parameter a dictionary with answers avec keys and the user response as value. I should return the result for the question for my kind of marking."

	^ self subclassResponsibility
]

{ #category : #testing }
OOAbstractMarkingSchemeStrategy class >> isAbstract [
	^ self = OOAbstractMarkingSchemeStrategy
]
