helpers
generate: anInteger questionValid: aBoolean
	^ (1 to: anInteger)
		inject: Set new
		into: [ :coll :ind | 
			| mock |
			mock := Mock named: 'Question' , ind asString.
			mock stub index willReturn: ind.
			aBoolean
				ifTrue: [ mock stub validate willReturn: true ]
				ifFalse: [ mock stub validate willRaise: (OOInvalidQuestion modelObject: mock) ].
			coll add: mock.
			coll ]