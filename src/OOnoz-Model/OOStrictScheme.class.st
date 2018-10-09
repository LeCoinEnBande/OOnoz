"
I'm a strict marking scheme.

I compute the score of a question as next:

All good answers --> 1
Else --> 0
"
Class {
	#name : #OOStrictScheme,
	#superclass : #OOAbstractMarkingSchemeStrategy,
	#category : 'OOnoz-Model-MarkingScheme'
}

{ #category : #result }
OOStrictScheme class >> computeResultFrom: aCollection [
	^ aCollection associations
		detect: [ :association | association key isRight ~= association value ]
		ifFound: [ 0 ]
		ifNone: [ 1 ]
]
