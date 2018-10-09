"
I'm a penalty marking scheme. 

I compute the score of a question as next:

Checked OK --> 1
Checked KO --> -1
Not checked --> 0

Result = (OK - KO) / nb right answers

Ex: answer (1 true 0 false)  userChoice (1 true 0 false) --> currentResult
1  1   --> 1/1
1  0   --> 1/2
0  1   --> 0/2
0  0   --> 0/2
1  1   --> 1/3

Result = (2 - 1) / 3 = 1/3
"
Class {
	#name : #OOPenalityScheme,
	#superclass : #OOAbstractMarkingSchemeStrategy,
	#category : 'OOnoz-Model-MarkingScheme'
}

{ #category : #result }
OOPenalityScheme class >> computeResultFrom: aCollection [
	| result |
	result := 0.
	aCollection
		keysAndValuesDo: [ :answer :bool | 
			result := bool
				ifTrue: [ answer isRight
						ifTrue: [ result + 1 ]
						ifFalse: [ result - 1 ] ]
				ifFalse: [ result ] ].
	^ result / (aCollection keys select: #isRight) size
]
