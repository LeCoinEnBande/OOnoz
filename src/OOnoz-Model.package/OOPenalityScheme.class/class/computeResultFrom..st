result
computeResultFrom: aCollection
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