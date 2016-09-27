helpers
generate: anInteger questionValid: aBoolean
	^ (1 to: anInteger)
		inject: Set new
		into: [ :coll :ind | 
			| mock |
			mock := Mock named: 'Question' , ind asString.
			aBoolean
				ifTrue: [ mock stub validate willReturn: true ]
				ifFalse: [ mock stub validate willRaise: (OOInvalidQuestion question: mock) ].
			coll add: mock.
			coll ]