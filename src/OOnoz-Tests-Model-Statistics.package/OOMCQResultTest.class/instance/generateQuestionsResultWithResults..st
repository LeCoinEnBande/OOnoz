helpers
generateQuestionsResultWithResults: results
	^ (1 to: 20)
		inject: OrderedCollection new
		into: [ :coll :ind | 
			| mock |
			mock := Mock named: 'QuestionResult' , ind asString.
			mock stub result willReturn: (results at: ind).
			coll add: mock.
			coll ]