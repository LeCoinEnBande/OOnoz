tests
testOrderedQuestions
	mcq questions: (self generate: 20 questionValid: true).
	mcq orderedQuestions doWithIndex: [ :each :index | self assert: each index equals: index ].
	mcq randomOrderer.
	self
		assert:
			(mcq orderedQuestions
				collectWithIndex: [ :each :index | 
					each index = index
						ifTrue: [ 1 ]
						ifFalse: [ 0 ] ]) sum < 20.
	mcq defaultOrderer.
	mcq orderedQuestions doWithIndex: [ :each :index | self assert: each index equals: index ]