"
I'm a strict with penalty marking scheme.

I compute the score of a question as next:

All good = 1
Else =  -1
"
Class {
	#name : #OOStrictWithPenalityScheme,
	#superclass : #OOAbstractMarkingSchemeStrategy,
	#category : 'OOnoz-Model-MarkingScheme'
}

{ #category : #result }
OOStrictWithPenalityScheme class >> computeResultFrom: aCollection [
	^ aCollection associations
		detect: [ :association | association key isRight ~= association value ]
		ifFound: [ -1 ]
		ifNone: [ 1 ]
]
