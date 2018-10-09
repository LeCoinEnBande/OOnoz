"
An OOPenalitySchemeTest is a test class for testing the behavior of OOPenalityScheme
"
Class {
	#name : #OOPenalitySchemeTest,
	#superclass : #OOAbstractMarkingSchemeStrategyTest,
	#category : 'OOnoz-Tests-Model-MarkingScheme'
}

{ #category : #accessing }
OOPenalitySchemeTest >> actualClass [
	^ OOPenalityScheme
]

{ #category : #helpers }
OOPenalitySchemeTest >> allCheckedResult [
	^ 1 / 3
]

{ #category : #helpers }
OOPenalitySchemeTest >> allWrongResult [
	^ -2 / 3
]

{ #category : #helpers }
OOPenalitySchemeTest >> nothingCheckedResult [
	^ 0
]
